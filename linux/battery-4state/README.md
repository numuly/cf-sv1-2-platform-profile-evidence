# battery-4state — the same matrix on battery

Four runs on battery with EPP pinned to performance (`bat_<SEFM>_<SEPL>.csv` +
`.csv.meta` + `.csv.windows`), summarised in `summary.csv`.

One round per state, so it is a trend, not a distribution. On battery the
platform's own policy dominates: locked states land near ~10 W and unlocking
adds only 0.2–0.4 W, unlike the ~16 W difference on AC.
Schema: `../../docs/COLUMNS.md`; methods: `../../docs/METHOD.md`.
