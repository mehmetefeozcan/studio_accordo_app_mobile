import 'package:flutter/material.dart';

import '../../theme/text_theme.dart';

enum AppButtonSize { sm, md, lg }

/// Labels sit on the pass scale. Buttons carry no radius: see
/// design/CONSTITUTION.md §6.
extension AppButtonMetrics on AppButtonSize {
  double get minHeight => switch (this) {
    AppButtonSize.sm => 44,
    AppButtonSize.md => 48,
    AppButtonSize.lg => 56,
  };

  EdgeInsets get padding => switch (this) {
    AppButtonSize.sm => const EdgeInsets.symmetric(horizontal: 14),
    AppButtonSize.md => const EdgeInsets.symmetric(horizontal: 18),
    AppButtonSize.lg => const EdgeInsets.symmetric(horizontal: 26),
  };

  TextStyle get textStyle => switch (this) {
    AppButtonSize.sm => AppTextStyles.gloss(AppPass.four),
    AppButtonSize.md => AppTextStyles.pass(AppPass.four),
    AppButtonSize.lg => AppTextStyles.pass(AppPass.three),
  };
}

enum AppButtonTone { normal, quiet }
