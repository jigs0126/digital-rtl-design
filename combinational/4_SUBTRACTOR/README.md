# Full Subtractor

A combinational circuit that computes the difference of two 1-bit values,
along with a borrow-in and borrow-out, analogous to how a full adder handles
carry. Built by reusing a full adder for the difference/sum bit, with
separate logic for the borrow-out.

## Contents

1. [Source (`src/SUB.v`, `src/FA.v`)](src)
2. [Constraints (`constraints/SUB.xdc`)](constraints/SUB.xdc)
3. [Reports (`reports/`)](reports)
4. [Conclusion](CONCLUSION.md)

## Design

- `x` — minuend bit
- `y` — subtrahend bit
- `Bin` — borrow-in
- `s` — difference output
- `Bout` — borrow-out

## Truth Table

| x | y | Bin | s | Bout |
|---|---|-----|---|------|
| 0 | 0 | 0   | 0 | 0    |
| 0 | 0 | 1   | 1 | 1    |
| 0 | 1 | 0   | 1 | 1    |
| 0 | 1 | 1   | 0 | 1    |
| 1 | 0 | 0   | 1 | 0    |
| 1 | 0 | 1   | 0 | 0    |
| 1 | 1 | 0   | 0 | 0    |
| 1 | 1 | 1   | 1 | 1    |

## Logic Equations

- `s = x ^ y ^ Bin` — reuses the full adder's sum logic (`x^y^Bin`), since XOR-based difference and sum are the same operation.
- `Bout = (~x & y) | (Bin & ~(x ^ y))`

## Files

- `src/SUB.v` — Top-level full subtractor.
- `src/FA.v` — Full adder submodule, reused for the difference/sum computation.
- `constraints/SUB.xdc` — Pin/IO constraints used for implementation on the target FPGA.
- `reports/utilization.rpt` — Post-synthesis resource utilization report.
- `reports/timing.rpt` — Post-implementation timing summary.
- `reports/power.rpt` — Post-implementation power summary.

## Tools Used

- Xilinx Vivado 2025.1
- Target device: xc7s50csga324-1

## How to Reproduce

1. Open Vivado and create a new RTL project.
2. Add `src/SUB.v` and `src/FA.v` as design sources.
3. Add `constraints/SUB.xdc` as a constraints file.
4. Run Synthesis → Implementation → Generate Bitstream.
5. Export the utilization, timing, and power reports into the `reports/` folder.

See `CONCLUSION.md` for a summary of the results.
