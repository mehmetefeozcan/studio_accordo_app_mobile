import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/tuning/store/tuning_store.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

/// The tuner has no passage to repeat, so it uses the one sounding value and
/// contracts everything beneath it. Left-aligned on the shared indent like
/// every other screen — the reading is not centred.
class TunerNoteInfoWidget extends StatelessWidget {
  final TuningStore store;

  const TunerNoteInfoWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final reading = store.reading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: reading?.note ?? '—', style: context.sounding),
                  TextSpan(
                    text: reading == null ? "" : " ${reading.octave}",
                    style: context
                        .measured(AppPass.three)
                        .copyWith(color: context.ds.gloss),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.gapMicro),
            Text(
              reading == null
                  ? "— Hz"
                  : "${reading.frequency.toStringAsFixed(2)} Hz",
              style: context
                  .measuredGloss(AppPass.three)
                  .copyWith(color: context.ds.gloss),
            ),
          ],
        );
      },
    );
  }
}
