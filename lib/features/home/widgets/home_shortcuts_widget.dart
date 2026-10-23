import 'package:studio_accordo_app_mobile/features/home/widgets/home_shortcut_button_widget.dart';
import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/core/routing/routes/main/main_routes.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/assets/app_assets.dart';

import 'package:flutter/material.dart';

class HomeShortcutsWidget extends StatelessWidget {
  const HomeShortcutsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final shortcuts = [
      ShortCutParams(
        path: MainRoutes.tuning,
        icon: AppAssets.icons.tuner,
        text: context.l10n.tuning,
      ),
      ShortCutParams(
        path: MainRoutes.metronome,
        icon: AppAssets.icons.metronome,
        text: context.l10n.metronome,
      ),
      ShortCutParams(
        path: MainRoutes.noteScan,
        icon: AppAssets.icons.scan,
        text: context.l10n.noteScan,
      ),
    ];

    // Each shortcut takes the width of its own label. Three equal columns
    // would force a word like "Metronom" to break mid-word, and an equal
    // grid is the tile row this direction is leaving behind.
    return Wrap(
      spacing: context.gapOpen,
      runSpacing: context.gapClose,
      children: shortcuts
          .map((params) => HomeShortcutButtonWidget(params: params))
          .toList(),
    );
  }
}
