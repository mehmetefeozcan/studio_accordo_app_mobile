import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/core/routing/routes/main/main_routes.dart';
import 'package:studio_accordo_app_mobile/features/tuning/widgets/index.dart';
import 'package:studio_accordo_app_mobile/features/tuning/store/tuning_store.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/widgets/appbars/index.dart';
import 'package:studio_accordo_app_mobile/core/base/base_store.dart';
import 'package:studio_accordo_app_mobile/core/base/base_view.dart';
import 'package:studio_accordo_app_mobile/core/di/locator.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

/// The dense counterpart to the home screen. There is no passage to repeat,
/// so one sounding value opens the screen and everything below it contracts:
/// reading, then deviation, then presets, then the six strings at pass 4.
class TuningView extends StatefulWidget {
  const TuningView({super.key});

  @override
  State<TuningView> createState() => _TuningViewState();
}

class _TuningViewState extends State<TuningView>
    with BaseViewMixin<TuningView> {
  TuningStore? _store;

  @override
  BaseStore? get store => _store;

  @override
  Future<void> onInit() async {
    _store = getIt<TuningStore>();

    await _store!.initApp();
  }

  @override
  void onDispose() {
    _store?.disposeStore();
  }

  @override
  Widget build(BuildContext context) {
    final store = _store!;

    return Scaffold(
      appBar: SubPageAppbar(
        title: context.l10n.tuning,
        backRoute: MainRoutes.home,
        actions: [
          FrequencySelectWidget(store: store),
          SizedBox(width: context.indent * 0.5),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: context.screenPadding.copyWith(bottom: context.gapLoose),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.gapOpen),
              TunerNoteInfoWidget(store: store),
              SizedBox(height: context.gapAfter(AppPass.one)),
              Observer(
                builder: (context) => TunerReadoutWidget(
                  cents: store.reading?.cents,
                  inTune: store.isInTune,
                ),
              ),
              SizedBox(height: context.gapAfter(AppPass.two)),
              TunerCentsWidget(store: store),
              const Spacer(),
              QuickTuningTypeSelectWidget(store: store),
              SizedBox(height: context.gapAfter(AppPass.three)),
              Observer(
                builder: (context) => store.selectedTuning.isChromatic
                    ? const SizedBox.shrink()
                    : TuningStringsWidget(store: store),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
