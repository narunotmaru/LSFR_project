# C-40-submission1 - LFSR Project

**Group**: 40  
**Filename**: C-40-submission1.dig  
**Module**: 8-Stage Linear Feedback Shift Register (LFSR)  
**Language**: Verilog  
**Simulator**: Digital / EDA Playground  

## Project Overview
This project implements an 8-stage LFSR with the feedback polynomial:

f(x) = x^8 + x^7 + x^6 + x^3 + x^2 + x + 1

Each shift cycle, the LFSR computes a feedback bit from specified taps (S_7, S_6, 
S_3, S_2, S_1, S_0) and shifts left, placing the feedback bit in S_0. The least
significant bit (S_0) outputs the LFSR sequence.

## Simulation Instructions
1. **Load Files**: Import `LFSR.v` and `LFSR_Testbench.v` files into your simulator.
2. **Run Experiment 1**:
   - Load initial state `00000001` in the LFSR.
   - Run for 15 cycles to observe the output sequence on `sequence` (S_0).
3. **Run Experiment 2**:
   - Load initial state `01001001` and run for 8 cycles.
   - Idle for 5 cycles (disable `enable`).
   - Reload with initial state `00000001`, run for 5 more cycles.

Expected sequences can be verified in the console or waveform output.

