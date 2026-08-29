# Sheet 07 — Power and Ground

## +5V_GPIB

+5V_PI -> FB1 footprint -> R71 removable 0 Ω isolation link -> +5V_GPIB.

FB1 may initially be populated as 0 Ω if ferrite selection is not justified by measurement.

On +5V_GPIB:
- C71 47 uF >=10 V bulk.
- C72 1 uF X7R.
- local 100 nF capacitors shown on functional sheets.

## +3V3

Use Pi 3.3 V directly.
C73 1 uF local bulk close to translators/EEPROM region.

## Ground and chassis

Distinct nets:
- GND
- CHASSIS

R74 = 0 Ω default GND-to-CHASSIS single bond.
C74 = DNP parallel capacitor footprint.
TP71 = GND.
TP72 = CHASSIS.
TP73 = +5V_GPIB.
TP74 = +3V3_PI.

No mounting hole shall connect to either net by default without explicit schematic symbol/net tie.
