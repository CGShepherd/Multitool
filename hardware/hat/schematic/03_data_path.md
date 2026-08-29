# Sheet 03 — GPIB Data Path

U3: TXS0108EPW.
U1: SN75160BN in turned-pin DIP socket.

## U3

- VCCA -> +3V3_PI.
- VCCB -> +5V_GPIB.
- OE -> GPIB_XLAT_EN.
- C31 = 100 nF VCCA-GND.
- C32 = 100 nF VCCB-GND.

A1...A8 -> Pi-side DIO1...DIO8.
B1...B8 -> U1 terminal-side DIO connections.

No external pull resistors on U3 translated channels.

## U1

- VCC -> +5V_GPIB.
- GND -> GND.
- TE -> GPIB_TE.
- PE -> GPIB_PE.
- C33 = 100 nF at U1.

Bus-side outputs -> BUS_DIO1...BUS_DIO8.

U1 pin numbers must be taken directly from the selected TI SN75160BN datasheet symbol.
Do not infer pin numbers from another vendor symbol.
