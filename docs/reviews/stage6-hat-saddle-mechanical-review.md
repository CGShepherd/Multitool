# Stage 6 — HAT-Compliant Remote Saddle Mechanical Architecture

Date: 2026-08-30
Status: Mechanical architecture baseline before PCB placement

## 1. Objective

Preserve Multitool as a standard Raspberry Pi HAT/HAT+-class board while mounting it remotely
above a stock Multicomp Pro Pi-Box Pro 5 enclosure on a rigid U-shaped saddle.

The lower Pi-Box remains the compute/cooling module.
The upper saddle provides:
- HAT protection;
- HAT mechanical mounting;
- IEEE-488 connector support;
- service/programmer connector support;
- ribbon-cable strain relief.

## 2. Lower module

Baseline:
- Multicomp Pro MP013549 / Lincoln Binns Pi-Box Pro 5.
- Raspberry Pi 5.
- Raspberry Pi Active Cooler.
- stock Lincoln Binns extender PCB.
- stock carrier plate.
- stock enclosure retained as far as practical.

Published assembled size:
- width 108.5 mm;
- height 30 mm;
- depth 91 mm.

## 3. HAT mechanical baseline

Use the standard Raspberry Pi HAT-class board envelope as the design target:

- nominal width approximately 65 mm;
- nominal depth approximately 56.5 mm;
- four Pi-aligned mounting positions retained;
- 40-way 2x20 connector retained;
- HAT+ EEPROM retained.

Although current HAT+ requirements permit more mechanical freedom, Multitool deliberately retains
the familiar standard outline/hole pattern for interchangeability and future direct stacking.

## 4. Remote electrical connection

The HAT is not mechanically supported by the ribbon cable.

Use:
- Pi 40-way GPIO header -> short 40-way IDC ribbon -> HAT 40-way connector.
- target cable length: 100 mm nominal, 150 mm maximum.
- female-to-female IDC cable or equivalent keyed adapter.
- strain relief at the upper saddle.
- no cable routed through an unprotected sharp aluminium edge.

Preferred Pi-Box exit:
1. machined slot in the rear/top-rear region of the Pi-Box;
2. edge protected with nylon/rubber grommet or fitted cable escutcheon;
3. cable bend radius kept generous;
4. slot located away from Active Cooler intake/exhaust path.

Alternative:
a short bulkhead 2x20 feed-through board if direct ribbon routing proves mechanically awkward.

## 5. U-shaped saddle

The saddle is a separate folded metal structure attached to the Pi-Box extrusion, not to the removable lid.

Recommended construction:
- 1.5 mm aluminium minimum;
- 2.0 mm aluminium preferred for a one-off hand-built unit;
- one top bridge plate;
- two side cheeks;
- saddle mechanically fastened into the extrusion or dedicated end-plate/bracket holes;
- HAT mounted on four M2.5/M3 standoffs to the saddle top plate;
- removable top cover optional but recommended.

The saddle must withstand normal GPIB connector use and handling without bending.

## 6. HAT orientation

Preferred:
- HAT mounted horizontally, component side upward.
- 40-pin connector located toward the ribbon-entry side.
- DIP sockets and test points accessible from above.
- GPIB internal connector / loom exits toward the rear face of the saddle.

## 7. IEEE-488 connector

Preferred location: rear vertical face of the saddle.

The connector is connected to the HAT by a short detachable internal loom and its shell bonds directly to the saddle/chassis.

## 8. Service/programmer connectors

Reserve saddle panel positions for serial EEPROM and DS17xx programmer adapters, plus optional status/service interfaces.

## 9. Cooling

The Pi remains inside the stock Pi-Box with Active Cooler unobstructed.
The saddle shall not obstruct ventilation or form a sealed thermal pocket.

## 10. HAT-fit feasibility

The standard HAT envelope is considered feasible for:
- 2x PDIP-20 sockets;
- 2x TSSOP-20 translators;
- SOIC-8 EEPROM;
- 32 termination resistors;
- 2x20 GPIO header;
- 2x13 internal GPIB header;
- bulk capacitor;
- test points.

If detailed placement proves uncomfortably dense, the first fallback is a small passive daughterboard, not enlargement of the HAT.

## 11. Mechanical interface to Pi-Box

Do not machine the stock enclosure until accurate case CAD/dimensions are obtained.

Required data:
- complete Pi-Box Pro 5 assembly drawing or STEP;
- extrusion cross-section;
- lid/extrusion wall thickness;
- carrier plate location;
- Active Cooler envelope;
- existing screw/boss positions;
- end-panel geometry.

## 12. Decision

Leading architecture:

**stock Pi-Box Pro 5 lower module + short 40-way ribbon + standard HAT-compliant Multitool PCB +
rigid U-shaped aluminium saddle carrying/protecting the HAT and supporting all heavy external connectors.**
