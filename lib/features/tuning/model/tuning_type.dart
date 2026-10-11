import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';

import 'package:flutter/widgets.dart';

enum TuningType {
  standard(['E2', 'A2', 'D3', 'G3', 'B3', 'E4']),
  dropD(['D2', 'A2', 'D3', 'G3', 'B3', 'E4']),
  halfStepDown(['Eb2', 'Ab2', 'Db3', 'Gb3', 'Bb3', 'Eb4']),
  halfStepUp(['F2', 'Bb2', 'Eb3', 'Ab3', 'C4', 'F4']),

  chromatic([]);

  const TuningType(this.strings);

  final List<String> strings;

  bool get isChromatic => this == TuningType.chromatic;

  String label(BuildContext context) {
    final l10n = context.l10n;

    return switch (this) {
      TuningType.standard => l10n.tuningStandard,
      TuningType.dropD => l10n.tuningDropD,
      TuningType.halfStepDown => l10n.tuningHalfStepDown,
      TuningType.halfStepUp => l10n.tuningHalfStepUp,
      TuningType.chromatic => l10n.tuningChromatic,
    };
  }
}
