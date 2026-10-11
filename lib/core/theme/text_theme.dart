import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

/// Tipografi — **v4 · Karışım**.
///
/// Üç yüz, her birinin tek işi var:
///  * **Sistem yazı tipi** (SF Pro / Roboto) — tüm arayüz. `fontFamily`
///    verilmez; platform varsayılanı devralınır.
///  * **Newsreader** (serif) — yalnızca logo, büyük başlık ve büyük sayılar
///    (nota adı, BPM).
///  * **IBM Plex Mono** — yalnızca Hz, sent ve sütunda hizalanan sayılar.
///
/// Tek ölçek: 34 / 28 / 22 / 17 / 15 / 13 / 12. En küçük boyut 12'dir.
class AppTextStyles {
  const AppTextStyles._();

  // ─── Serif · Newsreader ─────────────────────────────────────────────

  /// 34/41 · w600 — ekranın büyük başlığı (Ana sayfa, Akort, Kütüphane).
  static TextStyle get largeTitle => GoogleFonts.newsreader(
    fontSize: 34.sp,
    height: 41 / 34,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.01 * 34,
  );

  /// 88/88 · w500 — akort ekranında algılanan nota (radyal ibre içinde).
  static TextStyle get displayNote => GoogleFonts.newsreader(
    fontSize: 88.sp,
    height: 1,
    fontWeight: FontWeight.w500,
  );

  /// 72/76 · w500 — metronom BPM'i. Ekran başına tek.
  static TextStyle get displayBpm => GoogleFonts.newsreader(
    fontSize: 72.sp,
    height: 76 / 72,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.02 * 72,
  );

  /// 19/24 · italik — egzersiz ekranının eser adı ve durum satırı gibi
  /// "kalem notu" metinleri (italik serif).
  static TextStyle get pencilNote => GoogleFonts.newsreader(
    fontSize: 19.sp,
    height: 24 / 19,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  // ─── Arayüz · sistem yazı tipi ──────────────────────────────────────

  /// 28/34 · w600 — iç ekran başlığı.
  static TextStyle get title1 => TextStyle(
    fontSize: 28.sp,
    height: 34 / 28,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.01 * 28,
  );

  /// 22/28 · w600 — kart / alt sayfa başlığı, boş durum başlığı.
  static TextStyle get title2 => TextStyle(
    fontSize: 22.sp,
    height: 28 / 22,
    fontWeight: FontWeight.w600,
  );

  /// 17/22 — gövde metni, liste satırı, buton yazısı.
  static TextStyle get body =>
      TextStyle(fontSize: 17.sp, height: 22 / 17, fontWeight: FontWeight.w400);

  /// 17/22 · w600 — gövde içinde vurgu, liste satırının başlığı.
  static TextStyle get bodyStrong =>
      TextStyle(fontSize: 17.sp, height: 22 / 17, fontWeight: FontWeight.w600);

  /// 15/20 — satır alt başlığı, ikincil gövde.
  static TextStyle get callout =>
      TextStyle(fontSize: 15.sp, height: 20 / 15, fontWeight: FontWeight.w400);

  /// 13/18 — yardımcı metin, zaman damgası, alan altı açıklaması.
  static TextStyle get caption =>
      TextStyle(fontSize: 13.sp, height: 18 / 13, fontWeight: FontWeight.w400);

  /// 12/16 · w500 — sekme etiketi, rozet. **Büyük harfe çevrilmez.**
  static TextStyle get label =>
      TextStyle(fontSize: 12.sp, height: 16 / 12, fontWeight: FontWeight.w500);

  // ─── Ölçüm · IBM Plex Mono ──────────────────────────────────────────

  /// 54/56 — eski büyük okuma. Radyal ibreye geçilene kadar mevcut akort
  /// widget'ları kullanır; yeni ekranda [displayNote] / [displayBpm].
  static TextStyle get readoutXl => GoogleFonts.ibmPlexMono(
    fontSize: 54.sp,
    height: 56 / 54,
    fontWeight: FontWeight.w500,
    fontFeatures: const [FontFeature.tabularFigures()],
  );

  /// 22/28 · w500 — sent sapması, istatistik değeri, seans süresi.
  static TextStyle get readout => GoogleFonts.ibmPlexMono(
    fontSize: 22.sp,
    height: 28 / 22,
    fontWeight: FontWeight.w500,
    fontFeatures: const [FontFeature.tabularFigures()],
  );

  /// 13/18 — Hz, BPM etiketi, ölçü numarası, sütunda hizalı her sayı.
  static TextStyle get numericS => GoogleFonts.ibmPlexMono(
    fontSize: 13.sp,
    height: 18 / 13,
    fontWeight: FontWeight.w500,
    fontFeatures: const [FontFeature.tabularFigures()],
  );

  // ─── Nota · Bravura (SMuFL) ─────────────────────────────────────────

  /// SMuFL glifleri için: `fontSize = 4 × porte aralığı`. Alt küme
  /// `assets/fonts/Bravura-subset.otf` (sol anahtarı, ritim değerleri, diyez,
  /// es'ler, ölçü birimi rakamları). Lisans: SIL OFL.
  static TextStyle smufl(double staffSpace) => TextStyle(
    fontFamily: 'Bravura',
    fontSize: 4 * staffSpace,
    height: 1,
  );

  // ─── Eski adlar (geçiş) ─────────────────────────────────────────────
  // Mevcut widget'lar bu adları kullanıyor; yeni kodda sağdaki adı yaz.

  /// → [largeTitle]
  static TextStyle get displayXl => largeTitle;

  /// → [title1]
  static TextStyle get displayL => title1;

  /// → [title2]
  static TextStyle get displayM => title2;

  /// → [bodyStrong]
  static TextStyle get title => bodyStrong;
}

/// Material `TextTheme` — [AppTextStyles] üzerine kurulu.
///
/// `bodyMedium` bilerek [AppTextStyles.callout] (15) — mevcut ekranların
/// yerleşimi 15'e göre kurulu. Tasarımdaki 17'lik gövde için
/// `bodyLarge` / `AppTextStyles.body` kullan.
class AppTextTheme {
  const AppTextTheme._();

  static TextTheme theme() {
    return TextTheme(
      displayLarge: AppTextStyles.largeTitle,
      displayMedium: AppTextStyles.title1,
      displaySmall: AppTextStyles.title2,
      headlineLarge: AppTextStyles.title1,
      headlineMedium: AppTextStyles.title2,
      headlineSmall: AppTextStyles.bodyStrong,
      titleLarge: AppTextStyles.title2,
      titleMedium: AppTextStyles.bodyStrong,
      titleSmall: AppTextStyles.label,
      bodyLarge: AppTextStyles.body,
      bodyMedium: AppTextStyles.callout,
      bodySmall: AppTextStyles.caption,
      labelLarge: AppTextStyles.bodyStrong,
      labelMedium: AppTextStyles.label,
      labelSmall: AppTextStyles.label,
    );
  }
}
