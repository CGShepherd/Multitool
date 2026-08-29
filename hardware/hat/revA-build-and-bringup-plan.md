# Rev A Hand Build and Bring-Up Plan

## Assembly order

1. Inspect bare PCB for shorts / fabrication defects.
2. Fit U3 and U4 TXS0108E first.
3. Inspect TSSOP joints under magnification; continuity check adjacent pins.
4. Fit SOIC EEPROM U5.
5. Fit 0805/1206 passives.
6. Fit decoupling and bulk capacitors.
7. Fit jumpers, test points and low-profile connectors.
8. Fit DIP sockets **without U1/U2 inserted**.
9. Fit Pi header last among board-level connectors.
10. Fit internal GPIB header.

## First electrical test — HAT not fitted to Pi

- check resistance +5V_GPIB to GND;
- check 3V3 to GND;
- verify GND/CHASSIS link;
- verify EEPROM jumper operation;
- inspect no shorts between translator pins.

## Powered test — Pi attached, U1/U2 removed

- boot Pi;
- verify +5V_GPIB and +3V3 rails;
- confirm GPIB_XLAT_EN stays LOW through early boot;
- test EEPROM read/write with JP1 fitted, then verify protected with JP1 removed;
- test startup service toggles GPIB_XLAT_EN.

## Transceiver test — U1/U2 fitted, no external instrument

- power down;
- insert U1/U2;
- reboot;
- scope TE/DC/PE/GPIB_XLAT_EN;
- verify no unexpected active bus outputs during boot;
- verify termination bias on representative bus lines.

## Loop / static GPIB test

- exercise data direction and control transitions without an instrument;
- verify translated 3.3 V and 5 V terminal-side levels;
- inspect DAV/NRFD/NDAC timing.

## First instrument connection

Use one non-critical GPIB instrument first.
Limit initial operations to:
- IFC;
- device addressing;
- identification/status query if supported;
- small read/write transfers.

Only after these tests should valuable vintage instruments be connected routinely.
