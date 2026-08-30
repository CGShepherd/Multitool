# Multitool HAT Mechanical Compliance Specification

## Board target
- standard HAT-class outline, nominally about 65 x 56.5 mm;
- four standard Pi-aligned mounting holes retained;
- 40-way GPIO connector in standard position;
- HAT/HAT+ ID EEPROM fitted.

Use the official Raspberry Pi HAT+ mechanical drawing as the production geometry reference.

## Height
Remote saddle mounting means the Pi Active Cooler is not beneath the HAT in normal use.
PDIP sockets are therefore acceptable.

Avoid underside components where practical so direct-stack compatibility remains possible with suitable spacers.

## Connector strategy
- J1: 40-way standard HAT header.
- J2: 26-way GPIB internal header near one board edge.
- JP1 EEPROM write-enable accessible from top/edge.
- no IEEE-488 Centronics connector on HAT.

## Placement priorities
1. 40-way header and four holes.
2. PDIP sockets with finger/probe clearance.
3. translators near DIP terminal-side pins.
4. termination banks near J2.
5. EEPROM near ID pins.
6. power entry/decoupling.
7. edge test points.
