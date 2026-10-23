# Studio Accordo — Visual Constitution

Derived from locked Direction G. Read with `ROUND-2-CONTEXT.md`. This document decides future work; where it and a habit disagree, this document wins.

## 1. Premise

Practice is gradual acceleration. An étude is the same bars repeated at rising tempo, and `app_details.md` requires the metronome to offer "kademeli hızlanma ve yavaşlama". The interface repeats one thing at contracting density rather than stacking different things in containers. The user feels tempo instead of reading a number for it.

## 2. Compositional law

**Contraction, applied simultaneously.** Every section is a *pass*. Moving from a looser pass to a tighter one must change all four of these at once:

| | size | line height | tracking | measure |
|---|---|---|---|---|
| pass 1 | 44 | 1.30 | +0.016 em | 88% |
| pass 2 | 33 | 1.18 | 0 | 76% |
| pass 3 | 25 | 1.10 | −0.012 em | 62% |
| pass 4 | 19 | 1.04 | −0.024 em | 48% |

Weight rises as size falls: 400 → 500 → 600 → 700.

Each pass may carry one **gloss** — an italic secondary line, sizes 19/17/15/13, line heights 1.60/1.45/1.32/1.22.

A pass that shrinks type without also tightening leading, tracking and measure is a violation, not a shortcut.

**Re-derivation above the legibility floor** (disclosed before the lock and applied here): Round 1 used 48/35/26/20 with an 11px coda and 1.0 leading at pass 4. Production raises the floor — smallest text is 13, tightest leading is 1.04 — and rebuilds the ratio (≈0.75) above it. The 11px coda does not ship.

## 3. The shared left indent

All passes share one left indent of **6% of screen width**, proportional, not a fixed 16 px. Measures contract from that indent leftward-anchored; the right edge is ragged by design and is not a margin to be equalised.

Vertical: 46 top, 96 bottom. Gaps between passes contract 62 → 38 → 24 → 15, with 8 as the micro gap.

## 4. Typography

**Family:** Erode, weights 400/500/600/700 and italic 400/500. Designer/foundry: Indian Type Foundry, distributed via Fontshare. License: Fontshare license — free for personal and commercial use, app embedding permitted, no redistribution of the font files as fonts. Primary source: `api.fontshare.com` / `cdn.fontshare.com`.

**Fallback:** platform serif. The fallback preserves nothing but metrics; it is not proof of the typography.

**Never** substitute a Google font. `google_fonts` must not return to the type layer.

**Case:** sentence case throughout. No uppercase labels, no letterspaced all-caps section headers. `toUpperCase()` on user-facing strings is prohibited — it also destroys the Turkish dotted/dotless i.

**Numerals:** Erode's defaults, with tabular figures wherever a value updates in place (tuner, tempo, timers) so digits do not jitter.

**Language coverage:** Turkish Latin Extended (ğ Ğ ı I i İ ş Ş ö Ö ü Ü ç Ç). Asserted by the foundry; **not yet verified glyph by glyph.** Verifying this is open work.

## 5. Color

One ground, three letterform roles. The ground does not count as a letterform color.

| role | dark | light | job |
|---|---|---|---|
| `ground` | `#2A2017` | `#F2EADC` | the single flat ground |
| `groundSunken` | `#211A12` | `#E8DECB` | sheets and overlays only |
| `groundLift` | `#342819` | `#E0D4BE` | pressed and selected fills only |
| `passage` | `#F0E2CD` | `#241C12` | primary — the repeated passage, ~45% |
| `gloss` | `#AE8360` | `#7A5736` | secondary — italic glosses, ~35% |
| `tempo` | `#E2503A` | `#B5351F` | accent — **tempo only**, ~20% |
| `tempoQuiet` | `#F07152` | `#9C2D1A` | the same role at gloss sizes, for contrast |

**`tempo` is tempo.** Not primary-button, not success, not error, not "brand". Using it for anything but a tempo value or target is prohibited normalisation.

**Contrast boundaries (dark ground, measured):** `passage` ≈ 11:1. `gloss` ≈ 4.7:1 — passes AA for body but with little headroom; do not darken it. `tempo` ≈ 4.2:1 — **large text only**, permitted at pass 3 size (25) and above. Below that, tempo uses `tempoQuiet` ≈ 5.5:1.

**Light ground** is a contextual adaptation, not a second identity: same roles, same proportions, ground lightened and inks darkened within the same hue family; `tempo` darkened solely to hold contrast.

**State is never color alone.** Tuning state is carried by weight, tracking and the word (Akortta / Pes / Tiz) together.

## 6. Shape, line, edge

G contains no shapes. Production keeps that as far as function allows:

- **Radius is 0.** Everywhere. Rounded corners and pills are the generic default this project is leaving; `radiusPill` does not exist.
- **No cards.** No raised surfaces, no fills behind content, no borders to group things. Grouping is the pass level plus the gap scale. A fill appears only for a pressed or selected state, at `groundLift`.
- **Lines** exist only where a value must be read positionally — the practice meter and the tuner's deviation scale. 1–2 px, square ends, never decorative.
- **No shadows, no elevation, no surface tint.**

## 7. Density and rhythm

Summary loose, detail dense. A screen opens at pass 1 and contracts downward. Scrolling should feel like accelerating, which means later content is tighter, not merely further away.

Repetition is allowed and intended: the same passage restated at a tighter pass is the signature, not redundancy.

## 8. Icons and assets

`assets/icons/*.svg` and `assets/fonts/Bravura-subset.otf` are pre-existing, user-supplied, **immutable**. Use as-is, tinted `passage` or `gloss`. No SVG is authored, edited, traced, converted to, or exported by this system, now or later. No new icon family is introduced without approval.

## 9. Interaction and motion

- Minimum tap target 44 dp even where no fill is drawn.
- Selected and pressed states use `groundLift` plus a weight shift; focus is visible without a glow.
- Motion follows contraction: entering content settles from loose to tight. Duration ≤ 200 ms. Under `MediaQuery.disableAnimations` / reduced motion, the end state renders directly and meaning is preserved.
- No hover lift, no parallax, no spring, no counting numbers.
- Destructive actions need prevention and recovery; a sheet with unfinished input must not dismiss on an outside tap.

## 10. Locked invariants

1. Four passes minimum, contracting on all four axes at once.
2. The 6% shared left indent.
3. `tempo` reserved for tempo.
4. Sentence case; no uppercase transformation of user-facing strings.
5. Radius 0; no cards; no shadows.
6. Erode with a platform-serif fallback; never a Google font.
7. One ground per theme; `groundSunken` / `groundLift` only for overlay and state.

## 11. Permitted variation

The passage itself; passes beyond four; gap values within the contracting ratio; measure percentages within ±6 points; light-ground adaptation; the number of gloss lines per pass.

## 12. Prohibited normalisation

Changing content between passes; a constant measure; `tempo` used outside tempo; uppercase labels; rounded corners or pills; cards, surfaces or borders used for grouping; shadows; a 4-colour "data series" palette; a 12-column grid; a symmetric 8-point spacing scale imposed over the contracting gaps.

## 13. Open decisions

1. **Tuner state without a new hue.** Deviation is currently expressed by contraction (tight + `passage` in tune, open + `gloss` out of tune) plus the word, instead of green/red. This is faithful to the premise but has not been tested with a 10-year-old at arm's length. If it fails, the fix is a new state role, not a reuse of `tempo`.
2. Whether the light ground ships at all, or the app is dark-ground only.
3. Erode's Turkish glyph coverage, unverified.
4. Whether `google_fonts` is removed from `pubspec.yaml` once nothing imports it.
