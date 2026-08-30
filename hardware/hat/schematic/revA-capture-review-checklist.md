# Rev A Schematic Capture Review Checklist

## Component pinouts
- [ ] U1 pins 1-20 checked against TI SN75160BN top view.
- [ ] U2 pins 1-20 checked against TI SN75161BN top view.
- [ ] U3 pins 1-20 checked against TI TXS0108E PW top view.
- [ ] U4 pins 1-20 checked against TI TXS0108E PW top view.
- [ ] U5 pins 1-8 checked against CAT24C32 selected package.

## Signal mapping
- [ ] all 8 DIO Pi GPIOs match upstream gpib4pi.
- [ ] EOI/DAV/NRFD/NDAC/IFC/SRQ/ATN/REN match upstream gpib4pi.
- [ ] TE GPIO18.
- [ ] PE GPIO7.
- [ ] DC GPIO8.
- [ ] XLAT_EN GPIO17.
- [ ] Activity LED GPIO4.
- [ ] GPIO0/1 reserved solely for ID EEPROM.

## Voltage domains
- [ ] all TXS A ports are 3.3 V domain.
- [ ] all TXS B ports are 5 V terminal domain.
- [ ] no U1/U2 terminal output has a direct path to Pi GPIO.
- [ ] TXS OE hardware-default LOW.
- [ ] VCCA <= VCCB.

## Bus
- [ ] 16 bus signals each have correct termination pair.
- [ ] bus/terminal sides of U1 and U2 not reversed.
- [ ] J2 contact map matches selected panel connector harness.
- [ ] all GPIB grounds deliberate.

## Power
- [ ] removable 5V_GPIB link.
- [ ] bulk and local decoupling fitted.
- [ ] no unintended back-power path.

## HAT EEPROM
- [ ] 3.9k ID pullups.
- [ ] 1k WP pullup.
- [ ] jumper shorts WP low.
- [ ] address pins strapped correctly for HAT+.
- [ ] EEPROM default write protected.

## Mechanical/assembly
- [ ] standard HAT outline and hole pattern.
- [ ] no heavy IEEE-488 connector on PCB.
- [ ] DIP sockets accessible.
- [ ] TSSOP pads hand-solder friendly.
- [ ] J2 orientation works with saddle/rear bracket.
