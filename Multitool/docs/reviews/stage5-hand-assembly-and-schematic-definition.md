# Stage 5 — Hand-Assembly Optimisation and Rev A Schematic Definition

Date: 2026-08-29
Status: Schematic-definition baseline

## 1. Build philosophy

Multitool Rev A is intended to be the final personal-use unit. It is not a disposable prototype
and there is no planned production run.

Therefore the design shall optimise for:

1. first-build success;
2. complete hand assembly;
3. inspection and probing;
4. replacement and repair;
5. conservative electrical margins;
6. recovery from reasonable assembly/design mistakes without respinning the PCB.

PCB area and assembly cost are secondary.

## 2. Translator package re-evaluation

The previous architecture used two TXS0108E devices in TSSOP-20.

This was re-opened because TSSOP is the least hand-friendly package in the design.

### Alternative investigated — SN74LVC8T245

SN74LVC8T245 is available in SOIC-24 and is an excellent direction-controlled dual-supply
translator. It would work well for DIO1...DIO8 because those eight bits change direction together.

However, it is not a clean replacement for the SN75161B control group:

- DAV and NRFD/NDAC use opposing directions;
- ATN/REN/IFC and SRQ use opposing directions;
- EOI has state-dependent direction behaviour;
- several additional translators and direction logic would be required.

SN74LVC2T45 can solve the smaller direction groups but is only available in fine-pitch
SSOP/VSSOP packages, so the hand-assembly advantage largely disappears while part count increases.

### Decision

Retain **two TXS0108EPW TSSOP-20** devices.

Mitigations for hand assembly:

- use TI PW footprint dimensions as the electrical basis;
- extend toe pads beyond the nominal land pattern;
- provide generous solder-mask clearance;
- no components within 3 mm of the package edges where practical;
- orient both translators identically;
- clear pin-1 silkscreen and assembly markings;
- expose all translated groups at nearby test pads;
- solder these two devices first, before sockets and tall through-hole parts.

The remainder of the board retains 0805-or-larger / through-hole policy.

## 3. Rev A package baseline

| Function | Selected package |
|---|---|
| Raspberry Pi connector | 2x20 2.54 mm through-hole |
| SN75160B | PDIP-20, socketed |
| SN75161B | PDIP-20, socketed |
| TXS0108E x2 | TSSOP-20 PW |
| CAT24C32 | SOIC-8 |
| Signal/termination resistors | 0805 |
| Rail isolation / chassis links | 1206 or through-hole |
| Jumpers | 2.54 mm through-hole |
| GPIB internal connector | keyed 2x13 2.54 mm through-hole |
| Test points | through-hole loops / large pads |
| Bulk capacitor | radial or large SMD |

## 4. Schematic architecture

Rev A schematic is defined as eight functional sheets:

1. `01_pi_header`
2. `02_hat_eeprom`
3. `03_data_path`
4. `04_control_path`
5. `05_control_enable`
6. `06_gpib_bus_connector`
7. `07_power_ground`
8. `08_testpoints`

This structure is intended for direct KiCad capture.

## 5. Schematic completion criteria

A schematic is not released to PCB merely because ERC passes.

Before layout:
- every GPIB signal must be traced from Pi GPIO to internal connector;
- every transceiver terminal pin must be checked against TI pin numbering;
- translator A/B voltage domains must be checked pin-by-pin;
- HAT EEPROM address/WP wiring must be checked against Raspberry Pi HAT+ guidance;
- every termination pair must be counted;
- power-up defaults must be reviewed without software assumptions;
- connector ground and chassis contacts must be checked against the exact purchased connector;
- all fitted/DNP configuration components must be unambiguous in the BOM.
