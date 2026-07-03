# Magnitude Comparator (Parameterized Width)

A combinational circuit that compares two binary numbers and reports whether
the first is greater than, less than, or equal to the second. The width is
parameterized (`w`, default 2 bits), so the same module works for any bit
width without rewriting the logic.

## Contents

1. [Source (`src/Comp.v`)](src/Comp.v)
2. [Constraints (`constraints/COMP.xdc`)](constraints/COMP.xdc)
3. [Reports (`reports/`)](reports)
4. [Conclusion](CONCLUSION.md)

## Design

- `a[w-1:0]`, `b[w-1:0]` — operands to compare (`w` = 2 by default)
- `greater` — high if `a > b`
- `smaller` — high if `a < b`
- `equal` — high if `a == b`

## How It Works

The comparison scans from the most significant bit down to the least
significant bit. At the first bit position where `a` and `b` differ, that
bit alone determines the result (`greater`/`smaller`), and the scan stops
early via a `disable` on the loop. If no differing bit is found, the values
are equal.

## Files

- `src/Comp.v` — Parameterized magnitude comparator.
- `constraints/COMP.xdc` — Pin/IO constraints used for implementation on the target FPGA.
- `reports/utilization.rpt` — Post-synthesis resource utilization report.
- `reports/timing.rpt` — Post-implementation timing summary.
- `reports/power.rpt` — Post-implementation power summary.

## Tools Used

- Xilinx Vivado 2025.1
- Target device: xc7s50csga324-1

## How to Reproduce

1. Open Vivado and create a new RTL project.
2. Add `src/Comp.v` as a design source.
3. Add `constraints/COMP.xdc` as a constraints file.
4. Run Synthesis → Implementation → Generate Bitstream.
5. Export the utilization, timing, and power reports into the `reports/` folder.

See `CONCLUSION.md` for a summary of the results.
