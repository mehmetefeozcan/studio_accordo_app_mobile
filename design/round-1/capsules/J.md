# J

**Premise (subject evidence).** Turkish distinguishes dotted and dotless i — İ/i and I/ı — and the app's own vocabulary is full of it: İlerleme, Kaldığın yer, Günaydın, doğruluk, Ölçü, Kütüphane. In a 10-year-old's reading these marks are not decoration; flattening them changes words. The page is built to give diacritics room: display type is set at 1.56 line-height so Ğ, İ, Ö and ü never crowd, and the spoken second-person words are the largest thing on the page while the measured values are demoted to a narrow secondary column.

**Type.** Ranade (spoken voice, display and wordmark) with General Sans (measured voice, small text). Source: both Fontshare / Indian Type Foundry. License: Fontshare license, free for personal and commercial use. Fallback: system-ui, sans-serif. Requirement was a display face with open counters and an unusually tall accent zone, paired with a neutral workhorse that can hold tabular figures at 16px.

**Hierarchy and scale.** 58px spoken voice → 30px lower spoken register → 16px measured column → 14px wordmark → 13px tail. The jump from 58 to 16 is abrupt on purpose: speech dominates, measurement is reference.

**Case, weight, spacing.** Mixed case, never uppercase except the letterspaced wordmark and tail tracking. Display 300 with 100 for the quiet lines, −0.01em. Measured column 400/600 at +0.02em, line-height 2.3. Tail 500 at +0.17em. Tabular numerals in the measured column only.

**Color.** Ground `#16222C` (not counted). Letterform colors: `#F8F4EB` ivory primary = spoken words and emphasised values (~45%), `#7FB9C6` cyan secondary = the quiet register, the whole measured column, the wordmark and the tail (~55%). Two active colors; ivory speaks, cyan reports.

**Space.** 60/30/90px padding. Asymmetric 62:38 split with a 36px gutter, secondary column dropped 22px below the display baseline. 58px under the wordmark, 76px before the lower register, 62px between splits, 66px before the tail. Lower register capped at 26ch.

**Signature relationship.** Generous leading as a linguistic requirement rather than a style: the accents are given measured vertical room, and the 62:38 split keeps speech and measurement from competing.

**Invariants.** 1.56 minimum line-height on display type; never uppercase the body; 62:38 asymmetry; ivory for address, cyan for measurement.

**Allowed variation.** Split ratio within 60:40–66:34; number of rows in the measured column.

**Prohibited normalisation.** Tightening display leading to fit more in, uppercasing Turkish text, or equalising the two columns.

**Risks.** Cyan on this ground needs a contrast check at 13px; Ranade's İ and ğ need visual confirmation at 58px.

**Round 2 translation.** Home, greeting and progress screens use the split directly. Tuner and metronome invert it: the measured column becomes dominant while keeping cyan as its color, so the roles stay legible.
