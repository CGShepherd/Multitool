# Stage 1 Decision Register Additions

These rows are intended to be merged into `docs/decision-register.md`.

| ID | Decision | Status | Rationale |
|---|---|---|---|
| DR-021 | Current upstream Linux `gpib_bitbang` support is acceptable as the Pi 5 software baseline. | CLOSED | Upstream source explicitly includes Pi 5 in its bcm27xx GPIO lookup path. |
| DR-022 | Retain the `gpib4pi-1.1` GPIO allocation for Rev A unless later electrical/layout analysis forces a change. | CLOSED | Avoids unnecessary driver divergence and is already represented upstream. |
| DR-023 | Do not connect SN75160B/SN75161B terminal outputs directly to Pi GPIO without a formally proven 3.3 V-safe interface. | CLOSED | TI does not specify a terminal-output maximum that proves direct Pi safety. |
| DR-024 | Retain SN75160B + SN75161B as the Rev A IEEE-488 transceiver pair. | CLOSED | Active parts, IEEE-488-specific and correct for single-controller architecture. |
| DR-025 | GPIO0/GPIO1 shall remain dedicated to HAT identification EEPROM use. | CLOSED | Raspberry Pi HAT design requirement. |
| DR-026 | EEPROM service control shall use explicit WP/programming provision and accessible test/program points. | CLOSED | Consistent with Raspberry Pi guidance and serviceability objective. |
