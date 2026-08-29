# Stage 1 GPIB Interface Review

Date: 2026-08-29
Status: Engineering review before schematic capture

## Conclusions

### 1. Raspberry Pi 5 software compatibility — CLOSED

The current upstream Linux `drivers/gpib/gpio/gpib_bitbang.c` source explicitly includes
a GPIO lookup table comment covering bcm27xx-based Raspberry Pis including Pi 4 and Pi 5,
and retains the `gpib4pi-1.1` selectable pin map.

Decision: retain the existing gpib4pi GPIO allocation unless a later electrical/layout
constraint forces a change. A Pi-5-specific GPIB driver fork is not required at this stage.

### 2. Reference gpib4pi signal allocation — CLOSED FOR ARCHITECTURE

Current upstream mapping:

| GPIB / control signal | BCM GPIO | Pi header pin |
|---|---:|---:|
| DIO1 | 20 | 38 |
| DIO2 | 26 | 37 |
| DIO3 | 16 | 36 |
| DIO4 | 19 | 35 |
| DIO5 | 13 | 33 |
| DIO6 | 12 | 32 |
| DIO7 | 6 | 31 |
| DIO8 | 5 | 29 |
| EOI | 9 | 21 |
| DAV | 10 | 19 |
| NRFD | 24 | 18 |
| NDAC | 23 | 16 |
| IFC | 22 | 15 |
| SRQ | 11 | 23 |
| ATN | 25 | 22 |
| REN | 27 | 13 |
| PE | 7 | 26 |
| DC | 8 | 24 |
| TE | 18 | 12 |
| Activity LED | 4 | 7 |

The current driver uses GPIO descriptors rather than assuming direct BCM register access,
which is important for Pi 5 / RP1 compatibility.

### 3. Pi ↔ SN75160B/SN75161B logic interface — DIRECT CONNECTION NOT APPROVED

TI specifies SN75160B terminal-side logic inputs as TTL compatible:
VIH >= 2.0 V and VIL <= 0.8 V. Therefore a 3.3 V Pi output can drive the transceiver inputs.

In the reverse direction, TI specifies terminal-side VOH >= 2.7 V and approximately
3.5 V typical under the specified load. The legacy datasheet does not provide a maximum
VOH that demonstrates compliance with a 3.3 V-only Raspberry Pi GPIO input.

Raspberry Pi documentation describes the GPIO header signals as 3.3 V logic / 3.3 V-tolerant.

Decision: the Multitool design shall not rely on an unprotected direct transceiver-output
to Pi-input connection. A bidirectional level/protection stage shall be selected before
schematic freeze.

Preferred investigation path:
1. 3.3 V LVC-family buffers/transceivers with 5 V-tolerant inputs, organised around the
   known SN75160/SN75161 direction-control groups.
2. Only if materially simpler, assess current-limited/clamped direct interfaces with
   explicit power-sequencing analysis.
3. Avoid passive resistor dividers on bidirectional signal paths.

### 4. SN75160B + SN75161B — RETAIN

Both parts remain active TI products and are purpose-designed IEEE-488 transceivers.
SN75161B remains the correct control transceiver for a single-controller system.

Decision: retain SN75160B + SN75161B as the Rev A physical-layer baseline.

### 5. Power-up / power-down behaviour — PARTIALLY CLOSED

TI provides internal power-up / power-down output disable and specifies no GPIB bus loading
when VCC is absent. This is useful but does not remove the need to define TE/DC/PE behaviour
during Pi boot/reset.

Decision: add explicit biasing / enable control so the board assumes a benign GPIB state
until software intentionally enables control.

### 6. HAT EEPROM approach — REFINED

Raspberry Pi's HAT design guidance reserves GPIO0/1 exclusively for the ID EEPROM and
requires the EEPROM pull-ups on the add-on board. The guidance explicitly supports a
user-settable jumper for EEPROM write-enable / reflashing.

Decision:
- Use a compliant 3.3 V HAT/HAT+ ID EEPROM.
- Keep GPIO0/1 dedicated to identification only.
- Implement the user-accessible jumper around EEPROM write protection / service mode,
  rather than casually disconnecting arbitrary devices onto the ID bus.
- Provide dedicated test/program access to the EEPROM.
- Select the precise EEPROM and legacy-HAT versus HAT+ data format during schematic stage.

## Items still open before schematic capture

1. Select and prove the Pi-side level/protection topology.
2. Derive SN75161 terminal-channel direction groups from TE/DC truth table and map them
   to the proposed level-buffer architecture.
3. Define TE/DC/PE hardware default states.
4. Confirm IEEE-488 termination values and topology against gpib4pi 2.1 schematic.
5. Define connector shell / chassis / digital ground topology.
6. Select ESD protection, if any, that does not compromise IEEE-488 signalling.
7. Select HAT EEPROM device and final jumper/WP topology.
