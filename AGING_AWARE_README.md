Aging-Aware Circuit Using Verilog HDL

Project Overview

This project demonstrates a simplified aging-aware digital circuit using Verilog HDL. It models an aging condition through a timing-warning signal.

Objective

To demonstrate how an increased modeled delay can trigger a timing warning in a digital circuit.

Working Principle

1. The circuit performs an AND operation on inputs "a" and "b".
2. In normal mode, the modeled delay value is 2 ns.
3. In aging mode, the modeled delay value is 8 ns.
4. A timing warning is activated when the modeled delay exceeds 5 ns.
5. The output logic remains functionally correct in both modes.

Inputs

- "a", "b": Logic inputs
- "aging_mode": Selects normal or modeled aged operation

Outputs

- "y": AND logic output
- "timing_warning": Indicates that the modeled delay exceeds the threshold

Technologies Used

- Verilog HDL
- Icarus Verilog / EDA Playground
- GitHub

Project Files

- "Aging_Aware_Circuit.v" — RTL design
- "Aging_Aware_Circuit_tb.v" — Testbench
- "AGING_AWARE_README.md" — Project documentation

Limitations

This is an educational behavioral model. It does not model physical transistor aging, measure actual propagation delay, or implement a physically faster backup path.

Future Improvements

- Add explicit timing-delay simulation.
- Compare normal and aged timing behavior.
- Explore timing-aware path selection and reliability analysis.
