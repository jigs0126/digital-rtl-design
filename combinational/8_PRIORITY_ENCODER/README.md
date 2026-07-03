# 4-to-2 Priority Encoder

A combinational circuit that encodes the position of the highest-priority
active input into a 2-bit binary code. Unlike a plain encoder, this design
resolves the case where multiple inputs are active simultaneously by always
favoring the highest-indexed input (`din[3]` has the highest priority).

## Contents

1. [Source (`src/Priority_Encoder.v`)](src/Priority_Encoder.v)
2. [Constraints (`constraints/PE.xdc`)](constraints/PE.xdc)
3. [Reports (`reports/`)](reports)
4. [Conclusion](CONCLUSION.md)

## Design

- `din[3:0]` — four inputs (any combination may be active)
- `y1, y0` — 2-bit binary code of the highest-priority active input

## Truth Table

| din[3] | din[2] | din[1] | din[0] | y1 | y0 |
|--------|--------|--------|--------|----|----|
| 1      | x      | x      | x      | 1  | 1  |
| 0      | 1      | x      | x      | 1  | 0  |
| 0      | 0      | 1      | x      | 0  | 1  |
| 0      | 0      | 0      | 1      | 0  | 0  |
| 0      | 0      | 0      | 0      | 0  | 0  |

(`x` = don't care — higher-priority bit already determines the output)

## Logic Equations

- `y1 = din[3] | din[2]`
- `y0 = din[3] | (din[1] & ~din[2])`

## Files

- `src/Priority_Encoder.v` — 4-to-2 priority encoder.
- `constraints/PE.xdc` — Pin/IO constraints used for implementation on the target FPGA.
- `reports/utilization.rpt` — Post-synthesis resource utilization report.
- `reports/timing.rpt` — Post-implementation timing summary.
- `reports/power.rpt` — Post-implementation power summary.

## Tools Used

- Xilinx Vivado 2025.1
- Target device: xc7s50csga324-1

## How to Reproduce

1. Open Vivado and create a new RTL project.
2. Add `src/Priority_Encoder.v` as a design source.
3. Add `constraints/PE.xdc` as a constraints file.
4. Run Synthesis → Implementation → Generate Bitstream.
5. Export the utilization, timing, and power reports into the `reports/` folder.

See `CONCLUSION.md` for a summary of the results.
