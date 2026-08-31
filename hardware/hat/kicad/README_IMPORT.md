# Multitool Rev A — KiCad Import Procedure

This directory contains a **generated KiCad legacy-format capture source**, not an ERC-validated modern
KiCad project. The environment used to generate it does not contain KiCad.

Files:
- `Multitool_revA.sch` — legacy Eeschema schematic source.
- `Multitool-cache.lib` — project-local custom symbol cache with the Stage 9 verified pin numbers.

## Required local verification

1. Make a backup/branch.
2. Open `Multitool_revA.sch` in your installed KiCad version.
3. Allow KiCad to import/convert the legacy schematic.
4. Save as the modern `.kicad_sch` format in the same project directory.
5. Check U1, U2, U3, U4 and U5 pin numbers visually against `docs/reviews/stage9-pinout-freeze.md`.
6. Confirm the imported library symbols resolve correctly.
7. Complete the Raspberry Pi J1 physical wiring using `revA-point-to-point-netlist.csv`.
   The generated source intentionally leaves J1 largely documentary rather than risking a false physical-pin connection.
8. Add/verify power symbols and no-connect markers as required by your KiCad version.
9. Run ERC.
10. Resolve every ERC warning/error explicitly; do not waive warnings globally.
11. Export a PDF and netlist for peer review before PCB layout.

## Authority order if anything disagrees

1. Manufacturer datasheet.
2. Stage 9 frozen pinout review.
3. Stage 9 point-to-point netlist.
4. Imported schematic.
5. Library defaults.

The generated schematic must never override the higher-authority sources.

## Stage 10B correction

The corrected source also includes the previously omitted power-entry/isolation network, rail decoupling,
GND/CHASSIS configuration network, and CAT24C32 address straps. Use this corrected package rather than
the original Stage 10 ZIP.
