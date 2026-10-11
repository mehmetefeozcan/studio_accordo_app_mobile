import 'package:studio_accordo_app_mobile/core/routing/routes/main/main_routes.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/assets/app_assets.dart';
import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GeneralBottomNavbar extends StatelessWidget {
  final String currentPath;

  const GeneralBottomNavbar({super.key, required this.currentPath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IntrinsicHeight(
          child: Container(
            width: context.width,
            padding: EdgeInsets.only(
              left: 8.w,
              right: 8.w,
              top: 10.h,
              bottom: context.isAndroid ? 50.h : 30.h,
            ),
            decoration: BoxDecoration(color: context.colors.surface),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          ),
        ),
      ],
    );
  }

  Widget buildNavItem(
    BuildContext context,
    String icon,
    String title,
    String route,
  ) {
    final selected = currentPath == route;
    final color = selected ? context.colors.onSurface : context.ds.inkSubtle;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.go(route),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 2.h,
        children: [
          // Seçili sekme: 2px marka kırmızısı çizgi.
          Container(
            width: 24.w,
            height: 2,
            color: selected ? context.ds.brandRed : Colors.transparent,
          ),
          SvgPicture.asset(
            icon,
            width: 22.w,
            height: 22.h,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            fit: BoxFit.scaleDown,
          ),
          Text(
            title,
            style: context.bodySmall!.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
