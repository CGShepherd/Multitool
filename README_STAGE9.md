# Multitool Stage 9 — Capture-Ready Pinout Freeze

This package closes the component-symbol uncertainty before KiCad capture.

Included:
- exact TI SN75160BN PDIP pinout;
- exact TI SN75161BN PDIP pinout;
- exact TXS0108EPW TSSOP pinout;
- CAT24C32 pin functions;
- complete point-to-point Rev A netlist;
- symbol/footprint policy;
- signal-by-signal schematic review checklist;
- Stage 9 decision additions.

This package intentionally does not claim a validated `.kicad_sch` file: the capture environment must
verify the selected KiCad symbols/footprints against these authoritative pin definitions.

Next gate: actual KiCad schematic capture, then ERC and signal-by-signal review before PCB placement.
