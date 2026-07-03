# 3-bit Even Parity Generator

A combinational circuit that outputs a parity bit indicating whether the
number of 1s in a 3-bit input is even. Commonly used to detect single-bit
transmission errors when paired with a parity checker on the receiving end.

## Contents

1. [Source (`src/parity_generator.v`, `src/tb_parity_generator.v`)](src)
2. [Simulation (`simulation/waveform.png`)](simulation/waveform.png)
3. [Conclusion](CONCLUSION.md)

## Design

- `in[2:0]` — 3-bit input
- `p` — parity output: `1` if `in` has an even number of 1s (including zero), `0` if odd

## Logic Equation

- `p = ~(^in)` — XOR-reduce `in` to get odd parity, then invert for even parity.

## Truth Table

| in[2:0] | # of 1s | p |
|---------|---------|---|
| 000     | 0       | 1 |
| 001     | 1       | 0 |
| 010     | 1       | 0 |
| 011     | 2       | 1 |
| 100     | 1       | 0 |
| 101     | 2       | 1 |
| 110     | 2       | 1 |
| 111     | 3       | 0 |

## Testbench

`src/tb_parity_generator.v` sweeps all 8 possible input combinations
(`000` through `111`) and monitors `in` and `p` at each step.

## Simulation Waveform




## Files

- `src/parity_generator.v` — 3-bit even parity generator.
- `src/tb_parity_generator.v` — Testbench sweeping all 8 input combinations.
- `simulation/waveform.png` — Simulation waveform (see note above).

## How to Reproduce

1. Open Vivado (or any Verilog simulator) and add `src/parity_generator.v` as a design source and `src/tb_parity_generator.v` as a simulation source.
2. Run Behavioral Simulation to verify functionality against the testbench.
3. (Optional) Add constraints and run Synthesis/Implementation if targeting real hardware.

See `CONCLUSION.md` for a summary of the results.
