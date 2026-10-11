import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/tuning/store/tuning_store.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

class TuningStringsWidget extends StatelessWidget {
  final TuningStore store;

  const new({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.space2,
      children: [
        Text(
          context.l10n.strings.toUpperCase(),
          style: context.titleSmall!.copyWith(color: context.ds.inkSubtle),
        ),
        Observer(
          builder: (context) {
            final strings = store.strings;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: context.space2,
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
    final inTune = store.tunedStrings.contains(index);
    final green = context.ds.signalTrue;

    final onGreen = context.ds.onSignalTrue;

    return GestureDetector(
      onTap: () => store.selectString(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(
          vertical: context.space3,
          horizontal: context.space2,
        ),
        decoration: BoxDecoration(
          color: inTune
              ? green
              : selected
              ? context.ds.actionBg
              : context.ds.bgRaised,
          borderRadius: BorderRadius.circular(context.radiusSm),
          border: Border.all(
            width: selected ? 2 : 1,
            color: selected
                ? context.ds.actionBg
                : inTune
                ? green
                : context.ds.lineSeparator,
          ),
        ),
        child: Center(
          child: Text(
            note,
            style: context.bodyMedium!.copyWith(
              color: inTune
                  ? onGreen
                  : selected
                  ? context.ds.actionFg
                  : context.ds.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
