# Multitool Stage 10B — Corrected KiCad Capture Source

This corrected package supersedes the original Stage 10 ZIP.

It contains:
- project-local verified legacy KiCad symbols;
- generated `Multitool_revA.sch`;
- complete 16-line IEEE-488 termination network;
- translator/control circuitry;
- HAT EEPROM pull-ups, WP jumper and A0/A1/A2 address straps;
- +5V_PI -> +5V_GPIB filter/isolation path;
- 5 V / 3.3 V bulk and local decoupling;
- configurable GND-to-CHASSIS bond;
- import and verification instructions.

Because KiCad is not installed in the generation environment, this remains **import-ready, not ERC-validated**.

Deliberate remaining local task:
- complete and verify Raspberry Pi J1 physical-pin wiring from the Stage 9 point-to-point map after import,
  then run ERC.

Optional activity LED and physical test-point symbols may be added during local capture/layout; they do
not alter the frozen functional net topology.
