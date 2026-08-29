# GPIB GPIO Pin Map

Baseline: Linux upstream `gpib_bitbang`, `pin_map=gpib4pi-1.1`.

| Signal | BCM GPIO | Physical pin | Function |
|---|---:|---:|---|
| DIO1 | 20 | 38 | GPIB data |
| DIO2 | 26 | 37 | GPIB data |
| DIO3 | 16 | 36 | GPIB data |
| DIO4 | 19 | 35 | GPIB data |
| DIO5 | 13 | 33 | GPIB data |
| DIO6 | 12 | 32 | GPIB data |
| DIO7 | 6 | 31 | GPIB data |
| DIO8 | 5 | 29 | GPIB data |
| EOI | 9 | 21 | End or Identify |
| DAV | 10 | 19 | Data Valid |
| NRFD | 24 | 18 | Not Ready For Data |
| NDAC | 23 | 16 | Not Data Accepted |
| IFC | 22 | 15 | Interface Clear |
| SRQ | 11 | 23 | Service Request |
| ATN | 25 | 22 | Attention |
| REN | 27 | 13 | Remote Enable |
| PE | 7 | 26 | SN75160 Pull-up Enable |
| DC | 8 | 24 | SN75161 Direction Control |
| TE | 18 | 12 | Talk Enable, both transceivers |
| ACT_LED | 4 | 7 | Activity indication |

GPIO0 / GPIO1 (physical pins 27 / 28) remain reserved for the HAT identification EEPROM.
