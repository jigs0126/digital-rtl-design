# Carry Lookahead Adder (4-bit)

A 4-bit adder that computes all carries in parallel using propagate/generate
logic, instead of waiting for carry to ripple through each stage. This makes
it significantly faster than a ripple carry adder at the cost of more logic.

## Contents

1. [Source (`src/CLA.v`)](src/CLA.v)
2. [Constraints (`constraints/CLA.xdc`)](constraints/CLA.xdc)
3. [Reports (`reports/`)](reports)
4. [Conclusion](CONCLUSION.md)

## Design

- `a[3:0]`, `b[3:0]` — 4-bit operands
- `c_in` — carry-in
- `s[3:0]` — 4-bit sum output
- `c_out` — final carry-out

For each bit `i`, two signals are computed directly from the inputs:
- **Propagate:** `p_i = a_i ^ b_i`
- **Generate:** `g_i = a_i & b_i`

Each carry `c_i` is then built directly from `p` and `g` signals (and `c_in`)
rather than from the previous carry, so all carries can be computed in
parallel:
- `c0 = g0 | (p0 & c_in)`
- `c1 = g1 | (g0 & p1) | (c_in & p0 & p1)`
- `c2 = g2 | (p2 & g1) | (p1 & g0 & p2) | (p0 & p1 & p2 & c_in)`
- `c_out = g3 | (p3 & g2) | (p2 & g1 & p3) | (p1 & g0 & p1 & p2 & p3) | (c_in & p0 & p1 & p2 & p3)`

Each sum bit is then `s_i = p_i ^ c_(i-1)`.

## Files

- `src/CLA.v` — Top-level 4-bit carry lookahead adder.
- `constraints/CLA.xdc` — Pin/IO constraints used for implementation on the target FPGA.
- `reports/utilization.rpt` — Post-synthesis resource utilization report.
- `reports/timing.rpt` — Post-implementation timing summary.
- `reports/power.rpt` — Post-implementation power summary.

## Tools Used

- Xilinx Vivado 2025.1
- Target device: xc7s50csga324-1

## How to Reproduce

1. Open Vivado and create a new RTL project.
2. Add `src/CLA.v` as a design source.
3. Add `constraints/CLA.xdc` as a constraints file.
4. Run Synthesis → Implementation → Generate Bitstream.
5. Export the utilization, timing, and power reports into the `reports/` folder.

See `CONCLUSION.md` for a summary of the results.
