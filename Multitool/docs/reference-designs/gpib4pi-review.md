# gpib4pi Reference Design Review

## Role

gpib4pi is the principal reference architecture for Multitool's GPIB interface.

It shall not be copied blindly. The purpose of this review is to identify which parts should be retained, changed or extended for a Raspberry Pi 5-era hand-built board.

## Retain provisionally

- Dedicated IEEE-488 transceiver architecture.
- SN75160B + SN75161B device pairing.
- Linux `gpib_bitbang` compatibility.
- Existing gpib4pi GPIO mapping, pending signal-by-signal trace confirmation.
- Correct IEEE-488 termination concept.

## Change / modernise

- Add HAT identification EEPROM.
- Add hardware EEPROM-disable/service jumper.
- Add explicit boot/shutdown-safe transceiver control biasing.
- Review 3.3 V Pi GPIO to 5 V transceiver interface.
- Add accessible test points.
- Move external 24-pin IEEE-488 connector off the HAT and onto the enclosure/chassis.
- Prefer larger hand-solderable passives.
- Add explicit Pi 5 compatibility validation.
- Add service/programmer interface.

## Open review items

1. Confirm exact gpib4pi hardware revision pin mapping against current Linux driver.
2. Confirm terminal-side output voltage limits of SN75160B/SN75161B versus Pi 5 GPIO absolute maximums.
3. Determine whether series resistors, clamps or level translation are required.
4. Review TE/DC/PE default states.
5. Review termination network component values and package sizes.
6. Review connector-shell / chassis / digital-ground strategy.
7. Review ESD protection needs.
