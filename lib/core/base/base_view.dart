import 'package:studio_accordo_app_mobile/core/base/base_store.dart';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'dart:async';

mixin BaseViewMixin<T extends StatefulWidget> on State<T> {
  final List<ReactionDisposer> _disposers = [];

  Future<void> onInit() async {}

  void onDispose() {}

  void addReaction(ReactionDisposer disposer) {
    _disposers.add(disposer);
  }

  BaseStore? get store => null;

  @override
  void initState() {
    super.initState();

    unawaited(_runInit());
  }

  Future<void> _runInit() async {
    try {
      await onInit();
    } catch (e, stackTrace) {
      if (!mounted) return;
      debugPrint('BaseViewMixin onInit error: $e');
      debugPrint('$stackTrace');
    }
  }

  @override
  void dispose() {
    store?.cancelRequests();
    for (final d in _disposers) {
      d();
    }
    onDispose();
    super.dispose();
  }
}
