# Half Adder

A basic combinational circuit that adds two single-bit binary numbers.

## Truth Table

| a | b | s (sum) | c (carry) |
|---|---|---------|-----------|
| 0 | 0 |    0    |     0     |
| 0 | 1 |    1    |     0     |
| 1 | 0 |    1    |     0     |
| 1 | 1 |    0    |     1     |

## Logic Equations

- `s = a ^ b`
- `c = a & b`

## Files

- `src/HA.v` — Verilog source for the half adder.
- `constraints/HA.xdc` — Pin/IO constraints used for implementation on the target FPGA.
- `reports/utilization.rpt` — Post-synthesis resource utilization report.
- `reports/timing.rpt` — Post-implementation timing summary.
- `reports/power.rpt` — Post-implementation power summary.

## Tools Used

- Xilinx Vivado 2025.1
- Target device: xc7s50csga324-1

## Contents

1. [Source (`src/HA.v`)](src/HA.v)
2. [Constraints (`constraints/HA.xdc`)](constraints/HA.xdc)
3. [Reports (`reports/`)](reports)
4. [Conclusion](CONCLUSION.md)
