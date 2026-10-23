import 'package:studio_accordo_app_mobile/core/theme/app_semantic_colors.dart';
import 'package:studio_accordo_app_mobile/core/theme/app_theme_colors.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_theme.dart';

/// Radius is 0 and nothing is raised. Grouping is the pass level and the
/// gap scale, never a container. See design/CONSTITUTION.md §6.
@singleton
class AppTheme {
  ThemeData get darkTheme => _build(
    scheme: AppThemeColors.dark,
    semantic: AppSemanticColors.dark,
    ground: AppColors.darkGround,
  );

  ThemeData get lightTheme => _build(
    scheme: AppThemeColors.light,
    semantic: AppSemanticColors.light,
    ground: AppColors.lightGround,
  );

  static const _square = RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
  );

  ThemeData _build({
    required ColorScheme scheme,
    required AppSemanticColors semantic,
    required Color ground,
  }) {
    final text = AppTextTheme.theme().apply(
      bodyColor: semantic.passage,
      displayColor: semantic.passage,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      textTheme: text,

      scaffoldBackgroundColor: ground,
      canvasColor: ground,

      extensions: <ThemeExtension<dynamic>>[semantic],

      appBarTheme: AppBarTheme(
        // The bar is transparent, so the status bar has to be told which
        // ground it is sitting on or it renders white on the light theme.
        systemOverlayStyle: scheme.brightness == Brightness.dark
            ? SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Colors.transparent,
              )
            : SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
              ),
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: semantic.passage,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.pass(AppPass.three)
            .copyWith(color: semantic.passage),
      ),

      // Cards are not part of this direction. The theme is set so that a
      // stray Card renders flat on the ground rather than as a surface.
      cardTheme: const CardThemeData(
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: _square,
      ),

      dividerTheme: DividerThemeData(
        color: semantic.gloss,
        thickness: 1,
        space: 1,
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: semantic.passage,
          foregroundColor: ground,
          disabledBackgroundColor: semantic.groundLift,
          disabledForegroundColor: semantic.gloss,
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 18),
          textStyle: AppTextStyles.pass(AppPass.four),
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: _square,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: semantic.passage,
          side: BorderSide(color: semantic.gloss),
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 18),
          textStyle: AppTextStyles.pass(AppPass.four),
          shape: _square,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: semantic.passage,
          minimumSize: const Size(0, 44),
          textStyle: AppTextStyles.gloss(AppPass.three),
          shape: _square,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        hintStyle: AppTextStyles.gloss(AppPass.three)
            .copyWith(color: semantic.gloss),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: semantic.gloss),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: semantic.gloss),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: semantic.passage, width: 2),
        ),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: semantic.groundSunken,
        surfaceTintColor: Colors.transparent,
        modalBarrierColor: semantic.scrim,
        elevation: 0,
        shape: _square,
      ),

      sliderTheme: SliderThemeData(
        activeTrackColor: semantic.passage,
        inactiveTrackColor: semantic.groundLift,
        thumbColor: semantic.passage,
        overlayColor: semantic.groundLift,
        trackHeight: 2,
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: semantic.passage,
        linearTrackColor: semantic.groundLift,
        linearMinHeight: 2,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) =>
              states.contains(WidgetState.selected) ? ground : semantic.gloss,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? semantic.passage
              : semantic.groundLift,
        ),
        trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      ),

      highlightColor: semantic.groundLift,
      splashColor: semantic.groundLift,

      // No ink ripple: the direction has no expanding circles.
      splashFactory: NoSplash.splashFactory,
    );
  }
}
