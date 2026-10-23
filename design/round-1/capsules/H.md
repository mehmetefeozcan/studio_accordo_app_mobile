# H

**Premise (subject evidence).** A rest is notated content. The brief lists "sessiz vuruş" as a feature, and the app already carries a whole-rest asset: silence in music has an exact measured duration and occupies the staff. On this page empty space is sized, not left over. Roughly four fifths of the height is rests, declared as fixed viewport fractions, and the few sounded fragments are set very large.

**Type.** Boska only, weights 200–900 plus italic. Source: Fontshare / Indian Type Foundry. License: Fontshare license, free for personal and commercial use. Fallback: Georgia, serif. A very high-contrast display serif was required because at 15.5vw the thin strokes have to hold their own against large voids.

**Hierarchy and scale.** 15.5vw sounded word → 5.4vw secondary → 2.1vw italic rest annotation → 11px hush. Viewport-relative so the proportion of type to silence is fixed, not the point size.

**Case, weight, spacing.** Display 200 weight at −0.045em — large but thin, so scale does not become shouting. Secondary 300, right-aligned. Rest annotations italic 300 at +0.14em. Hush uppercase at +0.42em, line-height 2.1. Tabular numerals.

**Color.** Ground `#E7E3DA` (not counted). Letterform colors: `#15120E` primary = the two sounded words and the right-aligned secondary (~35%), `#9A8F7D` stone secondary = every annotation, the wordmark and the hush block (~65%). Two active colors; the second is the voice of things that are not currently sounding.

**Space.** Explicit rest rows of 18vh / 34vh / 26vh / 22vh / 14vh in a single grid, 7vw side padding, 8vh bottom. The rests are rows in the grid, declared before the content.

**Signature relationship.** Silence is measured. The composition is readable as a bar of music in which most beats are rests.

**Invariants.** Rest rows declared in vh before content; at most two sounded words per view; thin weight at display size; stone for everything unsounded.

**Allowed variation.** Which fragments sound; the rest durations, as long as empty space stays dominant.

**Prohibited normalisation.** Filling the rests, adding a third color, or raising the display weight to compensate for the quiet.

**Risks.** vw-based display type needs clamping on tablets; a 2.1vw annotation is too small on a phone and too large on a wide window.

**Round 2 translation.** Focus screens — tuner, metronome, performance — keep the rests. Dense screens will need a second, denser variant of the same two voices, which is the open question for this direction.
