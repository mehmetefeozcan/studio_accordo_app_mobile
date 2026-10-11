import 'package:flutter/material.dart';

/// Studio Accordo renk tokenları — **v4 · Karışım** tasarımı.
///
/// Kaynak: tasarım tuvali v4 sayfası. Açık ve koyu değerler ayrı ayrı
/// hesaplandı; metin çiftleri WCAG AA (4.5:1), denetim çizgileri ve marka
/// kırmızısı (yalnızca UI, metin değil) 3:1 doğrulandı.
///
/// Kural: **tek vurgu rengi marka kırmızısıdır** ve metin olarak kullanılmaz.
/// Birincil eylem mürekkep (ink) dolgudur.
class AppColors {
  const AppColors._();

  // ─── Yüzeyler · koyu (sıcak kahve) ──────────────────────────────────
  /// En derin zemin (türetilmiş). Kaydırılan içeriğin arkası.
  static const darkSurface000 = Color(0xFF17110C);

  /// bg.base — her ekranın gövde arka planı.
  static const darkSurface100 = Color(0xFF1F1812);

  /// bg.raised — kartlar, gruplar, liste satırları.
  static const darkSurface200 = Color(0xFF2B2119);

  /// bg.sunken — girdi alanları, segmented control rayı, arama alanı.
  static const darkSurface300 = Color(0xFF382D23);

  /// sheet — alt sayfa, menü, popover.
  static const darkSurfaceOverlay = Color(0xFF35291F);

  // ─── Yüzeyler · açık (krem kâğıt) ───────────────────────────────────
  static const lightSurface000 = Color(0xFFEEE6D3);
  static const lightSurface100 = Color(0xFFF3ECDC);
  static const lightSurface200 = Color(0xFFFBF4E3);
  static const lightSurface300 = Color(0xFFE8E0CB);
  static const lightSurfaceOverlay = Color(0xFFFCF7EA);

  // ─── Mürekkep ───────────────────────────────────────────────────────
  /// text.primary — birincil metin ve ikonlar.
  static const darkInk = Color(0xFFF4EAD6);
  static const lightInk = Color(0xFF1E1B18);

  /// text.secondary — etiketler, açıklamalar, meta bilgi.
  static const darkInkMuted = Color(0xFFBDAF97);
  static const lightInkMuted = Color(0xFF5A544B);

  /// line.control — pasif ikon, placeholder. 3:1; **gövde metni için değil.**
  static const darkInkSubtle = Color(0xFF968872);
  static const lightInkSubtle = Color(0xFF7D766A);

  // ─── Eylem · mürekkep dolgu ─────────────────────────────────────────
  /// action.bg — birincil buton dolgusu, kaydırıcı ve ilerleme dolgusu.
  static const darkAction = Color(0xFFF4EAD6);
  static const lightAction = Color(0xFF1E1B18);

  /// action.fg — birincil buton üzerindeki metin.
  static const darkOnAction = Color(0xFF1F1812);
  static const lightOnAction = Color(0xFFF3ECDC);

  // ─── Marka kırmızısı · tek vurgu ────────────────────────────────────
  /// brand.red — sekme çubuğunun seçili çizgisi, metronomun 1. vuruşu,
  /// akort ibresi, seçili telin kalem halkası. **Metin için kullanma.**
  static const darkAccent = Color(0xFFE8805F);
  static const lightAccent = Color(0xFFB3362B);

  /// Kırmızı dolguların basılı durumu (türetilmiş).
  static const darkAccentHover = Color(0xFFF09478);
  static const lightAccentHover = Color(0xFF962B21);

  /// Eski "amber metin" yuvası. v4'te vurgu metni yoktur — metin mürekkep
  /// rengindedir. Metin butonları ve seçili sekme etiketi bunu kullanır.
  static const darkAccentText = Color(0xFFF4EAD6);
  static const lightAccentText = Color(0xFF1E1B18);

  /// score.highlight — seçili satır, aktif ölçü, ipucu kutusu zemini.
  static const darkAccentWash = Color(0xFF3A2D20);
  static const lightAccentWash = Color(0xFFE6DCC1);

  /// line.separator — hafif kenarlık / çerçeve, çalmamış vuruş çizgisi.
  static const darkAccentDim = Color(0xFF43362A);
  static const lightAccentDim = Color(0xFFD9D1BD);

  // ─── Durum renkleri · marka renginden ayrı ──────────────────────────
  // Marka kırmızısı (#B3362B) bir durum değildir. Hata rengi bilerek
  // karmaşık/pembe bir tonda (#A31545) tutuldu ki ikisi karışmasın.

  /// state.success — akortta, doğru nota, tamamlandı.
  static const darkSignalTrue = Color(0xFF9CC59A);
  static const lightSignalTrue = Color(0xFF2C6A3A);
  static const darkSuccessContainer = Color(0xFF24301F);
  static const lightSuccessContainer = Color(0xFFDDE8D2);

  /// state.warning — mikrofon izni yok, gürültülü ortam.
  static const darkSignalWarn = Color(0xFFE6B866);
  static const lightSignalWarn = Color(0xFF8A5600);
  static const darkWarningContainer = Color(0xFF3A2D12);
  static const lightWarningContainer = Color(0xFFF4E3B8);

  /// state.error — pes/tiz, yanlış nota, başarısız işlem.
  ///
  /// **Renk doğruluğu söyler, yönü söylemez.** Yön ibrenin yerinde,
  /// işaretli sayıda (`−12` / `+15`) ve kelimede okunur.
  static const darkSignalOff = Color(0xFFFF8DA6);
  static const lightSignalOff = Color(0xFFA31545);
  static const darkErrorContainer = Color(0xFF40202A);
  static const lightErrorContainer = Color(0xFFF2D6D9);

  // ─── Kenarlıklar ve odak ────────────────────────────────────────────
  /// line.separator — saç teli ayraç, kart kenarı. Anlam taşımaz.
  static const darkBorder = Color(0xFF43362A);
  static const lightBorder = Color(0xFFD9D1BD);

  /// line.control — girdi kenarı, segmented control, yuvarlak buton çerçevesi.
  static const darkBorderStrong = Color(0xFF968872);
  static const lightBorderStrong = Color(0xFF7D766A);

  /// Klavye odağı: 2px, 2px offset. Mürekkep rengi.
  static const darkFocusRing = Color(0xFFF4EAD6);
  static const lightFocusRing = Color(0xFF1E1B18);

  // ─── Kontrol ve basılı durum ────────────────────────────────────────
  /// control.thumb — segmented control seçili parça, anahtar başparmağı.
  static const darkControlThumb = Color(0xFF54443A);
  static const lightControlThumb = Color(0xFFFFFDF6);

  /// overlay.pressed — basılı satır / buton katmanı.
  static const darkPressedOverlay = Color(0x1FF4EAD6);
  static const lightPressedOverlay = Color(0x1A1E1B18);

  // ─── Paper · her iki temada açık kâğıt (varlıklar için) ─────────────
  // Boş porte / es gibi SVG varlıkları kâğıt üzerinde çizildiği için bu
  // yüzey **iki temada da açıktır**. Tema ile dönen nota sayfası için
  // `sheet` + `score*` tokenlarına (AppSemanticColors) bak.
  static const darkPaper = Color(0xFFFCF7EA);
  static const lightPaper = Color(0xFFFCF7EA);

  static const darkPaperInk = Color(0xFF1E1B18);
  static const lightPaperInk = Color(0xFF1E1B18);

  static const darkPaperLine = Color(0xFF7D766A);
  static const lightPaperLine = Color(0xFF7D766A);

  static const darkPaperMuted = Color(0xFF5A544B);
  static const lightPaperMuted = Color(0xFF5A544B);

  static const darkPaperAccent = Color(0xFFE6DCC1);
  static const lightPaperAccent = Color(0xFFE6DCC1);

  static const focusRingPaper = Color(0xFF1E1B18);

  // ─── Nota sayfası (egzersiz) · tema ile döner ───────────────────────
  /// sheet — egzersiz ekranındaki nota kâğıdı (açık: krem, koyu: kahve).
  static const darkSheet = Color(0xFF35291F);
  static const lightSheet = Color(0xFFFCF7EA);

  // ─── Grafik serileri · sabit sıra, döngüye sokulmaz ─────────────────
  // v4 tasarımı grafik içermiyor; ilerleme ekranı için önceki seriler
  // korundu. Dörtten fazlası varsa kırp / katla — beşinci renk üretme.
  static const darkDataPractice = Color(0xFFBF860C);
  static const lightDataPractice = Color(0xFF8D6100);

  static const darkDataTempo = Color(0xFF4391CE);
  static const lightDataTempo = Color(0xFF066FB0);

  static const darkDataAccuracy = Color(0xFF4CA05C);
  static const lightDataAccuracy = Color(0xFF1B7F37);

  static const darkDataSessions = Color(0xFFA173C7);
  static const lightDataSessions = Color(0xFF824DAC);

  /// Yalnızca ızgara çizgileri.
  static const darkDataGrid = Color(0xFF43362A);
  static const lightDataGrid = Color(0xFFD9D1BD);

  // ─── Karartma ve gölge ──────────────────────────────────────────────
  static const darkScrim = Color(0xCC0A0806);
  static const lightScrim = Color(0xA61E1B18);

  // Derinliği çoğunlukla yüzey basamağı anlatır; gölge seyrek.
  static const darkShadowRaised = Color(0x59000000);
  static const lightShadowRaised = Color(0x141E1B18);
  static const darkShadowOverlay = Color(0x73000000);
  static const lightShadowOverlay = Color(0x1F1E1B18);
}
