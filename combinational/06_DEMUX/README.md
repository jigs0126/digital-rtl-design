# 1-to-4 Demultiplexer

A combinational circuit that routes a single input signal to one of four
outputs, based on a 2-bit select signal. Built hierarchically from 1-to-2
demux building blocks — the reverse of the 4-to-1 mux.

## Contents

1. [Source (`src/DMUX_1to4.v`, `src/DMUX_1to2.v`)](src)
2. [Constraints (`constraints/DMUX.xdc`)](constraints/DMUX.xdc)
3. [Reports (`reports/`)](reports)
4. [Conclusion](CONCLUSION.md)

## Design

- `Din` — single data input
- `sel[1:0]` — 2-bit select
- `y0, y1, y2, y3` — four outputs, only one of which carries `Din` at a time

## Truth Table

| sel[1:0] | y3   | y2   | y1   | y0   |
|----------|------|------|------|------|
| 00       | 0    | 0    | 0    | Din  |
| 01       | 0    | 0    | Din  | 0    |
| 10       | 0    | Din  | 0    | 0    |
| 11       | Din  | 0    | 0    | 0    |

## Structure

The 1-to-4 demux is built from three 1-to-2 demux instances (`DMUX_1to2.v`):

- The first stage splits `Din` into two branches using `sel[1]`.
- Two second-stage demuxes then split each of those branches further using `sel[0]`, producing the four final outputs.

## Files

- `src/DMUX_1to4.v` — Top-level 1-to-4 demultiplexer.
- `src/DMUX_1to2.v` — 1-to-2 demultiplexer submodule used by the 1-to-4 demux.
- `constraints/DMUX.xdc` — Pin/IO constraints used for implementation on the target FPGA.
- `reports/utilization.rpt` — Post-synthesis resource utilization report.
- `reports/timing.rpt` — Post-implementation timing summary.
- `reports/power.rpt` — Post-implementation power summary.

## Tools Used

- Xilinx Vivado 2025.1
- Target device: xc7s50csga324-1

## How to Reproduce

1. Open Vivado and create a new RTL project.
2. Add `src/DMUX_1to4.v` and `src/DMUX_1to2.v` as design sources.
3. Add `constraints/DMUX.xdc` as a constraints file.
4. Run Synthesis → Implementation → Generate Bitstream.
5. Export the utilization, timing, and power reports into the `reports/` folder.

See `CONCLUSION.md` for a summary of the results.
