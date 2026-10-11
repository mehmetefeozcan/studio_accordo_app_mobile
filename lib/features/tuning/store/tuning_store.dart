import 'package:studio_accordo_app_mobile/features/tuning/service/pitch_detector_service.dart';
import 'package:studio_accordo_app_mobile/features/tuning/service/pitch_math.dart';
import 'package:studio_accordo_app_mobile/features/tuning/model/reference_frequency.dart';
import 'package:studio_accordo_app_mobile/features/tuning/model/pitch_reading.dart';
import 'package:studio_accordo_app_mobile/features/tuning/model/tuning_type.dart';
import 'package:studio_accordo_app_mobile/core/base/base_store.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'dart:async';

part 'tuning_store.g.dart';

@injectable
class TuningStore = _TuningStore with _$TuningStore;

abstract class _TuningStore extends BaseStore with Store {
  _TuningStore(this._pitchDetector);

  final PitchDetectorService _pitchDetector;

  StreamSubscription<PitchReading?>? _subscription;

  static const centsTolerance = 5.0;

  static const stringCaptureCents = 200.0;

  static const latchReadings = 6;

  @observable
  TuningType selectedTuning = TuningType.standard;

  @observable
  int selectedStringIndex = 0;

  @observable
  Set<int> tunedStrings = {};

  @observable
  double referenceHz = ReferenceFrequency.standard;

  @observable
  PitchReading? reading;

  @computed
  List<String> get strings => selectedTuning.strings;

  @computed
  bool get isInTune =>
      (reading?.cents.abs() ?? double.infinity) <= centsTolerance;

  @action
  void selectTuning(TuningType type) {
    selectedTuning = type;

    selectedStringIndex = 0;
    reading = null;
    _resetConfig();
  }

  @action
  void selectString(int index) {
    selectedStringIndex = index;
  }

  @action
  Future<void> setReferenceHz(double hz) async {
    referenceHz = hz.clamp(ReferenceFrequency.min, ReferenceFrequency.max);

    _resetConfig();

    await _pitchDetector.start(referenceHz: referenceHz);
  }

  Future<void> nudgeReferenceHz(int delta) =>
      setReferenceHz(referenceHz + delta);

  @action
  Future<void> initApp() async {
    _subscription = _pitchDetector.readings.listen(_onReading);

    await _pitchDetector.start(referenceHz: referenceHz);
  }

  @action
  void _onReading(PitchReading? raw) {
    if (raw == null) {
      reading = null;
      _streak = 0;
      return;
    }

    final match = selectedTuning.isChromatic
        ? null
        : _matchString(raw.frequency);

    if (match == null) {
      reading = raw;
      _streak = 0;
      return;
    }

    selectedStringIndex = match.index;

    final (note, octave) = PitchMath.splitNote(strings[match.index]);

    reading = PitchReading(
      note: note,
      octave: octave,
      frequency: raw.frequency,
      cents: match.cents,
    );

    _trackTuned(match.index, match.cents.abs() <= centsTolerance);
  }

  ({int index, double cents})? _matchString(double hz) {
    int? bestIndex;
    var bestCents = double.infinity;

    for (var i = 0; i < strings.length; i++) {
      final target = PitchMath.noteToHz(strings[i], referenceHz);
      final cents = PitchMath.cents(hz, target);

      if (cents.abs() < bestCents.abs()) {
        bestIndex = i;
        bestCents = cents;
      }
    }

    if (bestIndex == null || bestCents.abs() > stringCaptureCents) return null;

    return (index: bestIndex, cents: bestCents);
  }

  int _streak = 0;
  int _streakIndex = -1;

  void _trackTuned(int index, bool inTune) {
    if (!inTune || index != _streakIndex) {
      _streakIndex = index;
      _streak = 0;
    }

    if (!inTune) return;

    _streak++;

    if (_streak >= latchReadings && !tunedStrings.contains(index)) {
      tunedStrings = {...tunedStrings, index};
    }
  }

  void _resetConfig() {
    tunedStrings = {};
    _streak = 0;
    _streakIndex = -1;
  }

  Future<void> disposeStore() async {
    await _subscription?.cancel();
    _subscription = null;

    await _pitchDetector.dispose();
  }
}
