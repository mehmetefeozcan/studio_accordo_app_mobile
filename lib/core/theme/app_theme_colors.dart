import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Material's ColorScheme exists so framework widgets do not fall back to
/// their own defaults. The direction has one ground and three inks, so most
/// of these slots deliberately repeat: there is no surface ramp to express.
class AppThemeColors {
  const AppThemeColors._();

  static const dark = ColorScheme(
    brightness: Brightness.dark,

    primary: AppColors.darkPassage,
    onPrimary: AppColors.darkGround,
    primaryContainer: AppColors.darkGroundLift,
    onPrimaryContainer: AppColors.darkPassage,

    secondary: AppColors.darkGloss,
    onSecondary: AppColors.darkGround,
    secondaryContainer: AppColors.darkGroundLift,
    onSecondaryContainer: AppColors.darkPassage,

    tertiary: AppColors.darkTempo,
    onTertiary: AppColors.darkGround,
    tertiaryContainer: AppColors.darkGroundLift,
    onTertiaryContainer: AppColors.darkTempoQuiet,

    surface: AppColors.darkGround,
    onSurface: AppColors.darkPassage,
    onSurfaceVariant: AppColors.darkGloss,
    surfaceContainerLowest: AppColors.darkGroundSunken,
    surfaceContainerLow: AppColors.darkGroundSunken,
    surfaceContainer: AppColors.darkGround,
    surfaceContainerHigh: AppColors.darkGroundLift,
    surfaceContainerHighest: AppColors.darkGroundLift,
    surfaceDim: AppColors.darkGroundSunken,
    surfaceBright: AppColors.darkGroundLift,

    outline: AppColors.darkGloss,
    outlineVariant: AppColors.darkGroundLift,

    // The direction has no error role yet; see CONSTITUTION §13.
    // Until one is designed, errors borrow the gloss voice rather than
    // importing a red that would collide with `tempo`.
    error: AppColors.darkGloss,
    onError: AppColors.darkGround,
    errorContainer: AppColors.darkGroundLift,
    onErrorContainer: AppColors.darkGloss,

    scrim: AppColors.darkScrim,
    shadow: Colors.transparent,
    inverseSurface: AppColors.lightGround,
    onInverseSurface: AppColors.lightPassage,
    inversePrimary: AppColors.lightPassage,
  );

  static const light = ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.lightPassage,
    onPrimary: AppColors.lightGround,
    primaryContainer: AppColors.lightGroundLift,
    onPrimaryContainer: AppColors.lightPassage,

    secondary: AppColors.lightGloss,
    onSecondary: AppColors.lightGround,
    secondaryContainer: AppColors.lightGroundLift,
    onSecondaryContainer: AppColors.lightPassage,

    tertiary: AppColors.lightTempo,
    onTertiary: AppColors.lightGround,
    tertiaryContainer: AppColors.lightGroundLift,
    onTertiaryContainer: AppColors.lightTempoQuiet,

    surface: AppColors.lightGround,
    onSurface: AppColors.lightPassage,
    onSurfaceVariant: AppColors.lightGloss,
    surfaceContainerLowest: AppColors.lightGroundSunken,
    surfaceContainerLow: AppColors.lightGroundSunken,
    surfaceContainer: AppColors.lightGround,
    surfaceContainerHigh: AppColors.lightGroundLift,
    surfaceContainerHighest: AppColors.lightGroundLift,
    surfaceDim: AppColors.lightGroundSunken,
    surfaceBright: AppColors.lightGroundLift,

    outline: AppColors.lightGloss,
    outlineVariant: AppColors.lightGroundLift,

    error: AppColors.lightGloss,
    onError: AppColors.lightGround,
    errorContainer: AppColors.lightGroundLift,
    onErrorContainer: AppColors.lightGloss,

    scrim: AppColors.lightScrim,
    shadow: Colors.transparent,
    inverseSurface: AppColors.darkGround,
    onInverseSurface: AppColors.darkPassage,
    inversePrimary: AppColors.darkPassage,
  );
}
