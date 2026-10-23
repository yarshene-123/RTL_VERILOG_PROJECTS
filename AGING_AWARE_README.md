Aging-Aware Circuit Using Verilog HDL

Project Overview

This project demonstrates a behavioral model of timing degradation in a digital circuit using Verilog HDL.

Objective

To compare normal and aged operating modes using different simulated propagation delays and a timing-warning signal.

Working Principle

1. The circuit performs an AND operation on inputs "a" and "b".
2. The normal logic path has a modeled delay of 2 ns.
3. The aged logic path has a modeled delay of 8 ns.
4. A timing limit of 5 ns is used for the demonstration.
5. The "timing_warning" output is asserted in aged mode.

Inputs

- "a", "b": Logic inputs
- "aging_mode": Selects normal or aged path

Outputs

- "y": AND logic output
- "timing_warning": Indicates the selected aged mode

Technologies Used

- Verilog HDL
- Icarus Verilog
- EDA Playground
- GitHub

Project Files

- "Aging_Aware_Circuit.v" — RTL timing model
- "Aging_Aware_Circuit_tb.v" — Testbench
- "AGING_AWARE_README.md" — Project documentation

Verification

The testbench checks normal-path timing, the aged-mode warning, and the aged-path output.

Limitations

This is a simulation-only behavioral model. The delays are explicitly assigned using Verilog simulation delays and do not represent measured transistor aging or physical hardware timing.

Future Improvements

- Model timing-limit violations more explicitly.
- Explore timing-aware path selection.
- Compare reliability and timing behavior under different aging assumptions.
