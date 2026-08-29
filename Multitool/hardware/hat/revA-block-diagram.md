# Rev A Electrical Block Diagram

```text
                                  +----------------------+
                                  |    Raspberry Pi 5    |
                                  |                      |
                                  | GPIO DIO1..DIO8      |
                                  | GPIO EOI..REN        |
                                  | GPIO TE/DC/PE        |
                                  +----+-------------+---+
                                       |             |
                                   3.3 V domain      |
                                       |             |
              +------------------------+             +-------------------+
              |                                                          |
        +-----v------+                                             +-----v------+
        | TXS0108E  |                                             | TXS0108E  |
        | DATA XLAT |                                             | CTRL XLAT |
        | 3.3 <-> 5 |                                             | 3.3 <-> 5 |
        +-----+------+                                             +-----+------+
              |                                                          |
          DIO1..DIO8                                        EOI DAV NRFD NDAC
              |                                              IFC SRQ ATN REN
        +-----v------+                                             +-----v------+
        | SN75160B   |                                             | SN75161B   |
        | data xcvrs |                                             | ctrl xcvrs |
        +-----+------+                                             +-----+------+
              |                                                          |
              +----------------------- IEEE-488 --------------------------+
                                          |
                                   chassis connector
```

## Control-path notes

- `TE` drives SN75160B TE and SN75161B TE.
- `DC` drives SN75161B DC.
- `PE` drives SN75160B PE.
- TE/DC/PE originate in the Pi 3.3 V domain and can directly meet the SN7516x TTL input-high threshold.
- Add optional small series resistors close to the Pi/HAT interface for edge/current limiting.
- Both TXS0108E OE inputs share `GPIB_XLAT_EN`.
- `GPIB_XLAT_EN` is hardware-default LOW.
