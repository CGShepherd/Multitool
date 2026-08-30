# Stage 7 — Saddle Mechanical Interface Definition

Date: 2026-08-30
Status: Preferred mechanical interface frozen subject to fastener verification

## Architecture
Load path: IEEE-488 cable -> panel-mounted IEEE-488 receptacle -> 2 mm aluminium saddle ->
four existing upper Pi-Box end-fastener locations -> Pi-Box aluminium extrusion.
The HAT and ribbon cable carry no significant external connector load.

## Saddle to Pi-Box
Use the upper two existing enclosure fastener locations at the front and the upper two at the rear,
four points total. Do not drill new holes in the extrusion for Rev A unless CAD inspection proves unavoidable.

Published Pi-Box information is inconsistent in naming the supplied fasteners:
Lincoln Binns lists No.4 x 3/8 in Posi-pan Plastite self-tapping screws, while Farnell lists M3x10
Taptite screws among the kit contents. Therefore do not specify replacement thread yet.
Identify the actual four upper end-fasteners on the purchased enclosure or CAD, then use the same
fastener family/head style with approximately 2-3 mm additional length if needed for the 2 mm saddle,
while preserving at least the original effective engagement.

## HAT to saddle
Retain the standard HAT mounting-hole pattern. Use four removable M2.5 standoffs between HAT and saddle.
Nominal board clearance 8-10 mm, finalised after underside/component review.
HAT mounting points are mechanical only and are not the intentional chassis bond.

## IEEE-488 connector to saddle
Mount the standard 24-way IEEE-488 / HP-IB receptacle directly through the rear vertical face.
Use the selected connector manufacturer's cut-out and fixing-hole drawing.
Connector fixing screws/nuts are carried entirely by the saddle.
Connector shell bonds electrically to CHASSIS at the saddle.
The HAT connects electrically through the short detachable loom / 2x13 header.

## Saddle construction
Preferred: folded 2.0 mm aluminium U-section, with side cheeks overlapping the Pi-Box sides.
Rear connector face may be integral or a separately bolted 2.0 mm plate.
The saddle attaches using the four existing upper front/rear enclosure fixing positions.

## Ribbon
40-way ribbon exits through a protected slot or existing panel opportunity.
Target 100 mm nominal, 150 mm maximum. Provide strain relief so the Pi header carries no tensile load.

## Open verification items
- exact coordinates of four upper Pi-Box fixing centres;
- exact identity/thread/type of those four fasteners;
- available engagement depth;
- exact IEEE-488 connector part and cut-out;
- exact ribbon exit geometry.
