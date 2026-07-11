# Conclusion — T Flip-Flop

The T flip-flop was successfully designed and implemented on the
xc7s50csga324-1 target device — the last of the four classic flip-flop
types (SR, JK, D, T) covered in this repo.

- **Functionality:** Verified in Vivado's Behavioral Simulation — the waveform in `simulation/waveform.png` confirms toggle, hold, asynchronous clear, and synchronous preset behavior all match the design.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage.
- **Timing:** See `reports/timing.rpt` — asynchronous `clr` can affect timing analysis differently than a purely synchronous design; worth reviewing the report with that in mind.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Relation to the JK Flip-Flop

A T flip-flop is exactly a [JK flip-flop](../03_JK_FF) with `J` and `K`
tied together as a single `t` input: `t=0` behaves like `J=K=0` (hold),
and `t=1` behaves like `J=K=1` (toggle) — the two "in-between" JK
combinations (set-only, reset-only) simply aren't reachable with a single
toggle input.

## Next Steps

- Chain T flip-flops together (each driven by the previous stage's toggle) to build a ripple counter — this is the classic use case for T flip-flops.
- Standardize `clr` and `preset` to both be synchronous (or both asynchronous) across all flip-flop modules in this repo, for consistency.
