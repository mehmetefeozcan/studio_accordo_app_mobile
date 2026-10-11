import 'package:go_router/go_router.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/routing/routes/main/main_routes.dart';
import 'package:studio_accordo_app_mobile/core/widgets/buttons/custom_elevated_button.dart';
import 'package:studio_accordo_app_mobile/core/widgets/buttons/custom_outlined_button.dart';
import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/core/assets/app_assets.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: context.screenPadding,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.space4,
                  vertical: context.space2,
                ),
                decoration: BoxDecoration(
                  color: context.ds.paper,
                  borderRadius: BorderRadius.circular(context.radiusLg),
                ),
                child: SvgPicture.asset(AppAssets.icons.wholeRestMeasure),
              ),
              SizedBox(height: context.space7),
              Text(context.l10n.noNotes, style: context.displayLarge),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.space4),
                child: Text(
                  context.l10n.pageNotFound,
                  style: context.bodyMedium!.copyWith(
                    color: context.ds.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              CustomElevatedButton(
                onPressed: () {
                  context.go(MainRoutes.home);
                },
                expand: true,
                child: Text(
                  context.l10n.backToToday,
                  style: context.bodyMedium!.copyWith(
                    color: context.ds.actionFg,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: context.space3),
              CustomOutlinedButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go(MainRoutes.home);
                  }
                },
                expand: true,
                child: Text(
                  context.l10n.backToPrevious,
                  style: context.bodyMedium!.copyWith(
                    color: context.ds.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
