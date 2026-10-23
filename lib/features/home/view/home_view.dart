import 'package:studio_accordo_app_mobile/core/extension/theme_context_extension.dart';
import 'package:studio_accordo_app_mobile/features/home/widgets/index.dart';
import 'package:studio_accordo_app_mobile/features/home/store/home_store.dart';
import 'package:studio_accordo_app_mobile/core/base/base_store.dart';
import 'package:studio_accordo_app_mobile/core/base/base_view.dart';
import 'package:studio_accordo_app_mobile/core/di/locator.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

/// The screen opens at pass 1 and contracts downward: greeting, then the week,
/// then the shortcuts, then the homework and the last session at the tightest
/// pass. Scrolling should feel like accelerating.
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseViewMixin<HomeView> {
  HomeStore? _store;

  @override
  BaseStore? get store => _store;

  @override
  Future<void> onInit() async {
    _store = getIt<HomeStore>();

    await _store!.initApp();
  }

  @override
  Widget build(BuildContext context) {
    final store = _store!;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: context.screenPadding.copyWith(
            top: context.frameTop,
            bottom: context.frameBottom,
          ),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppbarWidget(greeting: store.greeting),
              SizedBox(height: context.gapAfter(AppPass.one)),
              Observer(
                builder: (context) {
                  final progress = store.weeklyProgress;

                  if (progress == null) return const SizedBox.shrink();

                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: context.gapAfter(AppPass.two),
                    ),
                    child: HomeWeeklyProgressWidget(progress: progress),
                  );
                },
              ),
              const HomeShortcutsWidget(),
              SizedBox(height: context.gapAfter(AppPass.two)),
              Observer(
                builder: (context) {
                  final homework = store.currentHomework;

                  if (homework == null) return const SizedBox.shrink();

                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: context.gapAfter(AppPass.three),
                    ),
                    child: HomeHomeworkWidget(item: homework),
                  );
                },
              ),
              Observer(
                builder: (context) {
                  final entry = store.lastPracticed;

                  if (entry == null) return const SizedBox.shrink();

                  return HomeLastPracticedWidget(entry: entry);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
