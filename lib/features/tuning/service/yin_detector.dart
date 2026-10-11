import 'dart:typed_data';
import 'dart:math';

class YinResult {
  final double? frequency;

  final double confidence;

  const YinResult(this.frequency, this.confidence);

  static const unvoiced = YinResult(null, 0);
}

class YinDetector {
  final int sampleRate;
  final double minFrequency;
  final double maxFrequency;

  final double threshold;

  final double fallbackThreshold;

  final int maxIntegrationWindow;

  YinDetector({
    required this.sampleRate,
    required this.minFrequency,
    required this.maxFrequency,
    this.threshold = 0.15,
    this.fallbackThreshold = 0.35,
    this.maxIntegrationWindow = 2048,
  }) : assert(minFrequency > 0 && minFrequency < maxFrequency);

  late final int _tauMin = max(2, (sampleRate / maxFrequency).floor());
  late final int _tauMax = (sampleRate / minFrequency).ceil();
  late final Float64List _cmnd = Float64List(_tauMax + 2);

  int get minFrameLength => 2 * _tauMax + 2;

  YinResult detect(Float64List x) {
    final n = x.length;
    final w = min(maxIntegrationWindow, n - _tauMax - 1);

    if (w < _tauMax) {
      throw ArgumentError(
        'Çerçeve çok kısa: $n örnek var, en az $minFrameLength gerekli '
        '(minFrequency=$minFrequency Hz, sampleRate=$sampleRate).',
      );
    }

    final cmnd = _cmnd;
    cmnd[0] = 1.0;
    var running = 0.0;

    for (var lag = 1; lag <= _tauMax + 1; lag++) {
      var sum = 0.0;
      for (var j = 0; j < w; j++) {
        final d = x[j] - x[j + lag];
        sum += d * d;
      }
      running += sum;
      cmnd[lag] = running == 0 ? 1.0 : sum * lag / running;
    }

    var tauEstimate = -1;
    var tau = _tauMin;

    while (tau <= _tauMax) {
      if (cmnd[tau] < threshold) {
        while (tau + 1 <= _tauMax && cmnd[tau + 1] < cmnd[tau]) {
          tau++;
        }
        tauEstimate = tau;
        break;
      }
      tau++;
    }

    if (tauEstimate == -1) {
      var best = _tauMin;
      for (var t = _tauMin + 1; t <= _tauMax; t++) {
        if (cmnd[t] < cmnd[best]) best = t;
      }
      if (cmnd[best] > fallbackThreshold) return YinResult.unvoiced;
      tauEstimate = best;
    }

    final a = cmnd[tauEstimate - 1];
    final b = cmnd[tauEstimate];
    final c = cmnd[tauEstimate + 1];
    final denominator = a - 2 * b + c;
    final shift = denominator.abs() < 1e-12 ? 0.0 : 0.5 * (a - c) / denominator;
    final refinedTau = tauEstimate + shift.clamp(-1.0, 1.0);

    return YinResult(sampleRate / refinedTau, (1.0 - b).clamp(0.0, 1.0));
  }
}
