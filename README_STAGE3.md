# Multitool Stage 3 Update

Copy this archive into the Multitool repository root.

This update closes most pre-schematic boot/ground/termination architecture:

- selects GPIO17 as translator-enable control;
- rejects uncontrolled RC-only enable;
- defines hardware-default-low TXS0108E OE;
- establishes provisional TE/DC/PE reset biasing;
- retains 3.3 kΩ / 6.2 kΩ IEEE-488 termination;
- establishes connector-shell/chassis and single-point digital-ground policy;
- defines a short detachable internal GPIB loom.

Next stage:
1. HAT EEPROM part/WP jumper selection.
2. 5 V rail and decoupling/power-gating review.
3. ESD review.
4. hand-assembly BOM/package policy.
5. Rev A schematic capture gate.
