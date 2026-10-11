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
