# Rev A Boot / Ground Implementation Notes

## Translator enable

```text
Pi GPIO17 ----100R(optional)----+---- OE U3 TXS0108E
                               |
                               +---- OE U4 TXS0108E
                               |
                              10k
                               |
                              GND
```

Both OE inputs are LOW until software explicitly asserts GPIO17.

## Control defaults

Provisional:

```text
TE ---- 47k ---- GND
PE ---- 47k ---- GND
DC ---- 47k ---- GND
```

Final values to be confirmed in schematic review.

## Chassis bond

Provide a dedicated configuration location:

```text
DIGITAL_GND ---- [R_CHASSIS 0R / DNP] ---- CHASSIS

Optional parallel footprint:
DIGITAL_GND ---- [C_CHASSIS DNP] --------- CHASSIS
```

Do not scatter chassis bonds elsewhere on the HAT.

## Connector shell

Panel IEEE-488 connector shell -> direct low-impedance metal-to-metal chassis bond.

## Bus termination

Per signal:

```text
+5V
 |
3.3k
 |
 +-------- GPIB_SIGNAL
 |
6.2k
 |
GND
```

Repeat for all relevant IEEE-488 signal lines, subject to final transceiver/load review.
