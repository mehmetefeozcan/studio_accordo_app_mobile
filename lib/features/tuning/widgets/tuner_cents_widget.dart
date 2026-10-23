import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/tuning/store/tuning_store.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

/// Tuning state without a new hue.
///
/// In tune reads tight: the passage ink, pass 2 weight, negative tracking.
/// Out of tune reads loose: the gloss ink, lighter weight, open tracking.
/// The word (Akortta / Pes / Tiz) and the sign carry the same information, so
/// state is never colour alone.
///
/// This is open decision 1 in design/CONSTITUTION.md §13: faithful to the
/// direction, not yet tested with a child at arm's length.
class TunerCentsWidget extends StatelessWidget {
  final TuningStore store;

  const TunerCentsWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final cents = store.reading?.cents;
        final inTune = store.isInTune;

        final ink = inTune ? context.ds.passage : context.ds.gloss;

        final value = inTune
            ? context.measured(AppPass.two).copyWith(color: ink)
            : context
                  .measured(AppPass.two)
                  .copyWith(
                    color: ink,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.04 * AppPass.two.size,
                  );

        return Semantics(
          liveRegion: true,
          label: label(context, cents, inTune),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cents == null ? "—" : signedCents(cents), style: value),
              SizedBox(height: context.gapMicro),
              Text(
                label(context, cents, inTune),
                style: inTune
                    ? context.pass(AppPass.four).copyWith(color: ink)
                    : context.gloss(AppPass.three).copyWith(color: ink),
              ),
            ],
          ),
        );
      },
    );
  }

  String signedCents(double cents) {
    final rounded = cents.round();

    if (rounded == 0) return "0";

    return rounded > 0 ? "+$rounded" : "−${rounded.abs()}";
  }

  String label(BuildContext context, double? cents, bool inTune) {
    if (cents == null) return "";
    if (inTune) return context.l10n.inTune;

    return cents < 0 ? context.l10n.flat : context.l10n.sharp;
  }
}
