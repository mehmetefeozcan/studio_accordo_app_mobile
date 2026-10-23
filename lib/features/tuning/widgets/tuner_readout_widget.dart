import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';

import 'package:flutter/material.dart';

/// The deviation scale — the second of the two places the direction permits a
/// line, because the value is read positionally. Square ends, 1–2 px, no
/// tolerance box and no rounded needle.
///
/// The needle is `passage` when in tune and `gloss` when not, matching the
/// readout above it; the position itself is the primary cue.
class TunerReadoutWidget extends StatelessWidget {
  final double? cents;
  final bool inTune;

  const TunerReadoutWidget({
    super.key,
    required this.cents,
    required this.inTune,
  });

  static const scaleCents = 50.0;

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.maybeDisableAnimationsOf(context) ?? false;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        return SizedBox(
          width: width,
          height: 36,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: buildScale(context, width),
              ),
              buildNeedle(context, width, reduceMotion),
            ],
          ),
        );
      },
    );
  }

  /// Nine ticks: the centre and four steps either side. The centre is taller
  /// so zero is findable without a coloured band behind it.
  Widget buildScale(BuildContext context, double width) {
    const count = 9;

    return SizedBox(
      width: width,
      height: 14,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(count, (index) {
          final isCentre = index == count ~/ 2;

          return Container(
            width: 1,
            height: isCentre ? 14 : 7,
            color: isCentre ? context.ds.passage : context.ds.gloss,
          );
        }),
      ),
    );
  }

  Widget buildNeedle(BuildContext context, double width, bool reduceMotion) {
    const needleWidth = 2.0;

    final travel = (width - needleWidth) / 2;
    final ratio = ((cents ?? 0) / scaleCents).clamp(-1.0, 1.0);
    final target = ratio * travel;

    final needle = Container(
      width: needleWidth,
      height: 30,
      color: inTune ? context.ds.passage : context.ds.gloss,
    );

    if (reduceMotion) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Transform.translate(offset: Offset(target, 0), child: needle),
      );
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(end: target),
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOutCubic,
        builder: (context, dx, child) =>
            Transform.translate(offset: Offset(dx, 0), child: child),
        child: needle,
      ),
    );
  }
}
