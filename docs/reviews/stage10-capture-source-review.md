# Stage 10B — Corrected Generated KiCad Capture Source Review

Date: 2026-08-30
Status: Import-ready; local KiCad validation required

## Captured
- U1 SN75160BN verified physical pin numbers.
- U2 SN75161BN verified physical pin numbers.
- U3/U4 TXS0108EPW verified PW pin numbers.
- U5 CAT24C32 pin functions.
- CAT24C32 A0/A1/A2 strapped LOW for 0x50.
- J2 26-way internal GPIB connector.
- all 16 IEEE-488 3.3k/6.2k termination pairs.
- TE/DC/PE series/default networks.
- translator OE default network.
- EEPROM ID pull-ups, WP pull-up and programming jumper.
- +5V_PI entry, optional bead/0R, removable +5V_GPIB isolation link.
- +5V_GPIB bulk/local decoupling and 3.3V local decoupling.
- configurable 0R/DNP-capacitor GND-to-CHASSIS bond.
- named 3.3V, 5V terminal-domain and IEEE-488 bus nets.

## Deliberate limitation
J1 is represented but its GPIO pins are not auto-wired. Complete/verify locally from Stage 9 after KiCad
imports the custom connector symbol. This prevents an unvalidated mirrored 2x20 header from becoming
the apparent design authority.

## Release criterion before PCB
- import/save as modern `.kicad_sch`;
- verify J1 physical pins;
- verify all custom symbol pin numbers;
- run ERC;
- explicitly resolve all warnings/errors;
- export PDF/netlist for signal-by-signal peer review.
