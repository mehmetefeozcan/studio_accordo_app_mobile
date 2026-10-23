import 'package:flutter/material.dart';

import 'app_colors.dart';

/// The locked role set. Seven roles, because seven is what the direction has.
///
/// `tempo` is tempo. Not a primary button, not success, not error, not brand.
/// See design/CONSTITUTION.md §5.
@immutable
class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  const AppSemanticColors({
    required this.ground,
    required this.groundSunken,
    required this.groundLift,
    required this.passage,
    required this.gloss,
    required this.tempo,
    required this.tempoQuiet,
    required this.scrim,
  });

  /// The single flat ground.
  final Color ground;

  /// Sheets and overlays only.
  final Color groundSunken;

  /// Pressed and selected fills only.
  final Color groundLift;

  /// Primary letterform color — the repeated passage.
  final Color passage;

  /// Secondary letterform color — the italic gloss.
  final Color gloss;

  /// Accent — tempo values and tempo targets, at pass 3 size or larger.
  final Color tempo;

  /// The tempo role at gloss sizes, lifted for contrast.
  final Color tempoQuiet;

  final Color scrim;

  /// Tempo at a size that may fall below the large-text threshold.
  /// Pass the font size you are actually rendering.
  Color tempoAt(double fontSize) => fontSize >= 25 ? tempo : tempoQuiet;

  static const dark = AppSemanticColors(
    ground: AppColors.darkGround,
    groundSunken: AppColors.darkGroundSunken,
    groundLift: AppColors.darkGroundLift,
    passage: AppColors.darkPassage,
    gloss: AppColors.darkGloss,
    tempo: AppColors.darkTempo,
    tempoQuiet: AppColors.darkTempoQuiet,
    scrim: AppColors.darkScrim,
  );

  static const light = AppSemanticColors(
    ground: AppColors.lightGround,
    groundSunken: AppColors.lightGroundSunken,
    groundLift: AppColors.lightGroundLift,
    passage: AppColors.lightPassage,
    gloss: AppColors.lightGloss,
    tempo: AppColors.lightTempo,
    tempoQuiet: AppColors.lightTempoQuiet,
    scrim: AppColors.lightScrim,
  );

  @override
  AppSemanticColors copyWith({
    Color? ground,
    Color? groundSunken,
    Color? groundLift,
    Color? passage,
    Color? gloss,
    Color? tempo,
    Color? tempoQuiet,
    Color? scrim,
  }) {
    return AppSemanticColors(
      ground: ground ?? this.ground,
      groundSunken: groundSunken ?? this.groundSunken,
      groundLift: groundLift ?? this.groundLift,
      passage: passage ?? this.passage,
      gloss: gloss ?? this.gloss,
      tempo: tempo ?? this.tempo,
      tempoQuiet: tempoQuiet ?? this.tempoQuiet,
      scrim: scrim ?? this.scrim,
    );
  }

  @override
  AppSemanticColors lerp(ThemeExtension<AppSemanticColors>? other, double t) {
    if (other is! AppSemanticColors) return this;

    return AppSemanticColors(
      ground: Color.lerp(ground, other.ground, t)!,
      groundSunken: Color.lerp(groundSunken, other.groundSunken, t)!,
      groundLift: Color.lerp(groundLift, other.groundLift, t)!,
      passage: Color.lerp(passage, other.passage, t)!,
      gloss: Color.lerp(gloss, other.gloss, t)!,
      tempo: Color.lerp(tempo, other.tempo, t)!,
      tempoQuiet: Color.lerp(tempoQuiet, other.tempoQuiet, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
    );
  }
}
