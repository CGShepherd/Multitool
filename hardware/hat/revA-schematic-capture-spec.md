# Multitool Rev A — Schematic Capture Specification

## A. Raspberry Pi header

Use the standard 2x20 Raspberry Pi HAT/HAT+ connector.

Reserve:
- GPIO0 / ID_SD — EEPROM only.
- GPIO1 / ID_SC — EEPROM only.
- GPIO17 — `GPIB_XLAT_EN`.

Retain upstream gpib4pi mapping for GPIB and TE/DC/PE.

Expose:
- 5 V;
- 3.3 V;
- GND;
- all used GPIO net names.

## B. HAT+ EEPROM block

U5: CAT24C32, SOIC-8.

Connections:
- VCC -> 3V3.
- VSS -> GND.
- SDA -> ID_SD.
- SCL -> ID_SC.
- SDA/SCL -> 3V3 through 3.9 kΩ each.
- WP -> 3V3 through 1 kΩ.
- JP_EE_WRITE -> WP to GND when shunt fitted.
- 100 nF local decoupling.
- test points on SDA/SCL/WP/3V3/GND.

A0/A1/A2: strap per final HAT+ address requirement.

## C. Data path

Pi DIO1…DIO8 -> U3 TXS0108E A1…A8.
U3 B1…B8 -> U1 SN75160B terminal ports.

U3:
- VCCA 3V3;
- VCCB +5V_GPIB;
- OE `GPIB_XLAT_EN`;
- 100 nF on each supply;
- no external signal pull resistors.

U1:
- SN75160BN PDIP-20;
- socketed;
- +5V_GPIB;
- 100 nF local;
- TE from Pi through 100 Ω footprint;
- PE from Pi through 100 Ω footprint;
- 47 kΩ pull-down on TE and PE.

## D. Control path

Pi EOI/DAV/NRFD/NDAC/IFC/SRQ/ATN/REN -> U4 TXS0108E A-side.
U4 B-side -> U2 SN75161B terminal ports.

U2:
- SN75161BN PDIP-20;
- socketed;
- +5V_GPIB;
- 100 nF local;
- TE shared with U1;
- DC from Pi via 100 Ω footprint;
- 47 kΩ pull-down on DC.

## E. Translator enable

GPIO17 -> optional 100 Ω -> `GPIB_XLAT_EN`.
10 kΩ `GPIB_XLAT_EN` to GND.
`GPIB_XLAT_EN` -> OE U3 + OE U4.
Test point on enable net.

## F. Bus termination

For each of the 16 IEEE-488 signal nets:
- 3.3 kΩ to +5V_GPIB.
- 6.2 kΩ to GND.

Use 0805, 1%.

## G. External/internal connection

J2: 2x13 2.54 mm keyed through-hole header.

Route all 24 IEEE-488 connector contacts and two spare positions.

Add test pads near J2 for:
- DIO1;
- DAV;
- NRFD;
- NDAC;
- ATN;
- IFC;
- SRQ;
- REN;
- GND;
- CHASSIS.

## H. Power

Pi 5V -> FB1 (ferrite bead / 0 Ω selectable) -> +5V_GPIB.
Provide removable 0 Ω rail-isolation link after FB1.

+5V_GPIB:
- 47 uF bulk;
- 1 uF ceramic;
- 100 nF at U1/U2/U3/U4.

3V3:
- 1 uF shared local;
- 100 nF at U3/U4/U5.

No separate regulator.

## I. Ground / chassis

Create distinct nets:
- GND;
- CHASSIS.

Connector metal shell -> CHASSIS.
Single configurable bond:
- R_CHASSIS = 0 Ω default;
- C_CHASSIS = DNP parallel footprint.

Review mounting holes:
- do not connect to CHASSIS or GND by default unless explicitly intended.

## J. Testability

Minimum labelled test points:
- +5V_GPIB;
- 3V3;
- GND;
- CHASSIS;
- GPIB_XLAT_EN;
- TE;
- DC;
- PE;
- DIO1;
- DIO8;
- DAV;
- NRFD;
- NDAC;
- ATN;
- IFC;
- SRQ;
- REN;
- ID_SD;
- ID_SC;
- EEPROM_WP.

## K. ERC rules

Before PCB:
- no unconnected bidirectional translator channels;
- no floating control inputs;
- verify no 5 V net directly reaches Pi GPIO;
- verify VCCA <= VCCB for TXS0108E;
- verify EEPROM WP defaults protected;
- verify all bus termination pairs;
- verify single intended GND/CHASSIS bond;
- verify no accidental power path from HAT back into Pi except through normal header rails.
