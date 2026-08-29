# Sheet 05 — Control and Translator Enable

## Translator enable

GPIO17 -> R61 100 Ω -> GPIB_XLAT_EN.
R62 10 kΩ GPIB_XLAT_EN -> GND.
TP61 on GPIB_XLAT_EN.

## TE

Pi GPIO18 -> R63 100 Ω -> GPIB_TE.
R64 47 kΩ GPIB_TE -> GND.
TP62 GPIB_TE.

## DC

Pi GPIO8 -> R65 100 Ω -> GPIB_DC.
R66 47 kΩ GPIB_DC -> GND.
TP63 GPIB_DC.

## PE

Pi GPIO7 -> R67 100 Ω -> GPIB_PE.
R68 47 kΩ GPIB_PE -> GND.
TP64 GPIB_PE.

## Activity LED

Retain GPIO4 mapping.

GPIO4 -> suitable series resistor -> LED -> GND.
Use a low-current LED so GPIO loading is negligible.
Provide DNP option if enclosure does not need the indicator.
