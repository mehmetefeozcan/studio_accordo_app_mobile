import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/core/routing/routes/main/main_routes.dart';
import 'package:studio_accordo_app_mobile/features/splash/store/splash_store.dart';
import 'package:studio_accordo_app_mobile/core/extension/main_extension.dart';
import 'package:studio_accordo_app_mobile/core/widgets/indicator/index.dart';
import 'package:studio_accordo_app_mobile/core/base/base_store.dart';
import 'package:studio_accordo_app_mobile/core/base/base_view.dart';
import 'package:studio_accordo_app_mobile/core/di/locator.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

/// The name opens at pass 1 on the shared indent. The porte ring, the two
/// concentric discs and the five staff lines are gone: the direction has no
/// shapes, and the app's own four preparation lines are the content.
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
    final reduceMotion = MediaQuery.maybeDisableAnimationsOf(context) ?? false;

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
                child: Text("Studio Accordo", style: context.pass(AppPass.one)),
              ),
              const Spacer(),
              buildProgress(context, reduceMotion),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProgress(BuildContext context, bool reduceMotion) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Observer(
          builder: (context) => AnimatedSwitcher(
            duration: Duration(milliseconds: reduceMotion ? 0 : 200),
            child: Text(
              handleMessage(context),
              key: ValueKey(_store!.selectedMessageOrder),
              style: context
                  .gloss(AppPass.three)
                  .copyWith(color: context.ds.gloss),
            ),
          ),
        ),
        SizedBox(height: context.gapClose),
        SizedBox(
          width: context.measureOf(AppPass.three),
          child: Observer(
            builder: (_) {
              if (reduceMotion) {
                return LinearIndicator(progress: _store!.progress);
              }

              return TweenAnimationBuilder<double>(
                tween: Tween(end: _store!.progress),
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                builder: (context, value, _) =>
                    LinearIndicator(progress: value),
              );
            },
          ),
        ),
      ],
    );
  }
}
