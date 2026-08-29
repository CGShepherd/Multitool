# Multitool Stage 4 — Pre-Schematic Release

This is a larger consolidated update intended to take the project to the next natural gate.

Copy the archive contents into the repository root.

Included:
- complete pre-schematic engineering review;
- Rev A schematic-capture specification;
- preliminary BOM;
- EEPROM selection and jumper topology;
- power/decoupling architecture;
- transceiver power-gating decision;
- ESD policy;
- 26-way internal connector allocation;
- grounding strategy;
- startup/shutdown service reference files;
- schematic review checklist;
- Stage 4 decision-register additions.

**Result:** Rev A is released to schematic capture.

Important: the included GPIO enable service is deliberately marked as a reference implementation.
Its `gpiochip` mapping and libgpiod syntax must be confirmed on the actual Pi 5 OS image during bring-up.
