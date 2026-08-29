# Sheet 01 — Raspberry Pi Header

J1: standard 2x20 Raspberry Pi HAT connector.

## GPIB GPIO assignments

Use `revA-signal-map.csv` as authoritative allocation.

## Power

Bring onto sheet:
- +5V_PI from physical pins 2 and 4.
- +3V3_PI from physical pins 1 and 17.
- GND from multiple Pi ground pins.

Both 5 V pins may be paralleled at J1.
Both 3.3 V pins may be paralleled at J1.

## Reserved HAT ID pins

- pin 27 / GPIO0 -> ID_SD only.
- pin 28 / GPIO1 -> ID_SC only.

## Unused GPIOs

Unused header pins should be brought to labelled non-populated test pads only if routing permits.
Do not fit a general-purpose expansion header by default.

## Pi 5 fan / cooling

The HAT shall not obstruct the Pi 5 fan connector or prevent use of an active cooler.
Mechanical clearance is a PCB-layout requirement.
