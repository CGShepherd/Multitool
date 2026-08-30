# Stage 8 — Modular Saddle + Connector Bracket

Date: 2026-08-30
Status: Mechanical architecture refined for one-off home fabrication

## 1. Architecture

Split the upper mechanical assembly into two parts:

1. **Main saddle**
   - structural U-shaped frame;
   - attaches to the Pi-Box using the four existing upper enclosure fixing positions;
   - supports/protects the Multitool HAT;
   - carries no large connector aperture.

2. **Connector bracket**
   - separate removable rear plate/bracket;
   - bolts to the saddle;
   - carries IEEE-488 receptacle;
   - may later carry service/programmer connectors.

This is now preferred over an integral rear connector face.

## 2. Why two pieces are preferred

Benefits:
- simpler saddle flat pattern;
- simpler bending;
- IEEE-488 aperture can be machined in a small flat part;
- connector bracket can be remade independently;
- easier service access;
- easier experimentation with connector positions;
- no need to remake saddle if external interface changes.

## 3. Main saddle

Baseline material:
- 2.0 mm aluminium sheet;
- 1050/3003/5005 preferred for easy bending;
- 5052 acceptable if bend radius is increased.

Preferred shape:
- one simple inverted-U section;
- two 90-degree bends only;
- no hems, offsets, joggles or compound bends;
- side cheeks overlap Pi-Box sides;
- top bridge carries HAT standoffs.

The saddle should be manufacturable on a small benchtop box/pan brake or simple leaf brake.

## 4. Connector bracket

Preferred first implementation:
- flat 2.0 mm aluminium plate if sufficient stiffness is achieved;
- otherwise one simple 90-degree return flange along top or bottom edge.

The bracket bolts to the rear portion of the saddle with four M3 fasteners.

Preferred attachment:
- two M3 fixings per side;
- removable bracket;
- captive nuts / rivnuts / PEM nuts optional;
- ordinary M3 nuts + washers acceptable for one-off unit if accessible.

## 5. IEEE-488 connector mounting

The connector bracket shall carry the complete mechanical load from the IEEE-488 receptacle.

Requirements:
- rectangular connector aperture;
- manufacturer-defined mounting hole centres;
- adequate edge distance around aperture;
- star/serrated washer or deliberate bare-metal contact for shell/chassis bond;
- no structural dependence on the 26-way electrical loom.

## 6. Bracket grounding

Preferred:
- connector shell bonds to connector bracket;
- connector bracket bonds to saddle through at least one intentional metal-to-metal fixing;
- if anodised/painted, provide local coating removal or a short dedicated bonding strap.

Do not rely on incidental continuity through painted fasteners.

## 7. HAT mounting

HAT remains on four standard M2.5 standoffs on the saddle bridge.

Preferred provisional standoff height:
- 8–10 mm.

The connector bracket shall be removable without removing the HAT.

## 8. Home-fabrication bend policy

The mechanical design shall be compatible with a small affordable bench brake.

Design rules:
- maximum 2.0 mm aluminium;
- only 90-degree bends in Rev A;
- minimum inside bend radius approximately 1.5–2.0 mm for soft aluminium;
- larger radius acceptable;
- no bend line within ~2 material thicknesses of large holes/cut-outs;
- punch/drill/cut all flat features before bending where practical;
- verify bend allowance from actual material and brake tooling before final hole placement.

## 9. Fabrication sequence

Main saddle:
1. cut flat blank;
2. drill/cut Pi-Box fixing holes and HAT mounting holes;
3. deburr;
4. make two 90-degree bends;
5. trial-fit on Pi-Box;
6. only then finish/anodise/paint if desired.

Connector bracket:
1. cut small flat blank;
2. machine IEEE-488 aperture and mounting holes;
3. drill M3 saddle attachment holes;
4. deburr;
5. add optional return flange if used;
6. fit connector and verify load transfer;
7. bond electrically to saddle.

## 10. Tool implication

A small benchtop brake is sufficient if it can:
- bend 2.0 mm aluminium across approximately 110–120 mm width;
- make repeatable 90-degree bends;
- provide useful clamping close to the bend line.

A full-size press brake is not required for this design.

For maximum fabrication tolerance, the final saddle drawing should include:
- flat blank dimensions;
- bend lines;
- target inside radius;
- bend direction;
- finished outside dimensions;
- hole positions dimensioned from post-bend datums where needed.

## 11. Open mechanical verification

Before final drawings:
- Pi-Box exact width and screw centres;
- exact screw/fastener type;
- actual chosen IEEE-488 connector dimensions;
- saddle top height required for HAT and cover;
- exact ribbon exit position.
