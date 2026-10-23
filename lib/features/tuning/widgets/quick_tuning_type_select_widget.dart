import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/tuning/store/tuning_store.dart';
import 'package:studio_accordo_app_mobile/features/tuning/model/tuning_type.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

/// Tuning presets at pass 4. No pills — the selected preset takes the passage
/// ink at pass weight, the rest stay in the gloss voice.
class QuickTuningTypeSelectWidget extends StatelessWidget {
  final TuningStore store;

  const QuickTuningTypeSelectWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(right: context.indent),
      child: Observer(
        builder: (context) => Row(
          spacing: context.gapClose,
          children: TuningType.values
              .map((type) => buildTuningType(context, type))
              .toList(),
        ),
      ),
    );
  }

  Widget buildTuningType(BuildContext context, TuningType type) {
    final selected = type == store.selectedTuning;

    return Semantics(
      button: true,
      selected: selected,
      child: InkWell(
        onTap: () => store.selectTuning(type),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 44),
          child: Center(
            child: Text(
              type.label(context),
              style: selected
                  ? context
                        .pass(AppPass.four)
                        .copyWith(color: context.ds.passage)
                  : context
                        .gloss(AppPass.four)
                        .copyWith(color: context.ds.gloss),
            ),
          ),
        ),
      ),
    );
  }
}
