import 'package:studio_accordo_app_mobile/features/tuning/service/pitch_detector_service.dart';
import 'package:studio_accordo_app_mobile/features/tuning/service/yin_detector.dart';
import 'package:studio_accordo_app_mobile/features/tuning/service/pitch_math.dart';
import 'package:studio_accordo_app_mobile/features/tuning/model/pitch_reading.dart';

import 'package:injectable/injectable.dart';
import 'package:record/record.dart';

import 'dart:typed_data';
import 'dart:isolate';
import 'dart:async';

@Injectable(as: PitchDetectorService)
class MicrophonePitchDetectorService implements PitchDetectorService {
  static const _sampleRate = 44100;

  static const _window = 4096;

  static const _searchMinHz = 52.0;
  static const _searchMaxHz = 500.0;

  static const _silenceRms = 0.01;

  static const _minConfidence = 0.6;

  static const _medianLength = 5;

  static const _stableFrames = 3;

  static const _newNoteCents = 80.0;

  static const _releaseAfter = Duration(milliseconds: 400);

  final _controller = StreamController<PitchReading?>.broadcast();
  final _recorder = AudioRecorder();
  final _ring = Float64List(_window);
  final _history = <double>[];
  final _sinceVoiced = Stopwatch();

  StreamSubscription<Uint8List>? _audioSubscription;
  ReceivePort? _fromWorker;
  SendPort? _toWorker;
  Isolate? _isolate;
  Completer<void>? _workerReady;

  double _referenceHz = 440.0;
  int _filled = 0;
  int? _carryByte;
  bool _busy = false;
  bool _starting = false;
  bool _running = false;
  bool _cancelled = false;
  bool _lastEmittedNull = true;

  @override
  Stream<PitchReading?> get readings => _controller.stream;

  @override
  Future<void> start({required double referenceHz}) async {
    _referenceHz = referenceHz;
    if (_running || _starting) return;

    _starting = true;
    _cancelled = false;

    try {
      if (!await _recorder.hasPermission()) return;

      await _startWorker();

      final stream = await _recorder.startStream(
        const RecordConfig(
          encoder: AudioEncoder.pcm16bits,
          sampleRate: _sampleRate,
          numChannels: 1,
        ),
      );

      if (_cancelled) {
        await _recorder.stop();
        _stopWorker();
        return;
      }

      _resetState();
      _audioSubscription = stream.listen(_onAudio);
      _running = true;
    } finally {
      _starting = false;
    }
  }

  @override
  Future<void> stop() async {
    _running = false;
    _cancelled = true;

    await _audioSubscription?.cancel();
    _audioSubscription = null;

    if (await _recorder.isRecording()) await _recorder.stop();

    _stopWorker();
    _resetState();
  }

  @override
  Future<void> dispose() async {
    await stop();
    await _recorder.dispose();
    await _controller.close();
  }

  void _onAudio(Uint8List chunk) {
    var bytes = chunk;
    final carry = _carryByte;

    if (carry != null) {
      bytes = Uint8List(chunk.length + 1)
        ..[0] = carry
        ..setRange(1, chunk.length + 1, chunk);
    }

    final sampleCount = bytes.length ~/ 2;
    _carryByte = bytes.length.isOdd ? bytes.last : null;

    if (sampleCount == 0) return;

    _push(ByteData.sublistView(bytes), sampleCount);
    _analyzeLatestWindow();
  }

  void _push(ByteData data, int sampleCount) {
    final keep = sampleCount >= _window ? _window : sampleCount;
    final first = sampleCount - keep;

    if (keep < _window) _ring.setRange(0, _window - keep, _ring, keep);

    for (var i = 0; i < keep; i++) {
      _ring[_window - keep + i] =
          data.getInt16(2 * (first + i), Endian.little) / 32768.0;
    }

    _filled = _filled + keep > _window ? _window : _filled + keep;
  }

  void _analyzeLatestWindow() {
    if (_filled < _window || _busy || _toWorker == null) return;

    if (PitchMath.rms(_ring) < _silenceRms) {
      _onFrame(null, 0);
      return;
    }

    _busy = true;
    _toWorker!.send(
      TransferableTypedData.fromList([Float64List.fromList(_ring)]),
    );
  }

  Future<void> _startWorker() async {
    _workerReady = Completer<void>();
    _fromWorker = ReceivePort()..listen(_onWorkerMessage);

    _isolate = await Isolate.spawn(
      _workerMain,
      _WorkerInit(_fromWorker!.sendPort, _sampleRate),
    );

    await _workerReady!.future;
  }

  void _stopWorker() {
    _toWorker?.send(null);
    _fromWorker?.close();
    _isolate?.kill(priority: Isolate.immediate);

    _toWorker = null;
    _fromWorker = null;
    _isolate = null;
    _busy = false;
  }

  void _onWorkerMessage(Object? message) {
    if (message is SendPort) {
      _toWorker = message;
      _workerReady?.complete();
      return;
    }

    _busy = false;

    final result = message as List;
    final hz = result[0] as double;

    _onFrame(hz < 0 ? null : hz, result[1] as double);
  }

  void _onFrame(double? hz, double confidence) {
    if (hz == null || confidence < _minConfidence) {
      if (_sinceVoiced.elapsed >= _releaseAfter) {
        _history.clear();
        _emit(null);
      }
      return;
    }

    _sinceVoiced
      ..reset()
      ..start();

    if (_history.isNotEmpty &&
        PitchMath.cents(hz, _median()).abs() > _newNoteCents) {
      _history.clear();
    }

    _history.add(hz);
    if (_history.length > _medianLength) _history.removeAt(0);
    if (_history.length < _stableFrames) return;

    _emit(PitchMath.reading(_median(), _referenceHz));
  }

  double _median() {
    final sorted = [..._history]..sort();

    return sorted[sorted.length ~/ 2];
  }

  void _emit(PitchReading? reading) {
    if (reading == null && _lastEmittedNull) return;

    _lastEmittedNull = reading == null;
    if (!_controller.isClosed) _controller.add(reading);
  }

  void _resetState() {
    _history.clear();
    _filled = 0;
    _carryByte = null;
    _busy = false;
    _lastEmittedNull = true;
    _sinceVoiced
      ..reset()
      ..start();
  }
}

class _WorkerInit {
  final SendPort replyTo;
  final int sampleRate;

  const _WorkerInit(this.replyTo, this.sampleRate);
}

void _workerMain(_WorkerInit init) {
  final commands = ReceivePort();
  init.replyTo.send(commands.sendPort);

  final yin = YinDetector(
    sampleRate: init.sampleRate,
    minFrequency: MicrophonePitchDetectorService._searchMinHz,
    maxFrequency: MicrophonePitchDetectorService._searchMaxHz,
  );

  commands.listen((message) {
    if (message == null) {
      commands.close();
      return;
    }

    final frame = (message as TransferableTypedData)
        .materialize()
        .asFloat64List();
    final result = yin.detect(frame);

    init.replyTo.send(<double>[result.frequency ?? -1, result.confidence]);
  });
}
