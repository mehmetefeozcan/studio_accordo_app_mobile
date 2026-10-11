import 'package:flutter/material.dart';

import '../../theme/text_theme.dart';

enum AppButtonSize { sm, md, lg }

extension AppButtonMetrics on AppButtonSize {
  double get minHeight => switch (this) {
    AppButtonSize.sm => 44,
    AppButtonSize.md => 48,
    AppButtonSize.lg => 56,
  };

  EdgeInsets get padding => switch (this) {
    AppButtonSize.sm => const EdgeInsets.symmetric(horizontal: 12),
    AppButtonSize.md => const EdgeInsets.symmetric(horizontal: 16),
    AppButtonSize.lg => const EdgeInsets.symmetric(horizontal: 24),
  };

  TextStyle get textStyle => switch (this) {
    AppButtonSize.sm => AppTextStyles.caption.copyWith(
      fontWeight: FontWeight.w600,
    ),
    AppButtonSize.md => AppTextStyles.bodyStrong,
    AppButtonSize.lg => AppTextStyles.bodyStrong.copyWith(fontSize: 17),
  };
}

enum AppButtonTone { normal, danger }
