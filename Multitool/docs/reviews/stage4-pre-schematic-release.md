# Stage 4 — Pre-Schematic Release Review

Date: 2026-08-29
Status: Architecture baseline ready for Rev A schematic capture

## 1. Scope closed by this release

This release closes the remaining pre-schematic architecture decisions for:

- HAT+ identification EEPROM and service programming;
- Pi 5 3.3 V / 5 V domain handling;
- GPIB transceiver power and decoupling;
- TXS0108E enable sequencing;
- IEEE-488 termination;
- ESD strategy;
- chassis / digital ground;
- internal connector allocation;
- hand-assembly component policy;
- software startup/shutdown sequencing.

## 2. HAT+ EEPROM

Selected baseline device:

**onsemi CAT24C32, 32 kbit (4 KiB), SOIC-8 preferred.**

Raspberry Pi's current HAT+ specification explicitly recommends CAT24C32-class EEPROMs
and requires:

- 24Cxx I2C EEPROM;
- 3.3 V operation;
- 16-bit memory addressing;
- whole-device hardware write protect;
- 100 kHz compatibility;
- no clock stretching;
- no paged-I2C-address scheme.

Implementation:

- EEPROM VCC = Pi 3.3 V.
- ID_SD / ID_SC used only for the HAT EEPROM.
- 3.9 kΩ pull-ups on ID_SD / ID_SC to 3.3 V, per current HAT+ guidance.
- WP pulled HIGH to 3.3 V with 1 kΩ.
- 2-pin 2.54 mm jumper `JP_EE_WRITE` shorts WP to GND when fitted.
- Jumper removed = normal protected state.
- Jumper fitted = EEPROM write enabled.
- Add test points for ID_SD, ID_SC, WP, 3V3 and GND.
- Address pins A0/A1/A2 tied to the required HAT+ address configuration at schematic capture.

The EEPROM is not disconnected from the ID bus for routine programming. The Pi programs it
in situ with WP deliberately released by the jumper.

## 3. 5 V rail architecture

The HAT is powered from the Pi 5 GPIO header. It does not power the Pi.

Use the Pi 5 V rail for:

- SN75160B;
- SN75161B;
- TXS0108E B-side rails.

Use the Pi 3.3 V rail for:

- TXS0108E A-side rails;
- CAT24C32;
- logic pull-ups / enable logic.

### 5 V entry network

Proposed:

```text
Pi +5V
  |
 F1 / FB1 footprint
  |
 +5V_GPIB
  |
 +-- 47 uF bulk
 +-- 1 uF local bulk
 +-- 100 nF per IC
```

Baseline assembly:
- fit a ferrite bead or 0 Ω link in FB1 position;
- 47 uF low-ESR electrolytic or polymer, hand-solderable;
- 1 uF X7R 0805/1206;
- 100 nF X7R 0805 at every active IC supply pin set.

Do not add a separate 5 V regulator.

## 4. SN75160B / SN75161B power gating

**Decision: no active 5 V power switch in Rev A.**

Reasons:

- TI explicitly provides power-up / power-down glitch protection.
- TI states the bus is not loaded when the transceivers are unpowered.
- Translation is independently held disabled during Pi boot.
- TE/DC/PE have defined weak default states.
- A load switch would add another failure mode and provides little benefit once OE sequencing is correct.

Provide a 0 Ω removable link in the +5V_GPIB feed so the transceiver rail can be isolated
during bench bring-up.

## 5. TXS0108E supply and enable

Two TXS0108E devices remain the Rev A translation baseline.

For each:
- VCCA = 3.3 V;
- VCCB = +5V_GPIB;
- 100 nF at VCCA;
- 100 nF at VCCB;
- optional 1 uF shared local bulk per pair.

Both OE pins share `GPIB_XLAT_EN`.

`GPIB_XLAT_EN`:
- driven by Pi GPIO17 / physical pin 11;
- 10 kΩ pull-down to GND;
- optional 100 Ω series resistor from Pi GPIO;
- LOW = all translated channels Hi-Z;
- HIGH only after software has configured gpib_bitbang.

No fixed RC-only enable.

## 6. TE / DC / PE

Pi GPIOs directly drive TE/DC/PE because the SN7516x inputs are TTL compatible.

Provisional hardware defaults:
- TE: 47 kΩ to GND;
- DC: 47 kΩ to GND;
- PE: 47 kΩ to GND.

Add 100 Ω series footprints in each Pi-to-control line.

During prototype bring-up verify with scope that no GPIB output is asserted before translator enable.

## 7. IEEE-488 termination

Retain the gpib4pi / IEEE-488 termination concept for each bus signal:

- 3.3 kΩ to +5V_GPIB;
- 6.2 kΩ to digital GND.

Use:
- 0805 individual resistors for Rev A, preferred for hand assembly and inspection;
- 1% tolerance preferred;
- termination components placed near the SN75160B/SN75161B bus side.

## 8. ESD strategy

Rev A shall **not populate additional signal-line TVS arrays by default**.

Reasons:
- SN7516x devices are purpose-built external GPIB transceivers.
- adding sixteen protection channels creates significant extra capacitance, routing and assembly burden;
- generic TVS parts can alter bus loading;
- the connector is chassis-mounted in a metal enclosure.

However, reserve optional footprints on a small panel/interconnect PCB or near the bus connector
for future low-capacitance protection if prototype ESD testing or field experience justifies it.

Priority protection:
- connector shell bonded directly to chassis at entry;
- avoid long exposed PCB signal paths;
- short internal loom;
- good return continuity.

## 9. Internal GPIB connector

Use a 26-way, 2x13, 2.54 mm keyed IDC or locking header on the HAT.

Rationale:
- hand solderable;
- inexpensive;
- exactly enough pins to carry the 24 IEEE-488 connector contacts plus two spare/chassis options;
- supports detachable harnessing.

### Proposed pin allocation

Use an essentially straight-through mapping to reduce wiring errors:

| Internal pin | IEEE-488 contact | Signal |
|---:|---:|---|
| 1 | 1 | DIO1 |
| 2 | 2 | DIO2 |
| 3 | 3 | DIO3 |
| 4 | 4 | DIO4 |
| 5 | 5 | EOI |
| 6 | 6 | DAV |
| 7 | 7 | NRFD |
| 8 | 8 | NDAC |
| 9 | 9 | IFC |
| 10 | 10 | SRQ |
| 11 | 11 | ATN |
| 12 | 12 | SHIELD / chassis-reference contact |
| 13 | 13 | DIO5 |
| 14 | 14 | DIO6 |
| 15 | 15 | DIO7 |
| 16 | 16 | DIO8 |
| 17 | 17 | REN |
| 18 | 18 | GND |
| 19 | 19 | GND |
| 20 | 20 | GND |
| 21 | 21 | GND |
| 22 | 22 | GND |
| 23 | 23 | GND |
| 24 | 24 | GND |
| 25 | spare | CHASSIS sense / DNP |
| 26 | spare | key/test/DNP |

The actual panel-connector contact designation must be verified against the chosen IEEE-488 connector
drawing before PCB release.

## 10. Grounding

- IEEE-488 connector shell: direct low-impedance chassis bond.
- GPIB ground contacts: digital GND.
- Digital GND to chassis: one controlled configurable point only.
- Default: removable 0 Ω bond.
- Parallel DNP capacitor footprint for optional HF-only bond.
- No scattered chassis pours connected accidentally through mounting holes.

Pi/HAT mounting holes shall be reviewed individually for chassis conductivity.

## 11. Hand-assembly policy

Default package policy:

- passives: 0805;
- larger power/bulk passives: 1206 / radial / electrolytic as appropriate;
- SN75160B / SN75161B: PDIP-20 or SOIC-20 acceptable;
- Rev A preference: PDIP-20 sockets if board area permits, because this is a one-off hand-built prototype;
- TXS0108E: TSSOP-20 PW package, with elongated hand-solder footprint;
- CAT24C32: SOIC-8 preferred;
- jumpers: 2.54 mm through-hole;
- internal connector: 2.54 mm through-hole;
- test points: through-hole loop or generous SMT pads;
- avoid 0402/0603 unless electrically necessary.

## 12. Rev A transceiver package preference

For the first hand-built board:
- **SN75160BN PDIP-20**
- **SN75161BN PDIP-20**

mounted in quality turned-pin sockets.

Rationale:
- easy replacement during bring-up;
- simplifies probing;
- no density pressure;
- proven TI package option.

A later Rev B may move to SOIC if desired.

## 13. Startup / shutdown software

A separate small service controls GPIO17.

Startup:
1. force GPIO17 LOW;
2. load/configure `gpib_bitbang`;
3. wait until interface configuration completes;
4. set GPIO17 HIGH;
5. record interface enabled.

Shutdown:
1. GPIO17 LOW;
2. leave transceivers isolated;
3. allow driver/system shutdown to continue.

The GPIB kernel driver remains unmodified.

## 14. Schematic capture gate

The electrical architecture is now sufficiently defined to begin Rev A schematic capture.

The schematic shall be divided into functional sheets:

1. Raspberry Pi 40-pin interface.
2. HAT+ EEPROM and service jumper.
3. Data translator + SN75160B.
4. Control translator + SN75161B.
5. TE/DC/PE and translator-enable control.
6. IEEE-488 termination and internal connector.
7. Power/decoupling.
8. Chassis bond/test points.

No PCB placement shall begin until schematic ERC and a signal-by-signal design review are complete.
