import 'package:studio_accordo_app_mobile/core/widgets/buttons/index.dart';
import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/core/routing/routes/main/main_routes.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

/// The status is a gloss line, not a pill. `tempo` is not used here: this
/// screen has no tempo.
class UnderConstructionView extends StatelessWidget {
  final String title;

  const UnderConstructionView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.screenPadding.copyWith(
            top: context.frameTop,
            bottom: context.frameBottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              SizedBox(
                width: context.measureOf(AppPass.one),
                child: Text(title, style: context.pass(AppPass.one)),
              ),
              SizedBox(height: context.gapAfter(AppPass.two)),
              Text(
                context.l10n.disabledInThisVersion,
                style: context
                    .gloss(AppPass.two)
                    .copyWith(color: context.ds.gloss),
              ),
              const Spacer(),
              CustomElevatedButton(
                onPressed: () => context.go(MainRoutes.home),
                expand: true,
                child: Text(context.l10n.backToToday),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
