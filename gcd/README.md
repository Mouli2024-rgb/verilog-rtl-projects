# GCD Processor – Verilog

## Overview

Implemented a hardware-based Greatest Common Divisor (GCD) computation
using Verilog HDL and RTL design techniques.

The design uses a datapath and controller architecture to perform the
GCD computation through iterative arithmetic operations.

## Design Components

- Datapath
- Controller
- Multiplexer
- Subtraction logic
- PIPO register
- Comparator
- Testbench

## RTL Modules

| Module | Description |
|--------|-------------|
| `datapath.v` | Implements the main data-processing logic |
| `controller.v` | Generates control signals for the datapath |
| `comp.v` | Comparison logic |
| `sub.v` | Subtraction logic |
| `mux.v` | Multiplexer |
| `pipo1.v` | Parallel-in parallel-out register |
| `gcd_tb.v` | Testbench for functional verification |

## Verification

The GCD processor was verified using a Verilog testbench.
Simulation waveforms were generated in VCD format and analyzed
to verify the design behavior.

## Tools and Technologies

- Verilog HDL
- RTL Design
- Digital Logic Design
- Simulation and Verification

## Concepts Demonstrated

- Datapath and Controller Architecture
- RTL Design
- Sequential Logic
- Combinational Logic
- Arithmetic Operations
- Registers
- Control Signal Generation
- Functional Verification
