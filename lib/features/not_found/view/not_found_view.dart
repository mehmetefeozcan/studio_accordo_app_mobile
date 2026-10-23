import 'package:studio_accordo_app_mobile/core/widgets/buttons/index.dart';
import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/core/routing/routes/main/main_routes.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

/// Pass 1 heading, pass-2 gloss explanation, actions at the bottom. The
/// framed rest glyph is gone — the direction expresses absence as space, not
/// as an illustration in a rounded plate.
class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

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
                child: Text(
                  context.l10n.noNotes,
                  style: context.pass(AppPass.one),
                ),
              ),
              SizedBox(height: context.gapAfter(AppPass.one)),
              SizedBox(
                width: context.measureOf(AppPass.two),
                child: Text(
                  context.l10n.pageNotFound,
                  style: context
                      .gloss(AppPass.two)
                      .copyWith(color: context.ds.gloss),
                ),
              ),
              const Spacer(),
              CustomElevatedButton(
                onPressed: () => context.go(MainRoutes.home),
                expand: true,
                child: Text(context.l10n.backToToday),
              ),
              SizedBox(height: context.gapTight),
              CustomOutlinedButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go(MainRoutes.home);
                  }
                },
                expand: true,
                child: Text(context.l10n.backToPrevious),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
