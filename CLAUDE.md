# Studio Accordo — mobil uygulama (Flutter)

Klasik gitar çalışma uygulaması: akort aleti, metronom, egzersiz/gam kütüphanesi.
Sonraki fazlar: nota yükleme / çalma / takip, öğretmen katmanı.
Dil: Türkçe (varsayılan) + İngilizce (`lib/core/l10n`, `l10n.yaml`). Metinler nötr, süssüz.

## Mimari (kısa)
- `lib/core` — tema, router (go_router), DI (get_it + injectable), storage (Hive), network (dio), ortak widget'lar, l10n.
- `lib/features/<özellik>/{view,store,widgets,model,service}` — her özellik kendi MobX store'unu taşır; view `BaseViewMixin` kullanır.
- Üretilen dosyalar (`*.g.dart`, `locator.config.dart`, l10n) elle düzenlenmez: `dart run build_runner build -d`.
- `ScreenUtilInit(designSize: 402x874)`; boyutlar `.sp/.w/.r` ile ölçeklenir.
- Tema modu `ThemeStore` ile (Hive) tutulur; `MaterialApp` hem `lightTheme` hem `darkTheme` alır.

## Tasarım sistemi — v4 · Karışım (kaynak: tasarım tuvali, v4 sayfası)
v3 iOS yapısı + v2 kâğıt/kalem dokunuşları + v1 sıcak kahve koyu tema.
Kodda tek doğruluk kaynağı `lib/core/theme/` — tasarım değişirse önce orayı güncelle.

### Dosyalar
| Dosya | Görev |
|---|---|
| `app_colors.dart` | Ham renkler (`dark*` / `light*`). Widget'larda doğrudan kullanma; tema üzerinden oku. |
| `app_theme_colors.dart` | `ColorScheme` eşlemesi (açık + koyu). |
| `app_semantic_colors.dart` | `ThemeExtension`: marka kırmızısı, durum + kapları, `sheet`, `scoreHighlight`, `controlThumb`, `pressedOverlay`, grafik serileri. Erişim: `context.ds`. |
| `text_theme.dart` | `AppTextStyles` + Material `TextTheme`. |
| `app_theme.dart` | `ThemeData` (buton, girdi, alt sayfa, anahtar, kaydırıcı …). |
| `core/extension/theme_context_extension.dart` | `context.ds`, metin kısayolları, `space1..8`, `radius*`, `scoreSheet`, `cardSurface`, `signalForCents`. |

### Renk kuralları
- **Birincil eylem mürekkep dolgudur** (`colorScheme.primary` = `action.bg`; üstünde `onPrimary`). Kırmızı buton yok.
- **Tek vurgu: marka kırmızısı** (`context.ds.brandRed`). Yalnızca küçük UI işaretlerinde: seçili sekmenin 2px çizgisi, metronomun 1. vuruşu, akort ibresi, seçili telin kalem halkası. **Metin olarak kullanılmaz** (yalnızca 3:1 UI doğrulaması var).
- Durum renkleri marka renginden ayrı: `signalTrue` (success), `signalWarn` (warning), `signalOff` (error; bilerek pembe-mor ton) + `successContainer/warningContainer/errorContainer`. Renk **doğruluğu** söyler, yönü söylemez — yön ibrenin yeri, işaretli sayı (`−12` / `+15`) ve kelimeyle verilir.
- Derinlik yüzey basamağıyla: `surface100` (zemin, bg.base) → `surface200` (kart, bg.raised) → `surface300` (girdi/çukur, bg.sunken). Gölge seyrek.
- Alt sayfa ve nota kâğıdı `context.ds.sheet` (açık #FCF7EA / koyu #35291F). Aktif ölçü / seçili satır zemini `scoreHighlight`; üstündeki mürekkep değişmez.
- `paper*` tokenları iki temada da **açık** kâğıt (SVG varlıkları için). Tema ile dönen nota sayfası için `sheet`.
- `inkSubtle` (3:1) pasif ikon / placeholder içindir; gövde metni için kullanılmaz.
- Eski adlar korundu ama anlamları değişti: `accent*` artık kırmızı/mürekkep tabanlı (`accentText` = mürekkep, `accentWash` = scoreHighlight, `accentDim` = ayraç çizgisi).

### Tipografi (tek ölçek: 34 / 28 / 22 / 17 / 15 / 13 / 12, min 12)
- Arayüz: **sistem yazı tipi** (SF Pro / Roboto; `fontFamily` verilmez).
- **Newsreader**: yalnızca logo, `largeTitle` 34/41 w600, `displayNote` 88 (algılanan nota), `displayBpm` 72/76, `pencilNote` (italik, egzersiz başlığı / durum satırı).
- **IBM Plex Mono**: yalnızca Hz, sent (`readout` 22/28), sütunda hizalı sayılar (`numericS` 13/18).
- `title1` 28/34 w600 · `title2` 22/28 w600 · `body` 17/22 · `callout` 15/20 · `caption` 13/18 · `label` 12/16 w500 (büyük harfe çevrilmez).
- Eski adlar (`displayXl/L/M`, `title`) takma ad olarak duruyor. `readoutXl` (mono 54) radyal ibreye geçişe kadar mevcut akort widget'ları için kaldı.
- `bodyMedium` bilerek 15 (`callout`) — mevcut yerleşimler 15'e göre. Tasarımın 17'lik gövdesi için `bodyLarge` / `AppTextStyles.body`.
- Nota glifleri: `Bravura` (SMuFL alt kümesi, `assets/fonts/Bravura-subset.otf`), `AppTextStyles.smufl(staffSpace)` → font boyutu = 4 × porte aralığı.

### Boşluk, köşe, hedefler
- Boşluk: 4 / 8 / 12 / 16 / 24 / 32 (+48, 64 boş durum için). Ekran kenarı 16. Dokunma hedefi ≥ 44.
- Köşe: `radiusXs` 4 (rozet) · `radiusSm` 8 · `radiusMd` 12 (kart, buton, girdi) · `radiusLg` 16 (alt sayfa, büyük buton) · `radiusPill` 999. Nota kâğıdı 6.
- İkonlar 24px, 1.5px çizgi. Sekme çubuğu: ikon + etiket, seçili sekmede üstte 2px kırmızı çizgi.

### Ekran kararları (v4)
- **Logo**: kırmızı nota başı yok (yalnızca porte işareti + "Studio Accordo"). Splash ortalanmış tek flex grup.
- **Ana sayfa (v1 düzeni)**: Akort / Metronom kartları, son açılan egzersiz, haftalık takip, profil düğmesi.
- **Akort**: radyal ibre (v2 geometrisi), kırmızı ibre; oto-tespit, telleri seçme, kromatik, mikrofon izni / gürültü durumları. Seçili tel üzerinde kalem halkası. Mikrofon kaydedilmez — bu tek cümleyle belirtilir.
- **Metronom (v1 vuruş çubukları)**: aksak 2 + 2 + 3 gruplu çubuklar; 1. vuruş kırmızı, grup başları kalın kenarlı, diğerleri ince. Büyük BPM serif; kaydırıcı mürekkep.
- **Egzersiz**: kâğıt yüzey (grenli), eser adı italik serif, nota `sheet` üzerinde, aktif ölçü `scoreHighlight`, döngü ayracı. Etiket: "Tempo %75".
- Büyük başlık altında porte çizgisi (v2 dokunuşu); durum metinleri italik serif.

### Henüz uygulanmayanlar / bilinen borçlar
- Radyal akort ibresi, v1 metronom çubukları, egzersiz nota render'ı ve kâğıt greni henüz widget olarak yok; temel tokenlar hazır.
- Renk erişimi: widget'larda yalnızca `context.colors.*` (ColorScheme) veya `context.ds.*` (AppSemanticColors); `AppColors` yalnızca `core/theme` içinde. Açık/koyu ayrımı böylece otomatik.
- Uygulama ikonu kaynakları (`assets/logo/*.png`) yeni logoyla (diyapazon + porte, notasız, #1F1812 zemin) güncellendi; platform ikonlarını üretmek için `dart run flutter_launcher_icons` çalıştır. Çizgi ikonlar (`tuner/metronome/scan/chevron`) `colorFilter` ile tema renginden boyanır; `notes`, `whole_rest_measure`, `wip_music_staff` açık kâğıt varlıklarıdır (`ds.paper` üstünde).
- Grafik serileri v4'te tanımlı değil; ilerleme ekranı için eski seriler korundu.
