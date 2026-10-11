import 'dart:io';

import 'package:studio_accordo_app_mobile/core/l10n/app_localizations.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

extension MainContextExtension on BuildContext {
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  double get width => 1.sw;

  ColorScheme get colors => Theme.of(this).colorScheme;

  AppLocalizations get l10n => AppLocalizations.of(this);

  bool get isAndroid => Platform.isAndroid;

  void backOrGo(String? fallback, {bool replace = false}) {
    if (canPop()) {
      pop();
      return;
    }
    if (fallback == null) return;
    if (replace) {
      pushReplacement(fallback);
    } else {
      go(fallback);
    }
  }
}
