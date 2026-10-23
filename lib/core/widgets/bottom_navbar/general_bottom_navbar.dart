import 'package:studio_accordo_app_mobile/core/routing/routes/main/main_routes.dart';
import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/assets/app_assets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// The bar sits on the same ground as the content — no raised surface, no
/// fill, no indicator pill. Selection is carried by the ink role and weight,
/// which is a non-colour cue as well as a colour one.
class GeneralBottomNavbar extends StatelessWidget {
  final String currentPath;

  const GeneralBottomNavbar({super.key, required this.currentPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      color: context.ds.ground,
      padding: EdgeInsets.only(
        left: context.indent,
        right: context.indent * 0.5,
        top: context.gapClose,
        bottom: context.isAndroid ? 38.h : 26.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildNavItem(
            context,
            AppAssets.icons.calendar,
            context.l10n.today,
            MainRoutes.home,
          ),
          buildNavItem(
            context,
            AppAssets.icons.book,
            context.l10n.library,
            MainRoutes.library,
          ),
          buildNavItem(
            context,
            AppAssets.icons.progress,
            context.l10n.progress,
            MainRoutes.progress,
          ),
          buildNavItem(
            context,
            AppAssets.icons.profile,
            context.l10n.profile,
            MainRoutes.profile,
          ),
        ],
      ),
    );
  }

  Widget buildNavItem(
    BuildContext context,
    String icon,
    String title,
    String route,
  ) {
    final selected = currentPath == route;
    final color = selected ? context.ds.passage : context.ds.gloss;

    final label = selected
        ? context
              .pass(AppPass.four)
              .copyWith(color: color, fontSize: 13.sp, height: 1.2)
        : context.gloss(AppPass.four).copyWith(color: color);

    return Semantics(
      button: true,
      selected: selected,
      child: InkWell(
        onTap: () => context.go(route),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 44, minWidth: 56),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 22,
                height: 22,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                fit: BoxFit.scaleDown,
              ),
              SizedBox(height: context.gapMicro * 0.5),
              Text(title, style: label),
            ],
          ),
        ),
      ),
    );
  }
}
