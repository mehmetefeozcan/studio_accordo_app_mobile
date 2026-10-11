import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:flutter/material.dart';

class LinearIndicator extends StatelessWidget {
  /// Verilmezse `ds.actionBg` / `ds.lineSeparator`.
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
      color: passiveColor ?? context.ds.lineSeparator,
      valueColor: AlwaysStoppedAnimation(activeColor ?? context.ds.actionBg),
      value: progress / 100,
    );
  }
}
