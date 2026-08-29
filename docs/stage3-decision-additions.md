# Stage 3 Decision Register Additions

Merge these rows into `docs/decision-register.md`.

| ID | Decision | Status | Rationale |
|---|---|---|---|
| DR-035 | Use BCM GPIO17 (physical pin 11) as `GPIB_XLAT_EN`. | CLOSED | Free in gpib4pi map; preserves upstream driver unchanged. |
| DR-036 | `GPIB_XLAT_EN` shall have a hardware pull-down and translators shall default disabled. | CLOSED | Guaranteed benign reset/boot state. |
| DR-037 | Reject fixed RC/timed translator enable as the sole enable mechanism. | CLOSED | Can release before Linux GPIO configuration is complete. |
| DR-038 | A separate startup/shutdown service shall assert/deassert translator enable after/before driver operation. | CLOSED | Clean sequencing without modifying `gpib_bitbang`. |
| DR-039 | Provide weak hardware pull-downs on TE, PE and DC; 47 kΩ provisional. | OPEN VALUE / CLOSED TOPOLOGY | Defines reset state while allowing Pi GPIO to override easily. |
| DR-040 | Retain IEEE-488 3.3 kΩ to +5 V / 6.2 kΩ to GND bus termination concept. | CLOSED | Matches reference gpib4pi and traditional IEEE-488 termination values. |
| DR-041 | Use hand-solder-friendly 0805 termination resistors or suitable resistor arrays. | CLOSED | Assembly/serviceability objective. |
| DR-042 | IEEE-488 connector shell shall bond directly to metal chassis at the connector. | CLOSED | Mechanical shield/current path controlled at entry point. |
| DR-043 | Digital 0 V shall have one configurable chassis-bond point only. | CLOSED | Avoid arbitrary multi-point ground paths and permit bench tuning. |
| DR-044 | Default chassis bond shall be a removable/configurable 0 Ω link with alternative stuffing options. | CLOSED | Allows direct, open or HF-only bond during validation. |
| DR-045 | GPIB connector shall connect through a short detachable internal loom, target ≤150 mm. | CLOSED | Mechanical robustness and serviceability. |
