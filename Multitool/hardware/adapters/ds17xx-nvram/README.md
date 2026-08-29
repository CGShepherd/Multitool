# DS17xx NVRAM Adapter

Initial targets:

- DS1742 readout and backup.
- DS1744P programming and verification.

The main Pi/HAT should not directly expose a full parallel bus. A daughterboard/interface should provide:

- address generation;
- 8-bit bidirectional data interface;
- CE/OE/WE control;
- target power switching/sequencing;
- device-specific socket or harness.

The original DS1742 contents must be backed up before any write operation is attempted.
