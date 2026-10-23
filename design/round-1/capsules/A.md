# A

**Premise (subject evidence).** Tuning in this app is reported as a signed cents deviation around zero, with a tolerance band on either side (`frequentlyUsedDesc`: the measured frequency does not change, only where the target sits). The page therefore has no left edge as its organising fact; it has a centre that text resolves toward. Flat material hangs to the left and is right-aligned; sharp material hangs to the right and is left-aligned; anything in tune sits exactly on the centre axis.

**Type.** Technor (display, labels, numerals) with Supreme (small text and key words). Source: Fontshare / Indian Type Foundry. License: Fontshare license, free for personal and commercial use, webfont delivery via api.fontshare.com. No paid acquisition. Fallback: system-ui / sans-serif. Turkish Latin-Extended coverage asserted by the foundry, not yet verified glyph-by-glyph.

**Hierarchy and scale.** 150px signed readout → 30px uppercase side labels → 21px centre metric → 19px state → 15px side text → 14px/13px/11px small. Ratio is irregular on purpose: the readout is far larger than everything else because deviation is the only live value.

**Case, weight, spacing.** Readout 700 at −0.045em. Side labels and all system words uppercase, 500, +0.06em. Wordmark uppercase 600 at +0.42em. Small text sentence case. Tabular numerals globally (`tnum`).

**Color.** Ground `#F1F0EC` (not counted). Letterform colors: `#14171A` primary ink (~55% of text), `#1B5A6B` secondary = flat/pes side (~25%), `#A03A1C` accent = sharp/tiz side (~20%). Three active colors. Side identity is carried only by color plus alignment, never by a mark.

**Space.** 56/40/48px outer padding. Three-column `1fr max-content 1fr` grid, 30px gutters, baseline alignment. 92px rest between the readout group and the data pairs, 66px before the string row and before the footer.

**Signature relationship.** Reading direction is centrifugal: the eye starts on the axis and is pushed outward into pes and tiz. Alignment itself encodes sign.

**Invariants.** The centre axis; right-align-left / left-align-right rule; two side colors; tabular numerals; the readout as the largest element on any screen that reports deviation.

**Allowed variation.** Readout size, number of data pairs, presence of the string row.

**Prohibited normalisation.** Turning the axis into a centred stack, giving pes and tiz the same color, or left-aligning the whole page.

**Risks.** Three-column baseline grids need care at narrow widths; long Turkish strings in the side columns will wrap and must be allowed to.

**Round 2 translation.** Tuner screen as-is. Elsewhere, the axis becomes a two-sided list: label right-aligned against a centre value, state left-aligned after it. Navigation is a footer row split left/centre/right by the same rule.
