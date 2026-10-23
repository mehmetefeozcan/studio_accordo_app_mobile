import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

/// Erode, from Indian Type Foundry via Fontshare.
/// Fallback is the platform serif; it preserves metrics only and is not
/// proof of the typography. Never substitute a Google font here.
const String kErode = 'Erode';
const List<String> kErodeFallback = <String>['Georgia', 'Times New Roman'];

/// The four passes. A pass contracts size, line height, tracking and measure
/// at the same time; changing one without the others is a violation of the
/// locked direction. See design/CONSTITUTION.md §2.
enum AppPass { one, two, three, four }

/// Round 1 ran 48/35/26/20 with a 1.0 leading floor and an 11px coda.
/// Production re-derives the same ~0.75 ratio above a readable floor:
/// smallest text is 13, tightest leading is 1.04.
extension AppPassMetrics on AppPass {
  double get size => switch (this) {
    AppPass.one => 44,
    AppPass.two => 33,
    AppPass.three => 25,
    AppPass.four => 19,
  };

  double get height => switch (this) {
    AppPass.one => 1.30,
    AppPass.two => 1.18,
    AppPass.three => 1.10,
    AppPass.four => 1.04,
  };

  /// Tracking as a fraction of the em, applied to the rendered size.
  double get trackingEm => switch (this) {
    AppPass.one => 0.016,
    AppPass.two => 0.0,
    AppPass.three => -0.012,
    AppPass.four => -0.024,
  };

  FontWeight get weight => switch (this) {
    AppPass.one => FontWeight.w400,
    AppPass.two => FontWeight.w500,
    AppPass.three => FontWeight.w600,
    AppPass.four => FontWeight.w700,
  };

  /// Fraction of the available width this pass occupies.
  double get measure => switch (this) {
    AppPass.one => 0.88,
    AppPass.two => 0.76,
    AppPass.three => 0.62,
    AppPass.four => 0.48,
  };

  /// The italic gloss that may sit under this pass.
  double get glossSize => switch (this) {
    AppPass.one => 19,
    AppPass.two => 17,
    AppPass.three => 15,
    AppPass.four => 13,
  };

  double get glossHeight => switch (this) {
    AppPass.one => 1.60,
    AppPass.two => 1.45,
    AppPass.three => 1.32,
    AppPass.four => 1.22,
  };

  double get glossTrackingEm => switch (this) {
    AppPass.one => 0.02,
    AppPass.two => 0.01,
    AppPass.three => 0.0,
    AppPass.four => -0.008,
  };

  /// The gap that follows this pass. Contracts 62 / 38 / 24 / 15.
  double get gapAfter => switch (this) {
    AppPass.one => 62,
    AppPass.two => 38,
    AppPass.three => 24,
    AppPass.four => 15,
  };
}

class AppTextStyles {
  const AppTextStyles._();

  /// The repeated passage at a given pass.
  static TextStyle pass(AppPass p) => TextStyle(
    fontFamily: kErode,
    fontFamilyFallback: kErodeFallback,
    fontSize: p.size.sp,
    height: p.height,
    letterSpacing: p.trackingEm * p.size.sp,
    fontWeight: p.weight,
    // Explicit: Text merges with the ambient DefaultTextStyle, and the
    // Material body slots are glosses, so an unset style inherits italic.
    fontStyle: FontStyle.normal,
  );

  /// The italic gloss belonging to a pass.
  static TextStyle gloss(AppPass p) => TextStyle(
    fontFamily: kErode,
    fontFamilyFallback: kErodeFallback,
    fontSize: p.glossSize.sp,
    height: p.glossHeight,
    letterSpacing: p.glossTrackingEm * p.glossSize.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  /// One step looser than pass 1, for the single live value on a screen that
  /// has no passage to repeat — the tuner's reading. The contraction law still
  /// governs everything beneath it.
  static TextStyle get sounding => TextStyle(
    fontFamily: kErode,
    fontFamilyFallback: kErodeFallback,
    fontSize: 59.sp,
    height: 1.18,
    letterSpacing: -0.03 * 59.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontFeatures: const [FontFeature.tabularFigures()],
  );

  /// Any value that updates in place. Tabular so digits do not jitter.
  static TextStyle measured(AppPass p) =>
      pass(p).copyWith(fontFeatures: const [FontFeature.tabularFigures()]);

  static TextStyle measuredGloss(AppPass p) =>
      gloss(p).copyWith(fontFeatures: const [FontFeature.tabularFigures()]);

  /// SMuFL notation, from the pre-existing Bravura subset.
  static TextStyle smufl(double staffSpace) =>
      TextStyle(fontFamily: 'Bravura', fontSize: 4 * staffSpace, height: 1);
}

class AppTextTheme {
  const AppTextTheme._();

  /// Material's slots mapped onto the passes, so framework widgets inherit
  /// the direction instead of Material's own scale.
  static TextTheme theme() {
    return TextTheme(
      displayLarge: AppTextStyles.pass(AppPass.one),
      displayMedium: AppTextStyles.pass(AppPass.two),
      displaySmall: AppTextStyles.pass(AppPass.three),
      headlineLarge: AppTextStyles.pass(AppPass.two),
      headlineMedium: AppTextStyles.pass(AppPass.three),
      headlineSmall: AppTextStyles.pass(AppPass.four),
      titleLarge: AppTextStyles.pass(AppPass.three),
      titleMedium: AppTextStyles.pass(AppPass.four),
      titleSmall: AppTextStyles.gloss(AppPass.three),
      bodyLarge: AppTextStyles.gloss(AppPass.one),
      bodyMedium: AppTextStyles.gloss(AppPass.two),
      bodySmall: AppTextStyles.gloss(AppPass.four),
      labelLarge: AppTextStyles.pass(AppPass.four),
      labelMedium: AppTextStyles.gloss(AppPass.four),
      labelSmall: AppTextStyles.gloss(AppPass.four),
    );
  }
}
