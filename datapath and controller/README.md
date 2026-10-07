# Datapath and Controller

## Overview

Implemented a datapath and controller based digital system using
Verilog HDL. The design separates the computational datapath from
the control logic, following a structured RTL design approach.

## Design Components

The project includes the following RTL modules:

- Datapath
- Controller
- Arithmetic unit
- Counter
- Equality/zero detection logic
- PIPO registers
- Supporting combinational and sequential logic

## RTL Modules

| Module | Description |
|--------|-------------|
| `datapath.v` | Implements the main data-processing path |
| `controller.v` | Generates control signals for the datapath |
| `add.v` | Addition logic |
| `cntr.v` | Counter implementation |
| `eqz.v` | Equality/zero detection logic |
| `pipo1.v` | Parallel-in parallel-out register |
| `pipo2.v` | Parallel-in parallel-out register |
| `mul_test.v` | Testbench for functional verification |

## Verification

The design was simulated using a Verilog testbench. Simulation
waveforms were generated in VCD format and analyzed to verify the
behavior of the RTL design.

## Tools and Technologies

- Verilog HDL
- RTL Design
- Digital Logic Design
- Simulation and Verification

## Concepts Demonstrated

- Datapath and Control Architecture
- RTL Design
- Sequential Logic
- Combinational Logic
- Registers
- Counters
- Control Signal Generation
- Functional Verification
