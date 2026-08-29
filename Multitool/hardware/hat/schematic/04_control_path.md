# Sheet 04 — GPIB Control / Handshake Path

U4: TXS0108EPW.
U2: SN75161BN in turned-pin DIP socket.

## U4 channel order

A1/B1 = EOI
A2/B2 = DAV
A3/B3 = NRFD
A4/B4 = NDAC
A5/B5 = IFC
A6/B6 = SRQ
A7/B7 = ATN
A8/B8 = REN

- VCCA -> +3V3_PI.
- VCCB -> +5V_GPIB.
- OE -> GPIB_XLAT_EN.
- C41 = 100 nF VCCA-GND.
- C42 = 100 nF VCCB-GND.

## U2

- VCC -> +5V_GPIB.
- GND -> GND.
- TE -> GPIB_TE.
- DC -> GPIB_DC.
- C43 = 100 nF local.

Bus-side lines:
BUS_EOI
BUS_DAV
BUS_NRFD
BUS_NDAC
BUS_IFC
BUS_SRQ
BUS_ATN
BUS_REN

Check every U2 channel against the TI SN75161B function table before final ERC.
