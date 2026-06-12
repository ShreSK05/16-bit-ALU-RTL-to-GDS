# ASIC Implementation of Arithmetic Logic Unit (ALU) using OpenLane

## Project Overview

This project presents the complete ASIC implementation of an 8-bit Arithmetic Logic Unit (ALU) designed in Verilog HDL and implemented using the Sky130 PDK 
The project covers the entire digital VLSI backend flow from RTL design to final GDSII generation.

---

## Features

- RTL Design in Verilog HDL
- Functional Verification using Testbench
- Logic Synthesis
- Floorplanning
- Standard Cell Placement
- Clock Tree Synthesis (CTS)
- Routing
- Static Timing Analysis (STA)
- Power Analysis
- DRC Verification
- LVS Verification
- Final GDSII Generation

---

## Design Specifications

| Parameter | Value |
|---|---|
| Design Name | ALU |
| Bit Width | 6-bit |
| Technology Node | Sky130nm |
| Tool Flow | OpenLane |
| Language | Verilog HDL |

---


## ASIC Design Flow

```text
RTL Design
   ↓
Functional Verification
   ↓
Synthesis
   ↓
Floorplanning
   ↓
Placement
   ↓
Clock Tree Synthesis
   ↓
Routing
   ↓
STA Analysis
   ↓
DRC/LVS Verification
   ↓
GDSII Generation
```

---

## Project Structure

```text
ALU-ASIC-OpenLane/
├── rtl/
│   └── alu.v
│
├── testbench/
│   └── alu_tb.v
│
├── reports/
│   ├── alu_openlane_metrics.csv
│   ├── final_signoff.rpt
│   ├── final_timing_summary.rpt
│   ├── final_power.rpt
│   ├── drc_report.rpt
│   ├── lvs_report.rpt
│   └── manufacturability.rpt
│
├── gds/
│   └── alu.gds
│
├── layouts/
│   ├── floorplan.png
│   ├── placement.png
│   ├── routing.png
│   └── final_gds.png
│
└── README.md
```

---

## Simulation

Compile and run:

```bash
iverilog rtl/alu.v testbench/alu_tb.v
vvp a.out
gtkwave dump.vcd
```

---

## OpenLane Execution

Run OpenLane:

```bash
./flow.tcl -design alu
```


## Reports Included

- Timing Report
- Area Report
- Power Report
- DRC Report
- LVS Report

All reports are available in the `reports/` directory.

---

## Tools Used

-OpenLane
-Yosys

---

## Key Learnings

- ASIC physical design flow
- Standard cell-based design methodology
- Timing closure techniques
- Routing congestion analysis
- Power optimization basics
- DRC/LVS verification process
- GDSII generation flow

---

## Future Improvements

- Pipelined ALU implementation
- Low-power ALU architecture
- Integration into RISC-V datapath
- Performance optimization

---
