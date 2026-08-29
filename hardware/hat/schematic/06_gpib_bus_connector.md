# Sheet 06 — IEEE-488 Bus, Termination and Internal Connector

J2: keyed 2x13 2.54 mm through-hole internal connector.

## Signal termination

For every BUS_* signal (16 total):

BUS_SIGNAL -> 3.3 kΩ -> +5V_GPIB
BUS_SIGNAL -> 6.2 kΩ -> GND

Use individual 0805 resistors for Rev A.

## J2 mapping

1 DIO1
2 DIO2
3 DIO3
4 DIO4
5 EOI
6 DAV
7 NRFD
8 NDAC
9 IFC
10 SRQ
11 ATN
12 GPIB connector contact 12 / shield-reference contact
13 DIO5
14 DIO6
15 DIO7
16 DIO8
17 REN
18 GND
19 GND
20 GND
21 GND
22 GND
23 GND
24 GND
25 CHASSIS / spare DNP
26 spare DNP

**Do not finalise contact 12 treatment until exact panel connector drawing is selected.**

The panel connector metal shell itself bonds directly to chassis mechanically/electrically.
