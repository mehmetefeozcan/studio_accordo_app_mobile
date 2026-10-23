import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/tuning/model/reference_frequency.dart';
import 'package:studio_accordo_app_mobile/features/tuning/store/tuning_store.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/widgets/buttons/index.dart';
import 'package:studio_accordo_app_mobile/core/assets/app_assets.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// The sheet sits on the sunken ground — the one case where a second ground
/// value is permitted — and contracts from the heading down to the presets.
class FrequencySelectSheet extends StatelessWidget {
  final TuningStore store;

  const FrequencySelectSheet({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildHeader(context),
          SizedBox(height: context.gapAfter(AppPass.two)),
          buildManualConfig(context),
          SizedBox(height: context.gapAfter(AppPass.two)),
          buildFrequentlyUsed(context),
          SizedBox(height: context.gapClose),
          SizedBox(
            width: context.measureOf(AppPass.two),
            child: Text(
              context.l10n.frequentlyUsedDesc,
              style: context
                  .gloss(AppPass.four)
                  .copyWith(color: context.ds.gloss),
            ),
          ),
          SizedBox(height: context.gapOpen),
          CustomElevatedButton(
            onPressed: () => context.pop(),
            expand: true,
            child: Text(context.l10n.done),
          ),
          SizedBox(height: context.gapClose),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            context.l10n.referenceFrequency,
            style: context.pass(AppPass.three),
          ),
        ),
        Semantics(
          button: true,
          label: MaterialLocalizations.of(context).closeButtonLabel,
          child: InkWell(
            onTap: () => context.pop(),
            child: Padding(
              padding: EdgeInsets.all(context.gapMicro),
              child: SvgPicture.asset(
                AppAssets.icons.close,
                width: 20,
                height: 20,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  context.ds.gloss,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// The nudge controls are plates, not discs, and the value keeps tabular
  /// figures so it does not shift width as it changes.
  Widget buildManualConfig(BuildContext context) {
    return Row(
      children: [
        IconPlateButton(
          icon: AppAssets.icons.minus,
          semanticLabel: "−1 Hz",
          onPressed: () => store.nudgeReferenceHz(-1),
        ),
        Expanded(
          child: Observer(
            builder: (context) => Padding(
              padding: EdgeInsets.symmetric(horizontal: context.gapClose),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: store.referenceHz.toStringAsFixed(0),
                          style: context.measured(AppPass.two),
                        ),
                        TextSpan(
                          text: " Hz",
                          style: context
                              .gloss(AppPass.three)
                              .copyWith(color: context.ds.gloss),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    context.l10n.defaultValue,
                    style: context
                        .gloss(AppPass.four)
                        .copyWith(color: context.ds.gloss),
                  ),
                ],
              ),
            ),
          ),
        ),
        IconPlateButton(
          icon: AppAssets.icons.plus,
          semanticLabel: "+1 Hz",
          onPressed: () => store.nudgeReferenceHz(1),
        ),
      ],
    );
  }

  Widget buildFrequentlyUsed(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.l10n.frequentlyUsed,
          style: context.gloss(AppPass.three).copyWith(color: context.ds.gloss),
        ),
        SizedBox(height: context.gapTight),
        Observer(
          builder: (context) => Row(
            children: ReferenceFrequency.presets
                .map((preset) => Expanded(child: buildPreset(context, preset)))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget buildPreset(BuildContext context, double preset) {
    final selected = preset == store.referenceHz;

    return Semantics(
      button: true,
      selected: selected,
      child: InkWell(
        onTap: () => store.setReferenceHz(preset),
        child: Container(
          constraints: const BoxConstraints(minHeight: 48),
          color: selected ? context.ds.groundLift : Colors.transparent,
          alignment: Alignment.center,
          child: Text(
            preset.toStringAsFixed(0),
            style: selected
                ? context
                      .measured(AppPass.four)
                      .copyWith(color: context.ds.passage)
                : context
                      .measuredGloss(AppPass.four)
                      .copyWith(color: context.ds.gloss),
          ),
        ),
      ),
    );
  }
}
