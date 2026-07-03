# 2-to-1 Encoder

A combinational circuit that converts a one-hot 2-bit input into a single
output bit indicating which input line is active. Only one input is
expected to be high at a time; the invalid cases (both or neither active)
are treated as don't-care.

## Contents

1. [Source (`src/encoder.v`)](src/encoder.v)
2. [Constraints (`constraints/Encoder.xdc`)](constraints/Encoder.xdc)
3. [Reports (`reports/`)](reports)
4. [Conclusion](CONCLUSION.md)

## Design

- `i1`, `i0` — one-hot inputs (exactly one expected to be `1`)
- `out` — encoded output bit

## Truth Table

| i1 | i0 | out |
|----|----|-----|
| 0  | 0  | x (invalid — no input active) |
| 0  | 1  | 0 |
| 1  | 0  | 1 |
| 1  | 1  | x (invalid — both inputs active) |

## Files

- `src/encoder.v` — 2-to-1 encoder.
- `constraints/Encoder.xdc` — Pin/IO constraints used for implementation on the target FPGA.
- `reports/utilization.rpt` — Post-synthesis resource utilization report.
- `reports/timing.rpt` — Post-implementation timing summary.
- `reports/power.rpt` — Post-implementation power summary.

## Tools Used

- Xilinx Vivado 2025.1
- Target device: xc7s50csga324-1

## How to Reproduce

1. Open Vivado and create a new RTL project.
2. Add `src/encoder.v` as a design source.
3. Add `constraints/Encoder.xdc` as a constraints file.
4. Run Synthesis → Implementation → Generate Bitstream.
5. Export the utilization, timing, and power reports into the `reports/` folder.

See `CONCLUSION.md` for a summary of the results.
