# Rev A Schematic Review Checklist

## Architecture
- [ ] Pi 5 header pinout matches upstream gpib4pi mapping.
- [ ] GPIO17 used only for `GPIB_XLAT_EN`.
- [ ] GPIO0/1 used only for HAT+ EEPROM.

## Voltage domains
- [ ] No direct 5 V output reaches a Pi GPIO.
- [ ] U3/U4 VCCA = 3.3 V.
- [ ] U3/U4 VCCB = +5V_GPIB.
- [ ] OE defaults LOW.

## GPIB control
- [ ] TE shared to U1/U2 correctly.
- [ ] DC only to U2.
- [ ] PE only to U1.
- [ ] TE/DC/PE default pulls present.
- [ ] Series-resistor footprints present.

## EEPROM
- [ ] CAT24C32 correct pinout.
- [ ] 3.9 kΩ ID pull-ups.
- [ ] 1 kΩ WP pull-up.
- [ ] write-enable jumper shorts WP to GND.
- [ ] decoupling present.
- [ ] test points present.

## Power
- [ ] +5V_GPIB entry link/bead.
- [ ] 47 uF + 1 uF bulk.
- [ ] local 100 nF decoupling.
- [ ] 3.3 V decoupling.

## IEEE-488
- [ ] all 16 bus signals present.
- [ ] each has 3.3 kΩ / 6.2 kΩ termination.
- [ ] J2 mapping verified against chosen panel connector datasheet.
- [ ] ground contacts mapped intentionally.

## Chassis
- [ ] connector shell to CHASSIS.
- [ ] only one intentional GND↔CHASSIS bond.
- [ ] mounting-hole copper reviewed.

## Testability
- [ ] key control and bus test points fitted.
- [ ] socket clearance around U1/U2.
- [ ] TSSOP hand-solder access around U3/U4.
- [ ] jumper reachable in enclosure.

## Release gate
- [ ] ERC clean.
- [ ] signal-by-signal peer review complete.
- [ ] power-up state reviewed.
- [ ] no PCB layout until checklist signed off.
