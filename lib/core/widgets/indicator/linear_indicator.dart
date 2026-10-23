import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:flutter/material.dart';

/// A value read positionally — one of the two places the direction permits a
/// line at all. 2 px, square ends, never a rounded pill.
///
/// Set [isTempo] when the value being read is a tempo; that is the only case
/// in which the accent may fill it.
class LinearIndicator extends StatelessWidget {
  final double progress;
  final bool isTempo;
  final Color? activeColor;
  final Color? passiveColor;

  const LinearIndicator({
    super.key,
    required this.progress,
    this.isTempo = false,
    this.activeColor,
    this.passiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final ds = context.ds;

    return SizedBox(
      height: 2,
      child: LinearProgressIndicator(
        borderRadius: BorderRadius.zero,
        backgroundColor: passiveColor ?? ds.groundLift,
        valueColor: AlwaysStoppedAnimation(
          activeColor ?? (isTempo ? ds.tempo : ds.passage),
        ),
        value: (progress / 100).clamp(0.0, 1.0),
      ),
    );
  }
}
