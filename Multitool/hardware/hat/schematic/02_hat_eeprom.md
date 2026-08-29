# Sheet 02 — HAT EEPROM

U5: CAT24C32, SOIC-8.

- VCC -> +3V3_PI.
- GND -> GND.
- SDA -> ID_SD.
- SCL -> ID_SC.
- R51 = 3.9 kΩ ID_SD to +3V3_PI.
- R52 = 3.9 kΩ ID_SC to +3V3_PI.
- R53 = 1 kΩ WP to +3V3_PI.
- JP1 = 2-pin 2.54 mm shunt WP to GND.
- C51 = 100 nF 0805 local decoupling.
- TP51 SDA.
- TP52 SCL.
- TP53 WP.

Normal state: JP1 OPEN -> writes protected.
Programming state: JP1 FITTED -> WP LOW.

A0/A1/A2 must be strapped according to the selected HAT+ address implementation before final capture.
Place explicit zero-ohm strap footprints if useful rather than hiding address selection in copper.
