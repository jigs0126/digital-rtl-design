# Conclusion — AND Gate via BRAM

The BRAM-based AND gate was successfully implemented on the
xc7s50csga324-1 target device — the first design in this repo to use a
Vivado-generated IP core (Block Memory Generator) rather than only
hand-written RTL.

- **Functionality:** `simulation/waveform.png` confirms `Y` correctly reads back `0` for all input combinations except `A=1,B=1`, matching the AND truth table stored in the RAM.
- **Resource Utilization:** See `reports/utilization.rpt` — expect this to use a Block RAM primitive rather than LUTs, unlike the [combinational AND-style logic](../../combinational) built earlier in this repo from gates directly.
- **Timing:** See `reports/timing.rpt`. Since the BRAM read is registered, there's an inherent one-cycle latency between address input and data output — different from a purely combinational gate.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT/BRAM count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Why This Is Worth Knowing

Using BRAM as a lookup table generalizes well beyond a single AND gate —
any combinational function of a *small* number of inputs can be
implemented this way by simply changing the `.coe` initialization
contents, without touching the RTL. This is the same principle behind
LUT-based FPGA logic itself, just made explicit and visible using an
actual memory primitive.

## Next Steps

- Swap the `.coe` contents to implement a different 2-input function (OR, XOR, NAND) without changing `and_bram.v` at all — only the initialization data changes.
- Compare `reports/utilization.rpt` against a hand-coded `assign Y = A & B;` version to see the actual resource tradeoff (BRAM vs. LUT) for something this small.
- Extend to a 3-input function, following the pattern used in [`02_ADDER_BRAM`](../02_ADDER_BRAM).
