# Rev A Symbol / Footprint Policy

## U1 SN75160BN
- custom-verified symbol strongly preferred.
- footprint: PDIP-20_W7.62mm or TI N-package equivalent.
- use turned-pin socket in physical build.
- verify actual package body/row spacing against distributor part before PCB release.

## U2 SN75161BN
- same package policy as U1.

## U3/U4 TXS0108EPW
- custom-verified symbol preferred.
- footprint based on TI PW TSSOP-20.
- 0.65 mm pitch.
- use elongated hand-solder toe pads.
- keep solder mask between pads if fabrication rules permit.
- provide at least ~3 mm component clearance around both sides for iron access.

## U5 CAT24C32
- SOIC-8 wide/narrow variant must match purchased MPN exactly.
- do not freeze footprint until exact suffix/orderable package is selected.

## Resistors/capacitors
- 0805 default.
- 1206 for links/bulk ceramics where helpful.

## U1/U2 sockets
Footprint is the IC package footprint; socket is an assembly BOM item.
Provide enough courtyard around both DIP sockets for removal with a small IC puller.

## J2
2x13 2.54 mm through-hole keyed/shrouded header.
Select exact part before PCB layout so shroud direction and cable exit are correct.
