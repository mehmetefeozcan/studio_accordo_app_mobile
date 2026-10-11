// splash_view.dart

import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/core/routing/routes/main/main_routes.dart';
import 'package:studio_accordo_app_mobile/features/splash/store/splash_store.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/widgets/indicator/index.dart';
import 'package:studio_accordo_app_mobile/core/assets/app_assets.dart';
import 'package:studio_accordo_app_mobile/core/base/base_store.dart';
import 'package:studio_accordo_app_mobile/core/base/base_view.dart';
import 'package:studio_accordo_app_mobile/core/di/locator.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with BaseViewMixin<SplashView> {
  SplashStore? _store;

  @override
  BaseStore? get store => _store;

  @override
  Future<void> onInit() async {
    _store = getIt<SplashStore>();

    addReaction(
      reaction((_) => _store!.navigateToHome, (bool navigate) {
        if (navigate) {
          context.go(MainRoutes.home);
        }
      }),
    );

    await _store!.initApp();
  }

  String handleMessage(BuildContext context) {
    switch (_store!.selectedMessageOrder) {
      case 1:
        return context.l10n.splashMessage1;
      case 2:
        return context.l10n.splashMessage2;
      case 3:
        return context.l10n.splashMessage3;
      case 4:
        return context.l10n.splashMessage4;
      default:
        return context.l10n.splashMessage1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              buildLogoSection(context),
              SizedBox(height: context.space7),
              Text(
                "Studio Accordo",
                style: context.displayLarge!.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              buildIndicator(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLogoSection(BuildContext context) {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 32,
            bottom: 32,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                return Container(height: 1, color: context.ds.lineControl);
              }),
            ),
          ),

          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: context.colors.surface,
              shape: BoxShape.circle,
              border: Border.all(color: context.ds.lineControl, width: 1),
            ),
            padding: EdgeInsets.all(context.space4),
            child: Container(
              decoration: BoxDecoration(
                color: context.ds.bgSunken,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(context.space5),
              child: SvgPicture.asset(
                AppAssets.icons.porte,
                width: 96.w,
                height: 96.w,
                colorFilter: ColorFilter.mode(
                  context.colors.onSurface,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 96.w),
          child: Observer(
            builder: (_) => TweenAnimationBuilder<double>(
              tween: Tween(end: _store!.progress),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
              builder: (context, value, _) => LinearIndicator(progress: value),
            ),
          ),
        ),
        SizedBox(height: context.space4),
        Observer(
          builder: (context) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: Text(
              handleMessage(context),
              key: ValueKey(_store!.selectedMessageOrder),
              style: context.titleSmall!.copyWith(color: context.ds.inkSubtle),
            ),
          ),
        ),
      ],
    );
  }
}
