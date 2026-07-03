# Ripple Carry Adder (4-bit)

A 4-bit combinational adder built by chaining four full adders together, with
the carry-out of each stage feeding the carry-in of the next.

## Contents

1. [Source (`src/RCA.v`, `src/fa.v`)](src)
2. [Constraints (`constraints/RCA.xdc`)](constraints/RCA.xdc)
3. [Reports (`reports/`)](reports)
4. [Conclusion](CONCLUSION.md)

## Design

- `a[3:0]`, `b[3:0]` — 4-bit operands
- `c_in` — carry-in
- `s[3:0]` — 4-bit sum output
- `c_out` — final carry-out

Each bit position is computed by a full adder (`fa.v`):
- `s = a ^ b ^ c_in`
- `c_out = (a & b) | (c_in & (a ^ b))`

The four full adders are chained in `RCA.v`, with each stage's carry-out
wired to the next stage's carry-in.

## Files

- `src/RCA.v` — Top-level 4-bit ripple carry adder.
- `src/fa.v` — Full adder submodule used by RCA.
- `constraints/RCA.xdc` — Pin/IO constraints used for implementation on the target FPGA.
- `reports/utilization.rpt` — Post-synthesis resource utilization report.
- `reports/timing.rpt` — Post-implementation timing summary.
- `reports/power.rpt` — Post-implementation power summary.

## Tools Used

- Xilinx Vivado 2025.1
- Target device: xc7s50csga324-1

## How to Reproduce

1. Open Vivado and create a new RTL project.
2. Add `src/RCA.v` and `src/fa.v` as design sources.
3. Add `constraints/RCA.xdc` as a constraints file.
4. Run Synthesis → Implementation → Generate Bitstream.
5. Export the utilization, timing, and power reports into the `reports/` folder.

See `CONCLUSION.md` for a summary of the results.
