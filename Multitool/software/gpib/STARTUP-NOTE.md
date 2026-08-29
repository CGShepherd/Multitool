# GPIB Enable Service — Important Bring-Up Note

The included shell script and systemd unit are a reference architecture, not a frozen production
implementation.

Before installation on the Pi 5:

1. confirm which `/dev/gpiochipN` exposes header GPIO17 under the chosen Raspberry Pi OS release;
2. confirm current `gpioset` syntax for the installed libgpiod version;
3. ensure the kernel GPIB driver has completed configuration before asserting enable;
4. verify with an oscilloscope that `GPIB_XLAT_EN` stays LOW throughout reset and early boot;
5. verify shutdown pulls the line LOW before power removal.

Do not connect vintage instruments during first power-up validation.
