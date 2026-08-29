#!/bin/sh
set -eu

GPIO=17
CHIP=/dev/gpiochip0

# This script is a reference implementation only.
# Final deployment should use the Pi 5-appropriate libgpiod chip/line naming
# confirmed on the target OS image.

case "${1:-}" in
  enable)
    # gpib_bitbang must already be loaded/configured before this command.
    gpioset --mode=exit "$CHIP" "$GPIO"=1
    ;;
  disable)
    gpioset --mode=exit "$CHIP" "$GPIO"=0
    ;;
  *)
    echo "usage: $0 {enable|disable}" >&2
    exit 2
    ;;
esac
