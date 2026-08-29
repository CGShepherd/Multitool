# Multitool Architecture

## 1. System overview

Multitool is a Raspberry Pi 5 based laboratory appliance combining GPIB instrument control and service-memory programming.

```text
                      Ethernet / Wi-Fi
                            |
                      Raspberry Pi 5
                            |
        +-------------------+-------------------+
        |                                       |
     Main HAT                            Service interfaces
        |                                       |
  GPIB transceivers                    Serial / parallel memory
        |                                       |
 chassis-mounted                               adapter
 IEEE-488 connector                            boards
        |                                       |
 HP / Tek / other                    EEPROM / NVRAM devices
 GPIB instruments
```

## 2. GPIB path

Current baseline:

```text
Raspberry Pi 5 GPIO
        |
Pi-side protection / level compatibility
        |
SN75160B + SN75161B
        |
IEEE-488 termination and bus network
        |
short internal interconnect
        |
chassis-mounted 24-pin IEEE-488 connector
```

The gpib4pi project is the reference design, not a PCB to clone unchanged.

The following aspects require formal review before schematic capture:

1. Pi 5 / RP1 GPIO behaviour.
2. 3.3 V GPIO compatibility with 5 V SN75160B/SN75161B terminal-side signalling.
3. GPIB transceiver default states during Pi boot/shutdown.
4. gpib4pi GPIO mapping against the current Linux `gpib_bitbang` implementation.
5. Termination network values and placement.
6. ESD/transient protection.
7. HAT EEPROM integration and disable jumper.

## 3. HAT EEPROM

The HAT ID EEPROM shall normally connect to the Raspberry Pi identification bus.

A service jumper shall allow it to be electrically isolated for programming, recovery or debugging.

A 2.54 mm service header is preferred over solder bridges.

## 4. Memory-programming architecture

The main HAT shall expose a service-programming interface rather than permanently mounting device-specific sockets.

### Serial devices

Initial targets:

- HAT ID EEPROM.
- 24Cxx-family EEPROMs.
- Tektronix programmable-feature-module EEPROMs, subject to exact device identification.

### Parallel NVRAM

Initial targets:

- DS1742: read and archive.
- DS1744P: program and verify.

Proposed implementation:

```text
Pi SPI / GPIO
    |
address register / counter
    |
8-bit data buffer
    |
control logic
    |
device-specific adapter PCB
    |
DS1742 / DS1744P
```

This avoids dedicating ~25 Raspberry Pi GPIOs to a parallel memory bus.

## 5. Mechanical architecture

Preferred order of investigation:

1. Modified COTS Raspberry Pi 5 / industrial HAT enclosure.
2. Larger COTS metal Pi/HAT enclosure.
3. Generic folded-metal instrument enclosure.

The IEEE-488 connector shall be mechanically supported by the enclosure or bracket rather than the HAT PCB.

The enclosure shall accommodate either passive or active Pi 5 cooling.
