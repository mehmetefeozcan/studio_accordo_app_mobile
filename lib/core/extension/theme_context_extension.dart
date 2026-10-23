import 'package:studio_accordo_app_mobile/core/theme/app_semantic_colors.dart';
import 'package:studio_accordo_app_mobile/core/theme/text_theme.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

export 'package:studio_accordo_app_mobile/core/theme/text_theme.dart'
    show AppPass, AppPassMetrics;

/// The direction expressed as the API screens actually call.
///
/// There is no radius getter, no card getter and no pill: radius is 0 and
/// grouping is the pass level plus the gap scale.
/// See design/CONSTITUTION.md.
extension StudioAccordoTheme on BuildContext {
  AppSemanticColors get ds => Theme.of(this).extension<AppSemanticColors>()!;

  // ---------------------------------------------------------------- passes

  /// The repeated passage at a pass level.
  TextStyle pass(AppPass p) => AppTextStyles.pass(p);

  /// The italic gloss belonging to a pass.
  TextStyle gloss(AppPass p) => AppTextStyles.gloss(p);

  /// A value that updates in place, with tabular figures.
  TextStyle measured(AppPass p) => AppTextStyles.measured(p);

  TextStyle measuredGloss(AppPass p) => AppTextStyles.measuredGloss(p);

  /// The single live value on a screen with no passage to repeat.
  TextStyle get sounding => AppTextStyles.sounding;

  /// Tempo values pick their colour from the size they render at, so the
  /// accent never falls below its contrast boundary.
  Color tempoFor(AppPass p) => ds.tempoAt(p.size);

  // ----------------------------------------------------------------- space

  /// The shared left indent: 6% of screen width, proportional by design.
  double get indent => 1.sw * 0.06;

  /// Screen padding. The left indent is the locked trait; the right edge is
  /// ragged, so it is held in at half the indent only to avoid clipping.
  EdgeInsets get screenPadding =>
      EdgeInsets.only(left: indent, right: indent * 0.5);

  /// Vertical frame from the direction: 46 top, 96 bottom.
  double get frameTop => 46.h;
  double get frameBottom => 96.h;

  /// The contracting gap scale: 62 / 38 / 24 / 15, plus 8 as the micro gap.
  double get gapMicro => 8.h;
  double get gapTight => 15.h;
  double get gapClose => 24.h;
  double get gapOpen => 38.h;
  double get gapLoose => 62.h;

  /// The gap that follows a given pass.
  double gapAfter(AppPass p) => p.gapAfter.h;

  /// The width a pass occupies, measured from the shared left indent.
  double measureOf(AppPass p) => (1.sw - indent) * p.measure;
}
