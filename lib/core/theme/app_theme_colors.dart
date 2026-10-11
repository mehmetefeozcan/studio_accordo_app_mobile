import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeColors {
  const AppThemeColors._();

  static const dark = ColorScheme(
    brightness: Brightness.dark,

    primary: AppColors.darkAction,
    onPrimary: AppColors.darkOnAction,
    primaryContainer: AppColors.darkAccentWash,
    onPrimaryContainer: AppColors.darkInk,

    secondary: AppColors.darkInkMuted,
    onSecondary: AppColors.darkSurface100,
    secondaryContainer: AppColors.darkSurface300,
    onSecondaryContainer: AppColors.darkInk,

    tertiary: AppColors.darkSignalTrue,
    onTertiary: AppColors.darkSurface100,
    tertiaryContainer: AppColors.darkSuccessContainer,
    onTertiaryContainer: AppColors.darkSignalTrue,

    surface: AppColors.darkSurface200,
    onSurface: AppColors.darkInk,
    onSurfaceVariant: AppColors.darkInkMuted,
    surfaceContainerLowest: AppColors.darkSurface000,
    surfaceContainerLow: AppColors.darkSurface100,
    surfaceContainer: AppColors.darkSurface200,
    surfaceContainerHigh: AppColors.darkSurface300,
    surfaceContainerHighest: AppColors.darkSurfaceOverlay,
    surfaceDim: AppColors.darkSurface000,
    surfaceBright: AppColors.darkSurfaceOverlay,

    outline: AppColors.darkBorderStrong,
    outlineVariant: AppColors.darkBorder,

    error: AppColors.darkSignalOff,
    onError: AppColors.darkSurface100,
    errorContainer: AppColors.darkErrorContainer,
    onErrorContainer: AppColors.darkSignalOff,

    scrim: AppColors.darkScrim,
    shadow: AppColors.darkShadowOverlay,
    inverseSurface: AppColors.lightSurface200,
    onInverseSurface: AppColors.lightInk,
    inversePrimary: AppColors.darkAccent,
  );

  static const light = ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.lightAction,
    onPrimary: AppColors.lightOnAction,
    primaryContainer: AppColors.lightAccentWash,
    onPrimaryContainer: AppColors.lightInk,

    secondary: AppColors.lightInkMuted,
    onSecondary: AppColors.lightSurface100,
    secondaryContainer: AppColors.lightSurface300,
    onSecondaryContainer: AppColors.lightInk,

    tertiary: AppColors.lightSignalTrue,
    onTertiary: AppColors.lightSurface100,
    tertiaryContainer: AppColors.lightSuccessContainer,
    onTertiaryContainer: AppColors.lightSignalTrue,

    surface: AppColors.lightSurface200,
    onSurface: AppColors.lightInk,
    onSurfaceVariant: AppColors.lightInkMuted,
    surfaceContainerLowest: AppColors.lightSurface200,
    surfaceContainerLow: AppColors.lightSurface100,
    surfaceContainer: AppColors.lightSurface000,
    surfaceContainerHigh: AppColors.lightSurface300,
    surfaceContainerHighest: AppColors.lightSurface300,
    surfaceDim: AppColors.lightSurface000,
    surfaceBright: AppColors.lightSurface200,

    outline: AppColors.lightBorderStrong,
    outlineVariant: AppColors.lightBorder,

    error: AppColors.lightSignalOff,
    onError: AppColors.lightSurface200,
    errorContainer: AppColors.lightErrorContainer,
    onErrorContainer: AppColors.lightSignalOff,

    scrim: AppColors.lightScrim,
    shadow: AppColors.lightShadowOverlay,
    inverseSurface: AppColors.darkSurface200,
    onInverseSurface: AppColors.darkInk,
    inversePrimary: AppColors.lightAccent,
  );
}
