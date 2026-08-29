# Multitool Requirements

## Platform

**MT-PLAT-001** — Primary host shall be Raspberry Pi 5.

**MT-PLAT-002** — Raspberry Pi 4 compatibility should be retained where practical, but shall not constrain the Pi 5 implementation.

**MT-PLAT-003** — The system shall support either passive or active cooling. Final cooling method shall be chosen from assembled-system thermal testing.

**MT-PLAT-004** — The system shall be suitable for headless operation using Raspberry Pi OS Lite 64-bit.

## GPIB

**MT-GPIB-001** — Raspberry Pi shall operate as IEEE-488 System Controller / Controller-In-Charge for connected instruments.

**MT-GPIB-002** — The physical GPIB bus interface shall use dedicated IEEE-488 transceivers derived from the gpib4pi architecture, with SN75160B + SN75161B as the current baseline.

**MT-GPIB-003** — The design shall retain compatibility with Linux `gpib_bitbang` / linux-gpib where practical.

**MT-GPIB-004** — Existing gpib4pi GPIO mapping shall be retained unless electrical or Pi 5 compatibility analysis provides a compelling reason to change it.

**MT-GPIB-005** — Raspberry Pi GPIO shall not be exposed to out-of-spec voltage or current from the 5 V GPIB transceiver side.

**MT-GPIB-006** — The GPIB bus shall remain benign during Raspberry Pi boot, reset, shutdown and unpowered states.

**MT-GPIB-007** — The external 24-pin IEEE-488 connector shall be chassis-supported.

**MT-GPIB-008** — Normal connector insertion/removal forces, cable weight and cable torque shall not be transmitted into the Raspberry Pi or HAT PCB.

**MT-GPIB-009** — The HAT shall provide convenient diagnostic access to the sixteen GPIB bus signals and transceiver control signals.

## HAT EEPROM

**MT-HAT-001** — The board shall include a HAT identification EEPROM.

**MT-HAT-002** — The HAT EEPROM shall be electrically disableable using a user-accessible jumper/header arrangement.

**MT-HAT-003** — The same Raspberry Pi shall be capable of programming and verifying the on-board HAT EEPROM during development and servicing.

## Serial memory programming

**MT-MEM-001** — The service interface shall support read, program and verify operations for compatible serial EEPROMs.

**MT-MEM-002** — 24Cxx-family I2C EEPROMs shall be explicitly supported in the initial design.

**MT-MEM-003** — Programming software shall support non-destructive read and binary backup before any write operation.

**MT-MEM-004** — Device-specific programming adapters shall be removable and replaceable rather than permanently integrated into the main HAT.

## Parallel NVRAM programming

**MT-NVRAM-001** — The platform shall support non-destructive reading of DS1742-class NVRAM.

**MT-NVRAM-002** — The platform shall support programming and verification of DS1744P-class replacement NVRAM.

**MT-NVRAM-003** — The parallel programmer architecture shall support a byte-wide data bus, address generation and CE/OE/WE control without consuming an impractical number of Raspberry Pi GPIOs.

**MT-NVRAM-004** — No NVRAM address, data or control pin shall be driven while the target device VCC is absent.

**MT-NVRAM-005** — Density translation between DS1742 and DS1744P shall be explicit in software; raw device images shall never be automatically replicated or expanded without a defined memory map.

## Mechanical

**MT-MECH-001** — The system shall use a rigid metal enclosure, modified COTS Raspberry Pi enclosure, metal bracket, or equivalent rigid conductive support structure.

**MT-MECH-002** — Die-cast construction is not required.

**MT-MECH-003** — The enclosure shall support a panel/chassis-mounted IEEE-488 connector.

**MT-MECH-004** — The enclosure shall permit either passive or active Raspberry Pi 5 cooling.

**MT-MECH-005** — The enclosure shall provide practical access to power, Ethernet, USB and service/programming connections.
