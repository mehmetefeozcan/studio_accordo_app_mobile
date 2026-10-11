import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle get largeTitle => GoogleFonts.newsreader(
    fontSize: 34.sp,
    height: 41 / 34,

    letterSpacing: -0.01 * 34,
  );

  static TextStyle get displayNote =>
      GoogleFonts.newsreader(fontSize: 88.sp, height: 1);

  static TextStyle get displayBpm => GoogleFonts.newsreader(
    fontSize: 72.sp,
    height: 76 / 72,

    letterSpacing: -0.02 * 72,
  );

  static TextStyle get pencilNote => GoogleFonts.newsreader(
    fontSize: 19.sp,
    height: 24 / 19,

    fontStyle: FontStyle.italic,
  );

  static TextStyle get title1 =>
      TextStyle(fontSize: 28.sp, height: 34 / 28, letterSpacing: -0.01 * 28);

  static TextStyle get title2 => TextStyle(fontSize: 22.sp, height: 28 / 22);

  static TextStyle get body => TextStyle(fontSize: 17.sp, height: 22 / 17);

  static TextStyle get bodyStrong =>
      TextStyle(fontSize: 17.sp, height: 22 / 17);

  static TextStyle get callout => TextStyle(fontSize: 15.sp, height: 20 / 15);

  static TextStyle get caption => TextStyle(fontSize: 13.sp, height: 18 / 13);

  static TextStyle get label => TextStyle(fontSize: 12.sp, height: 16 / 12);

  static TextStyle get readoutXl => GoogleFonts.ibmPlexMono(
    fontSize: 54.sp,
    height: 56 / 54,

    fontFeatures: const [FontFeature.tabularFigures()],
  );

  static TextStyle get readout => GoogleFonts.ibmPlexMono(
    fontSize: 22.sp,
    height: 28 / 22,

    fontFeatures: const [FontFeature.tabularFigures()],
  );

  static TextStyle get numericS => GoogleFonts.ibmPlexMono(
    fontSize: 13.sp,
    height: 18 / 13,

    fontFeatures: const [FontFeature.tabularFigures()],
  );

  static TextStyle smufl(double staffSpace) =>
      TextStyle(fontFamily: 'Bravura', fontSize: 4 * staffSpace, height: 1);

  static TextStyle get displayXl => largeTitle;

  static TextStyle get displayL => title1;

  static TextStyle get displayM => title2;

  static TextStyle get title => bodyStrong;
}

class AppTextTheme {
  const AppTextTheme._();

  static TextTheme theme() {
    return TextTheme(
      displayLarge: AppTextStyles.largeTitle,
      displayMedium: AppTextStyles.title1,
      displaySmall: AppTextStyles.title2,
      headlineLarge: AppTextStyles.title1,
      headlineMedium: AppTextStyles.title2,
      headlineSmall: AppTextStyles.bodyStrong,
      titleLarge: AppTextStyles.title2,
      titleMedium: AppTextStyles.bodyStrong,
      titleSmall: AppTextStyles.label,
      bodyLarge: AppTextStyles.body,
      bodyMedium: AppTextStyles.callout,
      bodySmall: AppTextStyles.caption,
      labelLarge: AppTextStyles.bodyStrong,
      labelMedium: AppTextStyles.label,
      labelSmall: AppTextStyles.label,
    );
  }
}
