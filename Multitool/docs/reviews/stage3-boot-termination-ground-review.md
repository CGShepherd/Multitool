# Stage 3 — Boot Safety, IEEE-488 Termination and Grounding Review

Date: 2026-08-29
Status: Pre-schematic architecture review

## 1. Purpose

Close the remaining electrical architecture items required before Rev A schematic capture:

- safe startup/reset/shutdown behaviour;
- TE/DC/PE default state strategy;
- translator enable control;
- IEEE-488 termination network;
- chassis / connector shell / logic-ground topology.

## 2. Upstream driver behaviour relevant to hardware defaults

Current upstream `gpib_bitbang` uses:

- `PE = 1`, `TE = 1` for WRITE/talker direction;
- `PE = 0`, `TE = 0` for READ/listener direction;
- `DC = 0` when requesting system-controller operation;
- GPIOs change direction dynamically for DAV/NRFD/NDAC/EOI/data.

Therefore the hardware must not assume one permanent TE/DC/PE state is sufficient for normal operation.

## 3. Translator-enable architecture

### Rejected: fixed RC / timed enable

A simple RC or power-good delay can release the translators before Linux has configured all GPIOs.
This produces a race condition and is not acceptable for Rev A.

### Selected: dedicated Pi GPIO plus hardware pull-down

Use a currently unused Raspberry Pi header GPIO as `GPIB_XLAT_EN`.

Provisional selection: **BCM GPIO17, physical pin 11**.

Reason:
- not used by the gpib4pi-1.1 mapping;
- available on Pi 5 and Pi 4;
- does not disturb upstream `gpib_bitbang`;
- can be controlled by a separate startup/shutdown service;
- a hardware pull-down guarantees OFF during reset and when the Pi is absent/unpowered.

Implementation:

- 10 kΩ pull-down from `GPIB_XLAT_EN` to GND;
- GPIO17 drives both TXS0108E OE pins;
- optional 100 Ω series resistor between GPIO17 and OE net;
- translators disabled unless GPIO17 is actively HIGH.

Software sequencing:

1. Boot with translators disabled.
2. Load/configure `gpib_bitbang`.
3. Configure TE/DC/PE and GPIB GPIO directions.
4. Assert GPIO17 HIGH.
5. Normal operation.
6. On shutdown service: GPIO17 LOW before unloading driver / powering down.

This preserves the upstream GPIB driver unchanged.

## 4. TE / DC / PE default-state strategy

The SN75160B/SN75161B terminal-side control inputs are TTL-compatible, so Pi 3.3 V logic is valid.

However, while the translators are OFF, the GPIB signal inputs presented to the SN7516x terminal side
must not be allowed to cause uncontrolled bus assertion.

Preferred Rev A strategy:

- Keep `GPIB_XLAT_EN` LOW during boot.
- Hold **TE = 0**, **PE = 0**, **DC = 0** using weak hardware pull-downs (47 kΩ provisional).
- Pi GPIO outputs override these pulls after driver configuration.
- Confirm these values against the final schematic and power-up bench test.

Rationale:
- TE = 0 places SN75160B GPIB-side data drivers high impedance.
- Driver code naturally uses TE = 0 / PE = 0 for the receive/listener state.
- DC = 0 is also the upstream driver's system-controller configuration.

Important residual item:
SN75161B bus-control channels must still be validated at power-up with the translator disabled because the
terminal-side channel inputs can otherwise float. If bench analysis shows any possibility of bus assertion,
the preferred mitigation is to gate the 5 V supply to the SN7516x pair rather than add pull resistors to all
TXS-translated channels.

## 5. IEEE-488 termination network

The reference gpib4pi implementation deliberately uses IEEE-488-value pull-up / pull-down termination:

- **3.3 kΩ to +5 V**
- **6.2 kΩ to GND**

for the bus signal lines.

These values bias an undriven line to approximately:

`5 V × 6.2 / (3.3 + 6.2) ≈ 3.26 V`

and provide the expected IEEE-488 passive termination/loading.

Decision:
- retain the gpib4pi 3.3 kΩ / 6.2 kΩ termination values;
- use individual 0805 resistors or hand-solder-friendly resistor arrays;
- 1% tolerance preferred although 5% is adequate to the traditional interface requirement;
- place the network electrically close to the SN75160B/SN75161B / external-bus interface.

The final schematic review shall ensure the external network is not duplicating an internal active
termination function in a way that violates the IEEE-488 load budget.

## 6. Chassis, connector shell and logic ground

### Selected baseline

Use a conductive metal enclosure with the IEEE-488 connector shell mechanically and electrically bonded
to chassis at the connector entry point.

The Raspberry Pi / HAT digital 0 V shall **not be hard-bonded to chassis at multiple arbitrary points**.

Provide a controlled single-point chassis-to-digital-ground option on the HAT:

- default assembly: direct 0 Ω link at one defined point;
- alternative stuffing positions to permit:
  - no link;
  - RC / capacitor-only HF bond if later measurement requires it.

Rationale:
- the controller is normally powered from an isolated low-voltage Pi PSU;
- a single defined connection avoids accidental multi-point chassis-current paths;
- keeping the option configurable supports bench investigation if sensitive audio measurement setups show
  ground-loop behaviour.

### GPIB ground conductors

All IEEE-488 signal-return / ground pins shall connect to digital 0 V as required by the interface.
The connector metal shell is treated as chassis/shield, not casually used as a signal-return conductor.

## 7. Internal connector loom

The panel-mounted IEEE-488 connector shall connect to the HAT through a short internal loom.

Provisional requirements:

- target length ≤150 mm;
- all sixteen IEEE-488 signals plus required grounds carried;
- ground conductors interspersed where practical;
- keyed / polarised internal connector;
- no unsupported flying wires directly soldered to the HAT;
- strain relief at the chassis connector.

A 2x13 or 2x15 2.54 mm locking IDC/Molex-style connector is preferred for hand assembly, subject to final
pin-count and ground allocation.

## 8. Decisions

1. Dedicated GPIO17 controls translator enable.
2. Translator OE defaults LOW via hardware.
3. RC-only automatic enable is rejected.
4. TE/PE/DC receive weak default pull-downs, values provisional at 47 kΩ.
5. Retain 3.3 kΩ / 6.2 kΩ IEEE-488 termination concept.
6. GPIB connector shell bonds directly to metal chassis.
7. Digital ground connects to chassis at one configurable controlled point only.
8. Short detachable internal loom connects HAT to panel-mounted IEEE-488 connector.

## 9. Remaining architecture items before schematic capture

- HAT EEPROM exact part and WP jumper implementation.
- SN7516x 5 V rail decoupling and optional power gating decision.
- TXS0108E decoupling and OE details.
- Final internal connector pinout.
- ESD protection decision.
- Initial BOM/package choices for hand assembly.
