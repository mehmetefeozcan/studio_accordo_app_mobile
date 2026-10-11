import 'package:studio_accordo_app_mobile/core/theme/app_semantic_colors.dart';
import 'package:studio_accordo_app_mobile/core/theme/text_theme.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

extension StudioAccordoTheme on BuildContext {
  AppSemanticColors get ds => Theme.of(this).extension<AppSemanticColors>()!;

  TextStyle get readoutXl => AppTextStyles.readoutXl;
  TextStyle get readout => AppTextStyles.readout;
  TextStyle get numericS => AppTextStyles.numericS;
  TextStyle get labelStyle => AppTextStyles.label;
  TextStyle get bodyStrong => AppTextStyles.bodyStrong;
  TextStyle get largeTitle => AppTextStyles.largeTitle;
  TextStyle get displayNote => AppTextStyles.displayNote;
  TextStyle get displayBpm => AppTextStyles.displayBpm;
  TextStyle get pencilNote => AppTextStyles.pencilNote;
  TextStyle get callout => AppTextStyles.callout;
  double get space1 => 4.w;
  double get space2 => 8.w;
  double get space3 => 12.w;
  double get space4 => 16.w;
  double get space5 => 24.w;
  double get space6 => 32.w;
  double get space7 => 48.w;
  double get space8 => 64.w;

  EdgeInsets get screenPadding => EdgeInsets.symmetric(horizontal: 16.w);

  EdgeInsets get cardPadding => EdgeInsets.all(16.w);

  double get radiusXs => 4.r;
  double get radiusSm => 8.r;
  double get radiusMd => 12.r;
  double get radiusLg => 16.r;
  double get radiusPill => 999.r;

  BorderRadius get borderRadiusXs => BorderRadius.circular(radiusXs);
  BorderRadius get borderRadiusSm => BorderRadius.circular(radiusSm);
  BorderRadius get borderRadiusMd => BorderRadius.circular(radiusMd);
  BorderRadius get borderRadiusLg => BorderRadius.circular(radiusLg);
  BorderRadius get borderRadiusPill => BorderRadius.circular(radiusPill);

  BoxDecoration get scoreSheet => BoxDecoration(
    color: ds.sheet,
    borderRadius: BorderRadius.circular(6.r),
    border: Border.all(color: ds.lineSeparator),
    boxShadow: ds.shadowRaised,
  );

  BoxDecoration get paperSurface =>
      BoxDecoration(color: ds.paper, borderRadius: borderRadiusLg);

  BoxDecoration get cardSurface =>
      BoxDecoration(color: ds.bgRaised, borderRadius: borderRadiusMd);

  Color signalForCents(int cents, {int tolerance = 5}) =>
      cents.abs() <= tolerance ? ds.signalTrue : ds.signalOff;
}
