import 'package:flutter/material.dart';

import 'app_colors.dart';

@immutable
class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  const AppSemanticColors({
    required this.brandRed,
    required this.bgBase,
    required this.bgRaised,
    required this.bgSunken,
    required this.textPrimary,
    required this.textSecondary,
    required this.actionBg,
    required this.actionFg,
    required this.lineSeparator,
    required this.lineControl,
    required this.onSignalTrue,
    required this.sheet,
    required this.scoreHighlight,
    required this.controlThumb,
    required this.pressedOverlay,
    required this.paper,
    required this.paperInk,
    required this.paperLine,
    required this.paperMuted,
    required this.paperAccent,
    required this.focusRingPaper,
    required this.focusRing,
    required this.inkSubtle,
    required this.accentText,
    required this.accentWash,
    required this.accentDim,
    required this.signalTrue,
    required this.successContainer,
    required this.signalWarn,
    required this.warningContainer,
    required this.signalOff,
    required this.errorContainer,
    required this.dataPractice,
    required this.dataTempo,
    required this.dataAccuracy,
    required this.dataSessions,
    required this.dataGrid,
    required this.shadowRaised,
    required this.shadowOverlay,
  });

  final Color brandRed;
  final Color bgBase;
  final Color bgRaised;
  final Color bgSunken;
  final Color textPrimary;
  final Color textSecondary;
  final Color actionBg;
  final Color actionFg;
  final Color lineSeparator;
  final Color lineControl;
  final Color onSignalTrue;
  final Color sheet;
  final Color scoreHighlight;
  final Color controlThumb;
  final Color pressedOverlay;
  final Color paper;
  final Color paperInk;
  final Color paperLine;
  final Color paperMuted;
  final Color paperAccent;
  final Color focusRingPaper;
  final Color focusRing;
  final Color inkSubtle;
  final Color accentText;
  final Color accentWash;
  final Color accentDim;
  final Color signalTrue;
  final Color successContainer;
  final Color signalWarn;
  final Color warningContainer;
  final Color signalOff;
  final Color errorContainer;
  final Color dataPractice;
  final Color dataTempo;
  final Color dataAccuracy;
  final Color dataSessions;
  final Color dataGrid;
  List<Color> get dataSeries => [
    dataPractice,
    dataTempo,
    dataAccuracy,
    dataSessions,
  ];
  final List<BoxShadow> shadowRaised;
  final List<BoxShadow> shadowOverlay;

  static const dark = AppSemanticColors(
    brandRed: AppColors.darkAccent,
    bgBase: AppColors.darkSurface100,
    bgRaised: AppColors.darkSurface200,
    bgSunken: AppColors.darkSurface300,
    textPrimary: AppColors.darkInk,
    textSecondary: AppColors.darkInkMuted,
    actionBg: AppColors.darkAction,
    actionFg: AppColors.darkOnAction,
    lineSeparator: AppColors.darkBorder,
    lineControl: AppColors.darkBorderStrong,
    onSignalTrue: AppColors.darkSurface100,
    sheet: AppColors.darkSheet,
    scoreHighlight: AppColors.darkAccentWash,
    controlThumb: AppColors.darkControlThumb,
    pressedOverlay: AppColors.darkPressedOverlay,
    paper: AppColors.darkPaper,
    paperInk: AppColors.darkPaperInk,
    paperLine: AppColors.darkPaperLine,
    paperMuted: AppColors.darkPaperMuted,
    paperAccent: AppColors.darkPaperAccent,
    focusRingPaper: AppColors.focusRingPaper,
    focusRing: AppColors.darkFocusRing,
    inkSubtle: AppColors.darkInkSubtle,
    accentText: AppColors.darkAccentText,
    accentWash: AppColors.darkAccentWash,
    accentDim: AppColors.darkAccentDim,
    signalTrue: AppColors.darkSignalTrue,
    successContainer: AppColors.darkSuccessContainer,
    signalWarn: AppColors.darkSignalWarn,
    warningContainer: AppColors.darkWarningContainer,
    signalOff: AppColors.darkSignalOff,
    errorContainer: AppColors.darkErrorContainer,
    dataPractice: AppColors.darkDataPractice,
    dataTempo: AppColors.darkDataTempo,
    dataAccuracy: AppColors.darkDataAccuracy,
    dataSessions: AppColors.darkDataSessions,
    dataGrid: AppColors.darkDataGrid,
    shadowRaised: [
      BoxShadow(
        color: AppColors.darkShadowRaised,
        offset: Offset(0, 1),
        blurRadius: 2,
      ),
    ],
    shadowOverlay: [
      BoxShadow(
        color: AppColors.darkShadowOverlay,
        offset: Offset(0, 8),
        blurRadius: 24,
      ),
    ],
  );

  static const light = AppSemanticColors(
    brandRed: AppColors.lightAccent,
    bgBase: AppColors.lightSurface100,
    bgRaised: AppColors.lightSurface200,
    bgSunken: AppColors.lightSurface300,
    textPrimary: AppColors.lightInk,
    textSecondary: AppColors.lightInkMuted,
    actionBg: AppColors.lightAction,
    actionFg: AppColors.lightOnAction,
    lineSeparator: AppColors.lightBorder,
    lineControl: AppColors.lightBorderStrong,
    onSignalTrue: AppColors.lightSurface100,
    sheet: AppColors.lightSheet,
    scoreHighlight: AppColors.lightAccentWash,
    controlThumb: AppColors.lightControlThumb,
    pressedOverlay: AppColors.lightPressedOverlay,
    paper: AppColors.lightPaper,
    paperInk: AppColors.lightPaperInk,
    paperLine: AppColors.lightPaperLine,
    paperMuted: AppColors.lightPaperMuted,
    paperAccent: AppColors.lightPaperAccent,
    focusRingPaper: AppColors.focusRingPaper,
    focusRing: AppColors.lightFocusRing,
    inkSubtle: AppColors.lightInkSubtle,
    accentText: AppColors.lightAccentText,
    accentWash: AppColors.lightAccentWash,
    accentDim: AppColors.lightAccentDim,
    signalTrue: AppColors.lightSignalTrue,
    successContainer: AppColors.lightSuccessContainer,
    signalWarn: AppColors.lightSignalWarn,
    warningContainer: AppColors.lightWarningContainer,
    signalOff: AppColors.lightSignalOff,
    errorContainer: AppColors.lightErrorContainer,
    dataPractice: AppColors.lightDataPractice,
    dataTempo: AppColors.lightDataTempo,
    dataAccuracy: AppColors.lightDataAccuracy,
    dataSessions: AppColors.lightDataSessions,
    dataGrid: AppColors.lightDataGrid,
    shadowRaised: [
      BoxShadow(
        color: AppColors.lightShadowRaised,
        offset: Offset(0, 1),
        blurRadius: 2,
      ),
    ],
    shadowOverlay: [
      BoxShadow(
        color: AppColors.lightShadowOverlay,
        offset: Offset(0, 8),
        blurRadius: 24,
      ),
    ],
  );

  @override
  AppSemanticColors copyWith({
    Color? brandRed,
    Color? bgBase,
    Color? bgRaised,
    Color? bgSunken,
    Color? textPrimary,
    Color? textSecondary,
    Color? actionBg,
    Color? actionFg,
    Color? lineSeparator,
    Color? lineControl,
    Color? onSignalTrue,
    Color? sheet,
    Color? scoreHighlight,
    Color? controlThumb,
    Color? pressedOverlay,
    Color? paper,
    Color? paperInk,
    Color? paperLine,
    Color? paperMuted,
    Color? paperAccent,
    Color? focusRingPaper,
    Color? focusRing,
    Color? inkSubtle,
    Color? accentText,
    Color? accentWash,
    Color? accentDim,
    Color? signalTrue,
    Color? successContainer,
    Color? signalWarn,
    Color? warningContainer,
    Color? signalOff,
    Color? errorContainer,
    Color? dataPractice,
    Color? dataTempo,
    Color? dataAccuracy,
    Color? dataSessions,
    Color? dataGrid,
    List<BoxShadow>? shadowRaised,
    List<BoxShadow>? shadowOverlay,
  }) {
    return AppSemanticColors(
      brandRed: brandRed ?? this.brandRed,
      bgBase: bgBase ?? this.bgBase,
      bgRaised: bgRaised ?? this.bgRaised,
      bgSunken: bgSunken ?? this.bgSunken,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      actionBg: actionBg ?? this.actionBg,
      actionFg: actionFg ?? this.actionFg,
      lineSeparator: lineSeparator ?? this.lineSeparator,
      lineControl: lineControl ?? this.lineControl,
      onSignalTrue: onSignalTrue ?? this.onSignalTrue,
      sheet: sheet ?? this.sheet,
      scoreHighlight: scoreHighlight ?? this.scoreHighlight,
      controlThumb: controlThumb ?? this.controlThumb,
      pressedOverlay: pressedOverlay ?? this.pressedOverlay,
      paper: paper ?? this.paper,
      paperInk: paperInk ?? this.paperInk,
      paperLine: paperLine ?? this.paperLine,
      paperMuted: paperMuted ?? this.paperMuted,
      paperAccent: paperAccent ?? this.paperAccent,
      focusRingPaper: focusRingPaper ?? this.focusRingPaper,
      focusRing: focusRing ?? this.focusRing,
      inkSubtle: inkSubtle ?? this.inkSubtle,
      accentText: accentText ?? this.accentText,
      accentWash: accentWash ?? this.accentWash,
      accentDim: accentDim ?? this.accentDim,
      signalTrue: signalTrue ?? this.signalTrue,
      successContainer: successContainer ?? this.successContainer,
      signalWarn: signalWarn ?? this.signalWarn,
      warningContainer: warningContainer ?? this.warningContainer,
      signalOff: signalOff ?? this.signalOff,
      errorContainer: errorContainer ?? this.errorContainer,
      dataPractice: dataPractice ?? this.dataPractice,
      dataTempo: dataTempo ?? this.dataTempo,
      dataAccuracy: dataAccuracy ?? this.dataAccuracy,
      dataSessions: dataSessions ?? this.dataSessions,
      dataGrid: dataGrid ?? this.dataGrid,
      shadowRaised: shadowRaised ?? this.shadowRaised,
      shadowOverlay: shadowOverlay ?? this.shadowOverlay,
    );
  }

  @override
  AppSemanticColors lerp(ThemeExtension<AppSemanticColors>? other, double t) {
    if (other is! AppSemanticColors) return this;
    return AppSemanticColors(
      brandRed: Color.lerp(brandRed, other.brandRed, t)!,
      bgBase: Color.lerp(bgBase, other.bgBase, t)!,
      bgRaised: Color.lerp(bgRaised, other.bgRaised, t)!,
      bgSunken: Color.lerp(bgSunken, other.bgSunken, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      actionBg: Color.lerp(actionBg, other.actionBg, t)!,
      actionFg: Color.lerp(actionFg, other.actionFg, t)!,
      lineSeparator: Color.lerp(lineSeparator, other.lineSeparator, t)!,
      lineControl: Color.lerp(lineControl, other.lineControl, t)!,
      onSignalTrue: Color.lerp(onSignalTrue, other.onSignalTrue, t)!,
      sheet: Color.lerp(sheet, other.sheet, t)!,
      scoreHighlight: Color.lerp(scoreHighlight, other.scoreHighlight, t)!,
      controlThumb: Color.lerp(controlThumb, other.controlThumb, t)!,
      pressedOverlay: Color.lerp(pressedOverlay, other.pressedOverlay, t)!,
      paper: Color.lerp(paper, other.paper, t)!,
      paperInk: Color.lerp(paperInk, other.paperInk, t)!,
      paperLine: Color.lerp(paperLine, other.paperLine, t)!,
      paperMuted: Color.lerp(paperMuted, other.paperMuted, t)!,
      paperAccent: Color.lerp(paperAccent, other.paperAccent, t)!,
      focusRingPaper: Color.lerp(focusRingPaper, other.focusRingPaper, t)!,
      focusRing: Color.lerp(focusRing, other.focusRing, t)!,
      inkSubtle: Color.lerp(inkSubtle, other.inkSubtle, t)!,
      accentText: Color.lerp(accentText, other.accentText, t)!,
      accentWash: Color.lerp(accentWash, other.accentWash, t)!,
      accentDim: Color.lerp(accentDim, other.accentDim, t)!,
      signalTrue: Color.lerp(signalTrue, other.signalTrue, t)!,
      successContainer: Color.lerp(
        successContainer,
        other.successContainer,
        t,
      )!,
      signalWarn: Color.lerp(signalWarn, other.signalWarn, t)!,
      warningContainer: Color.lerp(
        warningContainer,
        other.warningContainer,
        t,
      )!,
      signalOff: Color.lerp(signalOff, other.signalOff, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      dataPractice: Color.lerp(dataPractice, other.dataPractice, t)!,
      dataTempo: Color.lerp(dataTempo, other.dataTempo, t)!,
      dataAccuracy: Color.lerp(dataAccuracy, other.dataAccuracy, t)!,
      dataSessions: Color.lerp(dataSessions, other.dataSessions, t)!,
      dataGrid: Color.lerp(dataGrid, other.dataGrid, t)!,
      shadowRaised:
          BoxShadow.lerpList(shadowRaised, other.shadowRaised, t) ??
          shadowRaised,
      shadowOverlay:
          BoxShadow.lerpList(shadowOverlay, other.shadowOverlay, t) ??
          shadowOverlay,
    );
  }
}
