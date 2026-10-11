import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/tuning/store/tuning_store.dart';
import 'package:studio_accordo_app_mobile/features/tuning/model/tuning_type.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

/// Hazır akort düzenleri arasında yatay geçiş.
class QuickTuningTypeSelectWidget extends StatelessWidget {
  final TuningStore store;

  const new({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Observer(
        builder: (context) => Row(
          spacing: context.space2,
          children: TuningType.values
              .map((type) => buildTuningType(context, type))
              .toList(),
        ),
      ),
    );
  }

  Widget buildTuningType(BuildContext context, TuningType type) {
    final selected = type == store.selectedTuning;

    return GestureDetector(
      onTap: () => store.selectTuning(type),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.space2,
          horizontal: context.space6,
        ),
        decoration: BoxDecoration(
          color: selected
              ? context.ds.actionBg
              : context.ds.bgRaised,
          borderRadius: BorderRadius.circular(context.radiusPill),
          border: Border.all(width: 1, color: context.ds.lineSeparator),
        ),
        child: Text(
          type.label(context),
          style: context.numericS.copyWith(
            color: selected
                ? context.ds.actionFg
                : context.ds.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
