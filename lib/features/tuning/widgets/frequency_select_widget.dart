import 'package:studio_accordo_app_mobile/features/tuning/widgets/frequency_select_sheet.dart';
import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/tuning/store/tuning_store.dart';
import 'package:studio_accordo_app_mobile/core/utils/show_bottom_sheet.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

class FrequencySelectWidget extends StatelessWidget {
  final TuningStore store;

  const new({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showGlobalBottomSheet<void>(
          FrequencySelectSheet(store: store),
          padding: context.screenPadding,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.space2,
          horizontal: context.space3,
        ),
        decoration: BoxDecoration(
          color: context.ds.bgRaised,
          borderRadius: BorderRadius.circular(context.radiusPill),
          border: Border.all(width: 1, color: context.ds.lineSeparator),
        ),
        child: Observer(
          builder: (context) => Text(
            "A4 ${store.referenceHz.toStringAsFixed(0)} Hz",
            style: context.numericS.copyWith(
              color: context.ds.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
