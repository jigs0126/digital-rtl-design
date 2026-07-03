# Binary-to-BCD Encoder (Double Dabble)

A combinational circuit that converts a 7-bit binary number (0–99) into its
two-digit Binary-Coded Decimal (BCD) representation, using the shift-and-add-3
("double dabble") algorithm.

## Contents

1. [Source (`src/bcd_encoder.v`, `src/tb_bcd_encoder.v`)](src)
2. [Constraints (`constraints/bcd_encoder.xdc`)](constraints/bcd_encoder.xdc)
3. [Reports (`reports/`)](reports)
4. [Conclusion](CONCLUSION.md)

## Design

- `binary_in[6:0]` — 7-bit binary input (valid range 0–99)
- `out[7:0]` — packed BCD output: `out[7:4]` = tens digit, `out[3:0]` = ones digit

## How It Works (Double Dabble)

The algorithm shifts `binary_in` into a register left, one bit at a time,
7 times total. Before each shift, any BCD digit nibble that has reached 5 or
more is incremented by 3 — this correction keeps each nibble a valid decimal
digit (0–9) instead of rolling over as pure binary would. After 7 shifts, the
two BCD digit nibbles hold the correct tens and ones values.

## Testbench

`src/tb_bcd_encoder.v` checks the design against 5 known inputs
(0, 5, 12, 45, 99), comparing the output against a directly computed
`tens`/`ones` split for each. Run it in Vivado's Behavioral Simulation to
verify functionality.

## Files

- `src/bcd_encoder.v` — BCD encoder (double dabble).
- `src/tb_bcd_encoder.v` — Testbench with 5 directed test cases.
- `constraints/bcd_encoder.xdc` — Pin/IO constraints used for implementation on the target FPGA.
- `reports/utilization.rpt` — Post-synthesis resource utilization report.
- `reports/timing.rpt` — Post-implementation timing summary.
- `reports/power.rpt` — Post-implementation power summary.

## Tools Used

- Xilinx Vivado 2025.1
- Target device: xc7s50csga324-1

## How to Reproduce

1. Open Vivado and create a new RTL project.
2. Add `src/bcd_encoder.v` as a design source and `src/tb_bcd_encoder.v` as a simulation source.
3. Add `constraints/bcd_encoder.xdc` as a constraints file.
4. Run Behavioral Simulation to verify functionality against the testbench.
5. Run Synthesis → Implementation → Generate Bitstream.
6. Export the utilization, timing, and power reports into the `reports/` folder.

See `CONCLUSION.md` for a summary of the results.
