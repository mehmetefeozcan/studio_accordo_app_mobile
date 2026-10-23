# ROUND-2-CONTEXT

Governing context for all Round 2 work on Studio Accordo. The direction is locked. Do not reopen A–J, propose alternatives, or import another style.

**Lock.** Direction G, locked by the human on 2026-10-24 ("tmm onaylıyorum") after visual judgement of A–J. No corrections to the premise were requested.

---

## Locked capsule (Direction G, verbatim from `round-1/capsules/G.md`)

**Premise (subject evidence).** Practice is gradual acceleration: the brief specifies "kademeli hızlanma ve yavaşlama", and an étude is the same bars repeated at rising tempo. The page is one passage repeated four times. Nothing about the content changes; size, leading, tracking and column width all contract, so each pass is read faster than the last. The reader experiences tempo rather than seeing a number for it.

**Type.** Erode only, weights 300–700 plus italic. Source: Fontshare / Indian Type Foundry. License: Fontshare license, free for personal and commercial use. Fallback: Georgia, serif. A face with slightly roughened edges was required so that compression reads as effort rather than as cleanliness.

**Hierarchy and scale.** Pass 1 48px / Pass 2 35px / Pass 3 26px / Pass 4 20px, with sub lines 20/17/14/12px. The four passes are the hierarchy; there is no separate heading level.

**Case, weight, spacing.** Sentence case. Weight rises as size falls: 400 → 500 → 600 → 700. Leading contracts 1.3 → 1.18 → 1.08 → 1.0. Tracking contracts +0.016em → 0 → −0.014em → −0.028em. Sub lines italic throughout.

**Color.** Ground `#2A2017` (not counted). Letterform colors: `#F0E2CD` ecru primary = the repeated passage (~45%), `#AE8360` clay secondary = the italic sub line under each pass (~35%), `#E2503A` signal accent = the tempo target, every time it appears, and the coda (~20%). Three active colors; the accent exists only for tempo.

**Space.** Column width contracts 88% → 76% → 62% → 48% of the viewport, all passes sharing a 6% left indent. Gaps between passes contract 62 → 40 → 24px. 46px top, 96px bottom.

**Signature relationship.** Repetition with contraction. Four identical sentences that feel progressively faster.

**Invariants.** Four passes minimum; simultaneous contraction of size, leading, tracking and column width; the shared left indent; accent reserved for tempo.

**Allowed variation.** The passage; number of passes above four.

**Prohibited normalisation.** Changing the content between passes, keeping the column width constant, or using the accent for anything but tempo.

**Risks.** Pass 4 at 20px/1.0 leading with negative tracking is the legibility floor and must be re-derived at device scale; the coda at 11px is currently below a safe minimum.

**Round 2 translation.** Exercise and homework screens use literal passes. Elsewhere, the contraction becomes the rule for a section's progressive disclosure: the summary is loose, the detail is dense.

---

## Round 1 disclosures (stated before the lock, carried forward)

1. G's premise natively fits exercise and homework screens. The tuner reports a live measurement and has no passage to repeat. A dense counterpart built from the same three voices is required there; the premise is not abandoned to get it.
2. The 11px coda and Pass 4's 1.0 leading cannot ship as written. The legibility floor is raised and the contraction ratio re-derived above it.
3. Erode's Turkish Latin-Extended coverage (ğ İ ı ş ö ü) rests on the foundry's statement and has not been verified glyph by glyph.

## Source boundary

Allowed evidence: `app_details.md`; `lib/core/l10n/app_tr.arb` and `app_en.arb`; the existing Flutter implementation as functional constraint only; the mechanics of the classical guitar and of Turkish orthography. Prohibited: any contemporary visual reference, gallery, UI kit, template, icon library used for discovery, Material Design or Google Fonts as a creative input.

## Standing rules for every Round 2 artifact

- No SVG authored, generated, edited, traced, converted to, or exported. The repository's existing `assets/icons/*.svg` are pre-existing user-supplied input, immutable, used as-is.
- Accent `#E2503A` is tempo only. Never success, never error, never "primary button".
- Contraction is simultaneous. A pass that shrinks type without also tightening leading, tracking and measure is a violation.
- Content is identical across passes. Progressive disclosure changes density, not words.
- Sentence case. No uppercase labels, no letterspaced all-caps headers.
- Erode with Georgia/serif fallback; no silent substitution of a Google font.

---

## Round 2 implementation record (not yet approved)

Built in the existing Flutter stack. Nothing here is frozen; the human has not judged the artifacts.

**Changed**
- `lib/core/theme/app_colors.dart` — 80+ ad-hoc constants replaced by one ground (plus overlay/state variations) and three letterform roles per theme.
- `lib/core/theme/app_semantic_colors.dart` — role set cut to `ground`, `groundSunken`, `groundLift`, `passage`, `gloss`, `tempo`, `tempoQuiet`, `scrim`, with `tempoAt(size)` enforcing the accent's contrast boundary.
- `lib/core/theme/app_theme_colors.dart` — ColorScheme mapped onto that set; repeated slots are deliberate, as there is no surface ramp to express.
- `lib/core/theme/text_theme.dart` — `AppPass` replaces the old ad-hoc scale. Size, line height, tracking, weight, measure and following gap all derive from the pass.
- `lib/core/theme/app_theme.dart` — radius 0 everywhere, no card fill, no elevation, no ink ripple, underline inputs, 2 px meters, status-bar style per ground.
- `lib/core/extension/theme_context_extension.dart` — new API: `pass()`, `gloss()`, `measured()`, `sounding`, `indent`, `measureOf()`, the contracting gap scale. No radius, card or pill getters exist any more.
- All 20 widgets and views rebuilt on those rules.

**Removed**
- `core/widgets/other/point.dart` (decorative circle) and `buttons/icon_circle_button.dart` (replaced by the square `IconPlateButton`).
- The splash porte ring, concentric discs and five staff lines.
- The framed glyph plates on the not-found and under-construction screens.
- `google_fonts` from the type layer; the dependency is still in `pubspec.yaml`.

**Defects found and fixed during verification**
- `GeneralBottomNavbar`'s inner `Column` defaulted to `MainAxisSize.max` inside loose constraints and consumed ~420 dp, pushing every route body out of view. Same defect fixed in the shortcut plate and the last-practiced row.
- `AppTextStyles.pass()` left `fontStyle` unset, so every upright style inherited italic from the ambient `bodyMedium` gloss. Now explicit.
- The transparent app bar left the status bar white on the light ground.
- Three equal shortcut columns broke "Metronom" mid-word; shortcuts now take their own width.

**Not done**
- Erode is declared but commented out in `pubspec.yaml`; the files are not downloaded, so the app currently renders in the platform serif.
