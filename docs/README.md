# docs

Shared, cross-platform documentation. Start with the root README; these four
answer the questions a reviewer actually asks:

| file | question it answers |
|---|---|
| `METHOD.md` | how every number was produced (instruments, settings, formulas, limitations) |
| `COLUMNS.md` | what each CSV column means, on both platforms |
| `FAQ.md` | why `platform_profile` (not hwmon/thermal), how it coexists with `thermald`, why CF-SR4 gets `COOL` |
| `TESTING.md` | how to reproduce this on your own Let's Note and report a `Tested-by` |

None of them carries its own copy of the results — the tables live next to the
data they describe (`../linux/`, `../windows/`).
