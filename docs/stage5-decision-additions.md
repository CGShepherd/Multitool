# Stage 5 Decision Register Additions

| ID | Decision | Status | Rationale |
|---|---|---|---|
| DR-059 | Rev A is the intended final one-off personal-use unit, not a disposable prototype. | CLOSED | Only one unit is expected to be built unless a material error is found. |
| DR-060 | Complete manual assembly/rework is a hard design requirement. | CLOSED | Matches project construction method. |
| DR-061 | Preferred package hierarchy is TH/DIP, SOIC, then finer pitch only where materially justified. | CLOSED | Maximises hand assembly success. |
| DR-062 | Re-evaluation of TXS0108E package does not justify changing translator architecture. | CLOSED | SOIC LVC8T245 simplifies data path but makes mixed-direction control path substantially more complex. |
| DR-063 | Retain two TXS0108EPW TSSOP-20 translators with enhanced hand-solder footprints. | CLOSED | Lowest total complexity despite finer pitch. |
| DR-064 | Use socketed PDIP SN75160BN/SN75161BN in final unit. | CLOSED | Serviceability and probing outweigh PCB area. |
| DR-065 | Schematic shall use an eight-sheet functional hierarchy. | CLOSED | Improves reviewability and traceability. |
| DR-066 | No PCB layout begins until signal-by-signal schematic review is complete. | CLOSED | One-build design requires high pre-order confidence. |
