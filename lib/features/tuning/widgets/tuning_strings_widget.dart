import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/tuning/store/tuning_store.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

/// Six strings at pass 4. No boxes: selection is a fill on the lifted ground,
/// and a string already tuned shifts to the gloss ink at italic — a
/// non-colour cue as well as a colour one.
class TuningStringsWidget extends StatelessWidget {
  final TuningStore store;

  const TuningStringsWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.strings,
          style: context.gloss(AppPass.three).copyWith(color: context.ds.gloss),
        ),
        SizedBox(height: context.gapTight),
        Observer(
          builder: (context) {
            final strings = store.strings;

            return Row(
              children: List.generate(
                strings.length,
                (index) => Expanded(
                  child: buildString(context, strings[index], index),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildString(BuildContext context, String note, int index) {
    final selected = index == store.selectedStringIndex;
    final tuned = store.tunedStrings.contains(index);

    final style = tuned
        ? context.gloss(AppPass.four).copyWith(color: context.ds.gloss)
        : context.pass(AppPass.four).copyWith(color: context.ds.passage);

    return Semantics(
      button: true,
      selected: selected,
      child: InkWell(
        onTap: () => store.selectString(index),
        child: Container(
          constraints: const BoxConstraints(minHeight: 48),
          color: selected ? context.ds.groundLift : Colors.transparent,
          alignment: Alignment.center,
          child: Text(note, style: style),
        ),
      ),
    );
  }
}
