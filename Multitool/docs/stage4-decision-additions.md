# Stage 4 Decision Register Additions

| ID | Decision | Status | Rationale |
|---|---|---|---|
| DR-046 | Use CAT24C32 as the HAT+ identification EEPROM baseline. | CLOSED | Explicitly recommended by current Raspberry Pi HAT+ specification. |
| DR-047 | Use SOIC-8 CAT24C32 for Rev A. | CLOSED | Readily hand solderable. |
| DR-048 | EEPROM WP defaults HIGH through 1 kΩ; a 2.54 mm jumper shorts WP LOW for programming. | CLOSED | Protected normal operation with simple service access. |
| DR-049 | Use 3.9 kΩ pull-ups on ID_SD and ID_SC to 3.3 V. | CLOSED | Current HAT+ electrical requirement. |
| DR-050 | Power GPIB transceivers and TXS B-side from Pi 5 V rail; do not add a separate regulator. | CLOSED | Correct native supply already available. |
| DR-051 | Do not power-gate SN75160B/SN75161B in Rev A. | CLOSED | Internal glitch protection plus translator isolation makes gating unnecessary. |
| DR-052 | Provide removable +5V_GPIB isolation link for bring-up. | CLOSED | Serviceability and fault isolation. |
| DR-053 | Do not populate extra GPIB-line TVS protection by default in Rev A. | CLOSED | Avoid unproven capacitive loading; metal chassis and proper transceivers already provide robust baseline. |
| DR-054 | Reserve optional future ESD protection provision near connector/interconnect. | CLOSED | Allows later hardening without redesigning core architecture. |
| DR-055 | Use a 26-way 2x13 keyed 2.54 mm internal GPIB connector. | CLOSED | Hand-solderable and sufficient for 24 contacts plus spares. |
| DR-056 | Use PDIP-20 socketed SN75160BN/SN75161BN for the first hand-built prototype. | CLOSED | Maximises rework/probing convenience. |
| DR-057 | Use 0805 as default passive package. | CLOSED | Hand assembly and inspection. |
| DR-058 | Architecture is released to Rev A schematic capture. | CLOSED | Pre-schematic electrical gates now sufficiently resolved. |
