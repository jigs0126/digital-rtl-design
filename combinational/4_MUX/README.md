# 4-to-1 Multiplexer

A combinational circuit that selects one of four 1-bit inputs and routes it
to the output, based on a 2-bit select signal. Built hierarchically from
2-to-1 mux building blocks.

## Contents

1. [Source (`src/mux_4to1.v`, `src/mux_2to1.v`)](src)
2. [Constraints (`constraints/MUX.xdc`)](constraints/MUX.xdc)
3. [Reports (`reports/`)](reports)
4. [Conclusion](CONCLUSION.md)

## Design

- `in[3:0]` — four 1-bit data inputs
- `sel[1:0]` — 2-bit select
- `out` — selected output bit

## Truth Table

| sel[1:0] | out    |
|----------|--------|
| 00       | in[0]  |
| 01       | in[1]  |
| 10       | in[2]  |
| 11       | in[3]  |

## Structure

The 4-to-1 mux is built from three 2-to-1 mux instances (`mux_2to1.v`):

- Two 2-to-1 muxes select between `{in[2], in[3]}` and `{in[0], in[1]}` using `sel[0]`.
- A third 2-to-1 mux selects between those two results using `sel[1]`.

## Files

- `src/mux_4to1.v` — Top-level 4-to-1 multiplexer.
- `src/mux_2to1.v` — 2-to-1 multiplexer submodule used by the 4-to-1 mux.
- `constraints/MUX.xdc` — Pin/IO constraints used for implementation on the target FPGA.
- `reports/utilization.rpt` — Post-synthesis resource utilization report.
- `reports/timing.rpt` — Post-implementation timing summary.
- `reports/power.rpt` — Post-implementation power summary.

## Tools Used

- Xilinx Vivado 2025.1
- Target device: xc7s50csga324-1

## How to Reproduce

1. Open Vivado and create a new RTL project.
2. Add `src/mux_4to1.v` and `src/mux_2to1.v` as design sources.
3. Add `constraints/MUX.xdc` as a constraints file.
4. Run Synthesis → Implementation → Generate Bitstream.
5. Export the utilization, timing, and power reports into the `reports/` folder.

See `CONCLUSION.md` for a summary of the results.
