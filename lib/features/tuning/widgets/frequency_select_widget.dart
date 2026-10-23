import 'package:studio_accordo_app_mobile/features/tuning/widgets/frequency_select_sheet.dart';
import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/tuning/store/tuning_store.dart';
import 'package:studio_accordo_app_mobile/core/utils/show_bottom_sheet.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

/// The reference frequency as plain text in the gloss voice. No pill, no
/// border: it is an annotation on the reading, which is what a gloss is.
class FrequencySelectWidget extends StatelessWidget {
  final TuningStore store;

  const FrequencySelectWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: context.l10n.referenceFrequency,
      child: InkWell(
        onTap: () async {
          await showGlobalBottomSheet<void>(
            FrequencySelectSheet(store: store),
            padding: context.screenPadding,
          );
        },
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 44, minWidth: 44),
          child: Center(
            child: Observer(
              builder: (context) => Text(
                "A4 ${store.referenceHz.toStringAsFixed(0)} Hz",
                style: context
                    .measuredGloss(AppPass.four)
                    .copyWith(color: context.ds.gloss),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
