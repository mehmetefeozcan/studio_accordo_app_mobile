import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Material `ColorScheme`'inde karşılığı olmayan Studio Accordo tokenları
/// (**v4 · Karışım**).
///
/// Başlıca ek yuvalar: marka kırmızısı, durum renkleri + kapları (success /
/// warning / error), nota kâğıdı (`sheet`, `scoreHighlight`), kontrol
/// başparmağı, basılı katman ve grafik serileri.
///
/// ```dart
/// Container(color: context.ds.sheet)
/// Text('−12', style: context.readout.copyWith(color: context.ds.signalOff))
/// ```
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

  /// Marka kırmızısı — tek vurgu. Sekme çizgisi, 1. vuruş, akort ibresi, kalem halkası. **Metin değil** (3:1 UI).
  final Color brandRed;

  /// Ekran zemini (bg.base).
  final Color bgBase;

  /// Kart, grup, liste satırı, tab bar (bg.raised).
  final Color bgRaised;

  /// Girdi, çukur alan, segmented ray, pasif dolgu (bg.sunken).
  final Color bgSunken;

  /// Birincil metin ve ikon (text.primary).
  final Color textPrimary;

  /// İkincil metin (text.secondary).
  final Color textSecondary;

  /// Birincil eylem dolgusu — mürekkep (action.bg).
  final Color actionBg;

  /// Birincil eylem üstündeki metin / ikon (action.fg).
  final Color actionFg;

  /// Hafif ayraç / kart kenarı (line.separator).
  final Color lineSeparator;

  /// Kontrol çizgisi: girdi, segmented, yuvarlak buton (line.control, 3:1).
  final Color lineControl;

  /// `signalTrue` dolgusu üstündeki metin.
  final Color onSignalTrue;

  /// Alt sayfa ve egzersiz ekranındaki nota kâğıdı (sheet); tema ile döner. Üstünde `onSurface` mürekkebi ve `scoreHighlight` kullanılır.
  final Color sheet;

  /// Aktif ölçü / seçili satır zemini. Üstündeki nota rengi değişmez (AA doğrulandı).
  final Color scoreHighlight;

  /// Segmented control seçili parça ve anahtar başparmağı.
  final Color controlThumb;

  /// Basılı satır / buton katmanı.
  final Color pressedOverlay;

  /// Her iki temada açık kâğıt (SVG varlıkları için). Tema ile dönen nota sayfası için [sheet].
  final Color paper;

  /// Açık kâğıt üzerindeki gravür işaretleri.
  final Color paperInk;

  /// Açık kâğıt üzerindeki porte / ölçü çizgileri.
  final Color paperLine;

  /// Açık kâğıt üzerindeki parmak ve ölçü numaraları.
  final Color paperMuted;

  /// Açık kâğıt üzerindeki aktif ölçü zemini.
  final Color paperAccent;

  /// Kâğıt üzerindeki odak halkası.
  final Color focusRingPaper;

  /// Klavye odağı: 2px, 2px offset.
  final Color focusRing;

  /// Üçüncü seviye metin / pasif ikon (3:1). Gövde metni için değil.
  final Color inkSubtle;

  /// Metin butonu ve seçili etiket rengi — v4'te mürekkep.
  final Color accentText;

  /// Seçili satır / ipucu kutusu zemini (= scoreHighlight).
  final Color accentWash;

  /// Hafif kenarlık, çalmamış vuruş çizgisi (= line.separator).
  final Color accentDim;

  /// state.success — akortta, doğru, tamamlandı.
  final Color signalTrue;

  /// Başarı bandı zemini.
  final Color successContainer;

  /// state.warning — mikrofon izni yok, gürültülü ortam.
  final Color signalWarn;

  /// Uyarı bandı zemini.
  final Color warningContainer;

  /// state.error — pes/tiz, yanlış, hata. Renk doğruluğu söyler, yönü söylemez; yanında kelime / işaretli sayı bulunur.
  final Color signalOff;

  /// Hata bandı zemini.
  final Color errorContainer;

  /// Grafik serisi 1 (sabit sıra).
  final Color dataPractice;

  /// Grafik serisi 2.
  final Color dataTempo;

  /// Grafik serisi 3.
  final Color dataAccuracy;

  /// Grafik serisi 4.
  final Color dataSessions;

  /// Yalnızca ızgara çizgileri.
  final Color dataGrid;

  /// Kategorik seri sırası — **sabit, döngüye sokulmaz.**
  List<Color> get dataSeries => [dataPractice, dataTempo, dataAccuracy, dataSessions];

  /// Zeminden ayrılması gereken kartlar için tek katman, 2px'i geçmez.
  final List<BoxShadow> shadowRaised;

  /// Menü, popover, alt sayfa — yüzen katmanlar.
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
      successContainer: Color.lerp(successContainer, other.successContainer, t)!,
      signalWarn: Color.lerp(signalWarn, other.signalWarn, t)!,
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t)!,
      signalOff: Color.lerp(signalOff, other.signalOff, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      dataPractice: Color.lerp(dataPractice, other.dataPractice, t)!,
      dataTempo: Color.lerp(dataTempo, other.dataTempo, t)!,
      dataAccuracy: Color.lerp(dataAccuracy, other.dataAccuracy, t)!,
      dataSessions: Color.lerp(dataSessions, other.dataSessions, t)!,
      dataGrid: Color.lerp(dataGrid, other.dataGrid, t)!,
      shadowRaised: BoxShadow.lerpList(shadowRaised, other.shadowRaised, t) ?? shadowRaised,
      shadowOverlay: BoxShadow.lerpList(shadowOverlay, other.shadowOverlay, t) ?? shadowOverlay,
    );
  }
}
