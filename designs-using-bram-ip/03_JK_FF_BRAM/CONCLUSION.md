# Conclusion — JK Flip-Flop with BRAM-Based Next-State Logic

This design was successfully implemented on the xc7s50csga324-1 target
device — the first sequential (not purely combinational) design in
`designs-using-bram-ip`, and unlike [`01_AND_BRAM`](../01_AND_BRAM) and
[`02_ADDER_BRAM`](../02_ADDER_BRAM), the BRAM here replaces next-state
*logic* rather than a static combinational function.

- **Functionality:** `simulation/waveform.png` confirms correct hold, reset, set, and toggle behavior in response to `J`/`K`, matching the JK flip-flop's expected truth table (see README).
- **Resource Utilization:** See `reports/utilization.rpt` — compare against the [gate-level JK flip-flop](../../sequential/03_JK_FF) to see the resource tradeoff of replacing combinational logic with a BRAM lookup.
- **Timing:** See `reports/timing.rpt` — since the state register is fed directly from the BRAM's registered output, there's an extra cycle of latency between a `J`/`K` change and it fully propagating into the next `Q`, unlike a purely combinational next-state function.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT/BRAM count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Why This Is a Meaningful Step Beyond `01`/`02`

`01_AND_BRAM` and `02_ADDER_BRAM` use BRAM to replace purely combinational
functions. This design goes further: the BRAM's address includes the
flip-flop's **own current state** (`Q`) alongside the inputs, making the
lookup table a genuine state-transition function — the same underlying
idea used in classic microcode / ROM-based FSM implementations, just
applied to the smallest possible state machine (a single flip-flop).

## Next Steps

- Apply the same BRAM-based next-state approach to a full FSM (like the [traffic light controller](../../projects/01_TRAFFIC_LIGHT_CONTROLLER)) to see the technique scale beyond one bit of state.
- Compare timing/resource reports directly against the [gate-level JK flip-flop](../../sequential/03_JK_FF) for a concrete BRAM-vs-logic tradeoff writeup.
- Try the same pattern for a D or T flip-flop, where the next-state table is even simpler.
