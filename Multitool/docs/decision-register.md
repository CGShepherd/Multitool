# Multitool Decision Register

| ID | Decision | Status | Rationale |
|---|---|---|---|
| DR-001 | Use a modernised gpib4pi-derived GPIB architecture. | CLOSED | Open, Pi-native, Linux-GPIB compatible and electrically appropriate. |
| DR-002 | Use dedicated IEEE-488 transceivers rather than direct GPIO bus connection. | CLOSED | Electrical robustness and standards compliance. |
| DR-003 | SN75160B + SN75161B are the current GPIB transceiver baseline. | CLOSED | Appropriate for single-controller IEEE-488 use. |
| DR-004 | Raspberry Pi 5 is the primary host platform. | CLOSED | Better current availability than suitable Pi 4 variants; sufficient headroom and current ecosystem support. |
| DR-005 | Raspberry Pi 4 compatibility should be retained where practical. | CLOSED | Useful fallback without constraining Pi 5. |
| DR-006 | Cooling may be passive or active. | CLOSED | Final choice will be evidence-based from thermal testing. |
| DR-007 | External IEEE-488 connector shall be chassis/panel supported. | CLOSED | Prevents mechanical cable loading on Pi/HAT. |
| DR-008 | Enclosure need only be rigid metal; die-cast is not required. | CLOSED | Folded metal or modified COTS enclosure may be simpler and cheaper. |
| DR-009 | COTS Pi enclosure modification is preferred over bespoke enclosure design where practical. | CLOSED | Reduces mechanical fabrication effort. |
| DR-010 | Include a HAT ID EEPROM. | CLOSED | Clean board identification and configuration. |
| DR-011 | Include a physical jumper to disable/isolate the HAT EEPROM. | CLOSED | Bring-up, service and recovery. |
| DR-012 | Same Pi shall support programming of its own HAT EEPROM. | CLOSED | Simplifies development/service tooling. |
| DR-013 | External memory programming shall use removable adapter boards. | CLOSED | Keeps main HAT general purpose. |
| DR-014 | Support 24Cxx serial EEPROMs in initial programmer scope. | CLOSED | Matches expected Tek feature-module use case. |
| DR-015 | Support DS1742 readout and DS1744P programming. | CLOSED | Required for Tektronix TDS3000-series NVRAM service. |
| DR-016 | Preserve original memory image before any programming/write operation. | CLOSED | Protects irreplaceable calibration/configuration data. |
| DR-017 | Hand assembly is the baseline manufacturing method. | CLOSED | Low-volume project; prioritise generous spacing and serviceability. |
| DR-018 | Prefer larger passives such as 0805 where practical. | CLOSED | Easier hand soldering, inspection and rework. |
| DR-019 | DIP or SOIC transceiver packages are both acceptable. | CLOSED | Assembly convenience matters more than density. |
| DR-020 | Do not start schematic capture until GPIO mapping and Pi↔transceiver electrical compatibility are formally reviewed. | CLOSED | Avoids inheriting unverified gpib4pi assumptions. |
