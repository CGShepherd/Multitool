# Multitool

Multitool is a Raspberry Pi 5 based laboratory interface and programming platform.

The initial scope combines:

- IEEE-488 / GPIB control for legacy laboratory instruments, using a modernised gpib4pi-derived architecture.
- Raspberry Pi HAT identification EEPROM support, including a hardware disable/service jumper.
- Serial EEPROM programming support for compatible external devices.
- Parallel NVRAM read/program support, initially targeting DS1742 readout and DS1744P programming for Tektronix TDS3000-series service work.
- A mechanically robust, chassis-mounted IEEE-488 connector arrangement suitable for normal GPIB cable loading.

The primary host baseline is Raspberry Pi 5. Raspberry Pi 4 compatibility should be retained where practical but must not constrain the Pi 5 implementation.

## Repository structure

- `docs/` — requirements, architecture, decisions and design reviews.
- `hardware/hat/` — main GPIB / service HAT design.
- `hardware/adapters/serial-eeprom/` — serial EEPROM programming adapters.
- `hardware/adapters/ds17xx-nvram/` — DS17xx parallel NVRAM programming adapters.
- `software/gpib/` — GPIB configuration, tools and test software.
- `software/programmer/` — EEPROM/NVRAM programmer software.
- `mechanical/enclosure/` — enclosure, connector-bracket and thermal work.
- `references/` — datasheet/reference placeholders and source notes.

## Current status

Architecture definition and reference-design review stage. Schematic capture has not yet started.
