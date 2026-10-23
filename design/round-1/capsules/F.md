# F

**Premise (subject evidence).** Six strings, E A D G B E, are a fixed discrete ladder; the instrument is the same object every time you pick it up, and tuning is a return to a known table of values. The page is a ledger: identical rows, identical column positions, one type size for almost everything. Nothing is a headline. Difference is carried only by weight and color, never by scale — because no string is more important than another.

**Type.** Cabinet Grotesk only, weights 100–900, no italic. Source: Fontshare / Indian Type Foundry. License: Fontshare license, free for personal and commercial use. Fallback: system-ui, sans-serif. Requirement was a neo-grotesque with enough weights to carry four roles at one size, and no italic to borrow.

**Hierarchy and scale.** Deliberately flat: 17px for every ledger cell, 15px wordmark, 14px state column, 13px closing rows, 11px column heads. Largest to smallest is 15:11. There is no display type at all.

**Case, weight, spacing.** Key column 800, name 400, value 500, state 700 uppercase at +0.07em. Column heads 700 uppercase at +0.26em. Wordmark 900 uppercase at +0.3em. Tabular numerals throughout.

**Color.** Ground `#F5F5F3` (not counted). Four active letterform colors with separate jobs: `#0E0E0E` primary = row keys and emphasised closing cells (~25%); `#58585A` secondary = names, column heads, closing rows (~35%); `#1F3FC4` tertiary = every measured value (~25%); `#C2141A` accent = state words only, Akortta / Pes / Tiz / targets (~15%). The four-color direction. Role is readable from color alone: black names a thing, grey describes it, blue measures it, red judges it.

**Space.** 34/26/60px padding. Four-column grid `3.4em 8.2em 1fr max-content`, 18px gutters, 11px vertical padding per cell, 26px under the column heads, 40px between ledger bands, 52px before the closing rows.

**Signature relationship.** Flat hierarchy with colored roles. The whole app can be read as one table where color says what kind of fact you are looking at.

**Invariants.** Fixed four-column grid; one body size; the four color roles and their meanings; six string rows always present and always equal.

**Allowed variation.** Number of bands; column widths within the same grid.

**Prohibited normalisation.** Introducing a display size, merging blue and red, or making one string row bigger than the others.

**Risks.** Four-column grids at phone width need the value column to wrap rather than shrink; blue and red must be checked for contrast on this ground and for non-color cues in the state column.

**Round 2 translation.** The ledger is the component. Tuner, library, homework and progress are all the same table with different bands. The color roles become the semantic token set directly.
