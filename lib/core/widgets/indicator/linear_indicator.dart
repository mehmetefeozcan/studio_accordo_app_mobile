import 'package:flutter/material.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';

class LinearIndicator extends StatelessWidget {
  /// Verilmezse `colors.primary` / `colors.outlineVariant`.
  final Color? activeColor;
  final Color? passiveColor;

  /// [0-100] range acceptable
  final double progress;

  const new({
    super.key,
    required this.progress,
    this.activeColor,
    this.passiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      borderRadius: BorderRadius.circular(100),
      color: passiveColor ?? context.colors.outlineVariant,
      valueColor: AlwaysStoppedAnimation(activeColor ?? context.colors.primary),
      value: progress / 100,
    );
  }
}
