# Conclusion — SR Flip-Flop

The edge-triggered SR flip-flop was successfully designed and implemented
on the xc7s50csga324-1 target device, building on the [SR latch](../01_SR_LATCH)
by adding clock-edge synchronization plus clear/preset overrides.

- **Functionality:** Verified in Vivado's Behavioral Simulation — the waveform in `simulation/waveform.png` confirms clear, preset, set, and reset all correctly take effect only on the rising clock edge, with `clr` and `preset` taking priority over `S`/`R`.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage.
- **Timing:** See `reports/timing.rpt` — check the WNS (Worst Negative Slack) relative to the clock period.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Relation to the SR Latch

The [SR latch](../01_SR_LATCH) responds to `S`/`R` immediately and
continuously; this flip-flop only samples and updates on a clock edge,
making its timing behavior predictable and synchronizable with the rest of
a clocked digital system — a key reason flip-flops, not latches, are the
standard building block for most sequential logic.

## Next Steps

- Build a D flip-flop, which resolves the `S=R=1` invalid case by construction (only one data input).
- Progress to JK and T flip-flops as further sequential building blocks.
- Chain flip-flops together to build a shift register or simple counter.
