# 2-to-4 Decoder

A combinational circuit that converts a 2-bit binary input into a one-hot
4-bit output, activating exactly one output line based on the input value.
The functional inverse of the 2-to-1 encoder.

## Contents

1. [Source (`src/Decoder.v`)](src/Decoder.v)
2. [Constraints (`constraints/Decoder.xdc`)](constraints/Decoder.xdc)
3. [Reports (`reports/`)](reports)
4. [Conclusion](CONCLUSION.md)

## Design

- `din[1:0]` — 2-bit binary input
- `op[3:0]` — 4-bit one-hot output

## Truth Table

| din[1:0] | op[3:0] |
|----------|---------|
| 00       | 0001    |
| 01       | 0010    |
| 10       | 0100    |
| 11       | 1000    |

## Implementation Note

The design uses a shift operation (`op = 1 << din`) to directly generate the
one-hot output, rather than an explicit case statement — functionally
equivalent, but more compact.

## Files

- `src/Decoder.v` — 2-to-4 decoder.
- `constraints/Decoder.xdc` — Pin/IO constraints used for implementation on the target FPGA.
- `reports/utilization.rpt` — Post-synthesis resource utilization report.
- `reports/timing.rpt` — Post-implementation timing summary.
- `reports/power.rpt` — Post-implementation power summary.

## Tools Used

- Xilinx Vivado 2025.1
- Target device: xc7s50csga324-1

## How to Reproduce

1. Open Vivado and create a new RTL project.
2. Add `src/Decoder.v` as a design source.
3. Add `constraints/Decoder.xdc` as a constraints file.
4. Run Synthesis → Implementation → Generate Bitstream.
5. Export the utilization, timing, and power reports into the `reports/` folder.

See `CONCLUSION.md` for a summary of the results.
