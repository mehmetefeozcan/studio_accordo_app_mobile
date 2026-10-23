# I

**Premise (subject evidence).** Phase 2 of the brief is a correction editor: an uploaded score is machine-read, mis-recognised places are flagged, and the student corrects them by hand. Two authorities exist on one page — the engraved, impersonal plate and the handwritten correction over it. The page runs these as two simultaneous typographic voices, and the corrective voice interrupts the engraved line inline rather than sitting in a separate panel.

**Type.** Bespoke Slab (engraved voice) with Sentient Italic (corrective voice). Source: both Fontshare / Indian Type Foundry. License: Fontshare license, free for personal and commercial use. Fallback: Georgia, serif. Requirement was a squared, authoritative slab for the plate and a genuine, slightly literary italic for the hand — not an oblique.

**Hierarchy and scale.** 40px engraved primary → 22px engraved secondary → 21px inline gloss → 18px margin note → 15px foot plate → 14px plate label. The gloss is deliberately close in size to the line it interrupts, so neither voice outranks the other.

**Case, weight, spacing.** Engraved voice uppercase, 700 (primary) and 400 (secondary), +0.012em / +0.05em, line-height 1.46 to leave room for the interruptions. Corrective voice lowercase italic, 300–500, normal tracking. Tabular numerals in the engraved voice only.

**Color.** Ground `#FCFAF4` (not counted). Letterform colors: `#1B1A17` primary = engraved uppercase (~40%); `#6A675F` secondary = the engraved second register and the margin notes (~35%); `#B52A1B` vermilion accent = every inline gloss and every corrected value (~25%). Three active colors; vermilion means "a hand touched this".

**Space.** 50/34/110px padding. Engraved measure capped at 24ch so interruptions have room; margin notes hang at −1.2em inside a 2.4em indent, max 40ch; 30px around margin notes, 44px before the second register, 62px before the foot plate.

**Signature relationship.** Inline interruption. The authoritative line is never allowed to finish without the hand entering it, and the two voices differ in case, family, color and slope at once.

**Invariants.** Uppercase slab vs lowercase italic; inline (not adjacent) placement of the gloss; vermilion reserved for corrections; hanging margin notes.

**Allowed variation.** How many glosses interrupt a line; the engraved measure within 22–28ch.

**Prohibited normalisation.** Moving corrections into a sidebar, setting the gloss in the slab face, or using vermilion for errors in general rather than for hand-made changes.

**Risks.** `white-space: nowrap` on the gloss will overflow at narrow widths and needs a wrapping rule; uppercase Turkish İ at 1.46 leading needs checking.

**Round 2 translation.** The score-correction editor is the native case. Elsewhere: engraved voice for system facts, vermilion italic for anything the user has set, changed or overridden.
