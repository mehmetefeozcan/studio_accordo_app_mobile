import 'package:flutter/material.dart';

/// Raw values from the locked direction. One ground per theme, three
/// letterform roles. See design/CONSTITUTION.md §5.
///
/// Nothing is added here to "complete a scale". A value exists only because
/// a screen needs it.
class AppColors {
  const AppColors._();

  // The single flat ground, plus the two variations permitted for overlay
  // and state. These are grounds, not letterform colors.
  static const darkGround = Color(0xFF2A2017);
  static const darkGroundSunken = Color(0xFF211A12);
  static const darkGroundLift = Color(0xFF342819);

  static const lightGround = Color(0xFFF2EADC);
  static const lightGroundSunken = Color(0xFFE8DECB);
  static const lightGroundLift = Color(0xFFE0D4BE);

  // Primary: the repeated passage. ~45% of text.
  static const darkPassage = Color(0xFFF0E2CD);
  static const lightPassage = Color(0xFF241C12);

  // Secondary: the italic gloss under each pass. ~35% of text.
  // Contrast on the dark ground is ~4.7:1 — do not darken.
  static const darkGloss = Color(0xFFAE8360);
  static const lightGloss = Color(0xFF7A5736);

  // Accent: tempo only. ~20% of text.
  // ~4.2:1 on the dark ground, so permitted at pass 3 size (25) and above.
  static const darkTempo = Color(0xFFE2503A);
  static const lightTempo = Color(0xFFB5351F);

  // The same tempo role at gloss sizes, lifted to clear 4.5:1.
  static const darkTempoQuiet = Color(0xFFF07152);
  static const lightTempoQuiet = Color(0xFF9C2D1A);

  static const darkScrim = Color(0xCC150F0A);
  static const lightScrim = Color(0xB3241C12);
}
