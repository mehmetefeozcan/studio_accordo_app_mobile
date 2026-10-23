# C

**Premise (subject evidence).** Fret spacing on a classical guitar is logarithmic: each step toward the bridge is shorter than the last, and the intervals get denser as pitch rises. The page is one uninterrupted stack where every item is ~0.84 of the one above it, in size, leading and gap, while weight increases from 100 to 900 as the spacing tightens. Content is ordered as a fretboard, not as a hierarchy of importance.

**Type.** Zodiak only, weights 100/300/400/700/800/900 plus italic. Source: Fontshare / Indian Type Foundry. License: Fontshare license, free for personal and commercial use. Fallback: Georgia, serif. A high-contrast face was required so that the same letterforms read as thin and airy at 124px and as dense and dark at 9px.

**Hierarchy and scale.** Sixteen steps, 124px → 9px, geometric ratio ≈0.84. There is no separate "body" size; every item is simply its own position on the stack.

**Case, weight, spacing.** Sentence case throughout. Weight rises monotonically with position: 100 at the top, 900 at the bottom. Tracking moves from −0.028em to +0.05em as size falls. Tabular numerals.

**Color.** Ground `#EDE6D5` (not counted). One active letterform color: `#241D15` (100% of text). The single-color direction — contrast is produced entirely by size, weight and density.

**Space.** 80px top, 60px left, 44px right, 120px bottom. Gaps compress with the type: 38px → 3px. Flush left on one axis; the ragged right edge is the fretboard's taper.

**Signature relationship.** Importance and size are decoupled. The top item is not the most important one; it is the lowest fret. Density itself is the information.

**Invariants.** One ink color; the 0.84 ratio; monotonic weight increase; single flush-left axis; no reordering for emphasis.

**Allowed variation.** Number of steps; where the stack is cut.

**Prohibited normalisation.** Re-sorting the stack by importance, adding a second color, or resetting weight.

**Risks.** The bottom steps approach the minimum legible size; a floor (≈11px) will be needed in production and the ratio re-derived above it.

**Round 2 translation.** Screens become compressing stacks rather than card lists. A scroll reads as moving up the neck. Controls sit at the dense end.
