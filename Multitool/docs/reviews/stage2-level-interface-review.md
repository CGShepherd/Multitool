# Stage 2 — Pi 5 ↔ GPIB Transceiver Level Interface Review

Date: 2026-08-29
Status: Architecture down-selection before schematic capture

## 1. Objective

Select a safe, maintainable level-interface architecture between Raspberry Pi 5 3.3 V GPIO
and the 5 V SN75160B / SN75161B terminal-side ports.

## 2. Direction behaviour

### SN75160B data transceiver

The eight data channels DIO1…DIO8 move direction together under TE:

- TE = HIGH: terminal side → GPIB bus (Pi is driving).
- TE = LOW: GPIB bus → terminal side (Pi is receiving).

PE controls the GPIB-side output mode while talking.

### SN75161B management / handshake transceiver

The eight control channels do not share one common direction.

Groups include:

- ATN, REN, IFC: direction controlled by DC.
- SRQ: opposite direction to the ATN/REN/IFC group.
- DAV: direction controlled by TE.
- NDAC, NRFD: opposite direction to DAV.
- EOI: direction depends on TE/DC and, when TE == DC, also on ATN.

Therefore a single direction-controlled 8-bit buffer cannot safely translate the complete
SN75161B terminal bus without additional combinational direction logic.

## 3. Options considered

### Option A — Discrete LVC buffers / translators with generated direction logic

Advantages:
- deterministic direction control;
- conventional logic architecture;
- SOIC packages available for some functions.

Disadvantages:
- requires several parts;
- EOI direction requires extra logic;
- increases schematic complexity and opportunities for direction-control errors;
- adds more boot-state control logic.

Disposition: not preferred.

### Option B — SN74LVC8T245 plus smaller translators

A SN74LVC8T245 is an excellent fit for DIO1…DIO8 because all eight data bits share TE.
However, the SN75161B still requires multiple translator groups and special treatment for EOI.

Disposition: technically sound but unnecessarily complex for a hand-built Rev A.

### Option C — Two TXS0108E auto-bidirectional translators

Use one TXS0108E for DIO1…DIO8 and a second TXS0108E for the eight SN75161B terminal
signals.

Advantages:
- no direction pin required;
- each channel automatically accommodates the direction presented by the Pi and SN7516x;
- specifically rated by TI for both push-pull and open-drain applications;
- 3.3 V ↔ 5 V translation is within the specified supply ranges;
- up to 110 Mb/s push-pull data rate, far above GPIB requirements;
- no power-supply sequencing requirement;
- OE permits a deliberate global isolation state during boot/reset;
- two ICs replace a considerably larger direction-logic network.

Disadvantages / risks:
- available hand-solderable package is TSSOP-20 rather than SOIC;
- auto-direction translators require short, low-capacitance local traces;
- the design must avoid unnecessary external pull-ups/pull-downs on translated signal lines;
- bench validation against real SN75160B/SN75161B hardware is required before final PCB sign-off.

Disposition: **preferred Rev A architecture**.

## 4. Proposed implementation

```text
                  Raspberry Pi 5
                       3.3 V
                         |
        +----------------+----------------+
        |                                 |
   TXS0108E U3                      TXS0108E U4
   VCCA = 3.3 V                     VCCA = 3.3 V
   VCCB = 5.0 V                     VCCB = 5.0 V
        |                                 |
 DIO1…DIO8                        EOI/DAV/NRFD/NDAC/
        |                         IFC/SRQ/ATN/REN
        |                                 |
   SN75160B U1                      SN75161B U2
        |                                 |
        +-------------- IEEE-488 ---------+
```

TE, DC and PE are control inputs only on the SN7516x parts. Since the SN7516x input-high
threshold is TTL-compatible, 3.3 V Pi outputs can drive these inputs directly. For consistency
and fault containment, small series resistors should be considered on TE/DC/PE, but no
5 V up-translation is electrically required.

## 5. Translator enable / boot behaviour

Both TXS0108E OE pins shall be tied together as `GPIB_XLAT_EN`.

Required behaviour:

- hardware pull-down holds `GPIB_XLAT_EN = LOW` during Pi reset/boot;
- both translators remain high impedance;
- TE/DC/PE hardware biasing places SN75160B/SN75161B in the defined benign state;
- software configures all GPIB GPIO directions and control outputs;
- software then asserts `GPIB_XLAT_EN`.

Important integration issue:
the current upstream `gpib_bitbang` pin map consumes GPIO4 as ACT_LED and does not know
about a translator-enable GPIO. Rev A therefore has two possible paths:

1. tie OE to a hardware power-good / delayed-enable circuit independent of Linux; or
2. revise the activity-LED function / driver integration to provide an enable GPIO.

Preferred direction for Rev A: **hardware-controlled enable**, so normal upstream
`gpib_bitbang` remains unchanged.

## 6. Hand assembly

TXS0108E is available in TSSOP-20 (PW, 0.65 mm pitch). Although smaller than the desired
0805 passive geometry, it remains practical for careful hand assembly using:
- extended hand-solder-friendly pads;
- solder mask clearance;
- flux and fine-tip iron or hot air;
- generous component spacing.

The remainder of the board should continue to use 0805 passives where practical.

## 7. Decision

Adopt two TXS0108E devices as the provisional Rev A Pi↔SN7516x translation architecture,
subject to prototype validation.

This closes the topology-selection gate sufficiently to proceed to schematic architecture.

## 8. Remaining pre-capture tasks

1. Derive and freeze TE/DC/PE benign-state bias values.
2. Define hardware translator-enable timing / power-good circuit.
3. Confirm whether TE/DC/PE need simple series resistors only.
4. Confirm IEEE-488 termination implementation.
5. Define chassis / connector-shell / logic-ground topology.
6. Select HAT ID EEPROM and write-enable jumper.
7. Define test points and internal GPIB connector loom.
