# Stage 9 — Component Pinout Freeze and Capture-Ready Definition

Date: 2026-08-30
Status: Ready for KiCad schematic capture

## Purpose

Freeze exact physical pin mappings for the selected Rev A components so schematic capture does not
depend on unverified library symbols.

## U1 — TI SN75160BN, PDIP-20

Top-view pinout from TI:

| Pin | Function |
|---:|---|
| 1 | TE |
| 2 | B1 |
| 3 | B2 |
| 4 | B3 |
| 5 | B4 |
| 6 | B5 |
| 7 | B6 |
| 8 | B7 |
| 9 | B8 |
| 10 | GND |
| 11 | PE |
| 12 | D8 |
| 13 | D7 |
| 14 | D6 |
| 15 | D5 |
| 16 | D4 |
| 17 | D3 |
| 18 | D2 |
| 19 | D1 |
| 20 | VCC |

For Multitool:
- B1...B8 = IEEE-488 bus side DIO1...DIO8.
- D1...D8 = terminal / 5 V logic side connected to TXS0108E U3 B1...B8.
- TE = GPIB_TE.
- PE = GPIB_PE.
- VCC = +5V_GPIB.

## U2 — TI SN75161BN, PDIP-20

Top-view pinout from TI:

| Pin | Function |
|---:|---|
| 1 | TE |
| 2 | REN bus |
| 3 | IFC bus |
| 4 | NDAC bus |
| 5 | NRFD bus |
| 6 | DAV bus |
| 7 | EOI bus |
| 8 | ATN bus |
| 9 | SRQ bus |
| 10 | GND |
| 11 | DC |
| 12 | SRQ terminal |
| 13 | ATN terminal |
| 14 | EOI terminal |
| 15 | DAV terminal |
| 16 | NRFD terminal |
| 17 | NDAC terminal |
| 18 | IFC terminal |
| 19 | REN terminal |
| 20 | VCC |

For Multitool:
- pins 2...9 = IEEE-488 bus side.
- pins 12...19 = terminal / 5 V logic side connected through U4.
- TE = GPIB_TE.
- DC = GPIB_DC.
- VCC = +5V_GPIB.

## U3 / U4 — TI TXS0108EPW, TSSOP-20

Top-view PW pinout:

| Pin | Function |
|---:|---|
| 1 | A1 |
| 2 | VCCA |
| 3 | A2 |
| 4 | A3 |
| 5 | A4 |
| 6 | A5 |
| 7 | A6 |
| 8 | A7 |
| 9 | A8 |
| 10 | OE |
| 11 | GND |
| 12 | B8 |
| 13 | B7 |
| 14 | B6 |
| 15 | B5 |
| 16 | B4 |
| 17 | B3 |
| 18 | B2 |
| 19 | VCCB |
| 20 | B1 |

Multitool:
- VCCA = +3V3_PI.
- VCCB = +5V_GPIB.
- OE = GPIB_XLAT_EN.
- A side = Pi 3.3 V domain.
- B side = SN75160/161 terminal 5 V domain.

### U3 channel allocation

| Channel | Pi side A | U1 terminal side |
|---|---|---|
| 1 | DIO1 GPIO20 | D1 pin 19 |
| 2 | DIO2 GPIO26 | D2 pin 18 |
| 3 | DIO3 GPIO16 | D3 pin 17 |
| 4 | DIO4 GPIO19 | D4 pin 16 |
| 5 | DIO5 GPIO13 | D5 pin 15 |
| 6 | DIO6 GPIO12 | D6 pin 14 |
| 7 | DIO7 GPIO6 | D7 pin 13 |
| 8 | DIO8 GPIO5 | D8 pin 12 |

### U4 channel allocation

| Channel | Pi side A | U2 terminal side |
|---|---|---|
| 1 | EOI GPIO9 | EOI pin 14 |
| 2 | DAV GPIO10 | DAV pin 15 |
| 3 | NRFD GPIO24 | NRFD pin 16 |
| 4 | NDAC GPIO23 | NDAC pin 17 |
| 5 | IFC GPIO22 | IFC pin 18 |
| 6 | SRQ GPIO11 | SRQ pin 12 |
| 7 | ATN GPIO25 | ATN pin 13 |
| 8 | REN GPIO27 | REN pin 19 |

## U5 — onsemi CAT24C32, SOIC-8

Standard 8-pin serial EEPROM pinout:

| Pin | Function |
|---:|---|
| 1 | A0 |
| 2 | A1 |
| 3 | A2 |
| 4 | VSS |
| 5 | SDA |
| 6 | SCL |
| 7 | WP |
| 8 | VCC |

Multitool:
- pin 4 = GND.
- pin 5 = ID_SD.
- pin 6 = ID_SC.
- pin 7 = EEPROM_WP.
- pin 8 = +3V3_PI.
- address pins strapped per HAT+ address requirement.

## Critical capture rule

The KiCad symbol pin numbers must be checked against this document before any net is accepted.

Do not rely on generic `75160`, `75161`, `TXS0108E`, or `24C32` symbols without verifying every pin number.
