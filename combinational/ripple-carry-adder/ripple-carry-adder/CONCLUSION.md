# Conclusion — Ripple Carry Adder (4-bit)

The 4-bit ripple carry adder was successfully designed, synthesized, and
implemented on the xc7s50csga324-1 target device, using four full-adder
instances chained together.

- **Functionality:** Verified that each stage correctly propagates carry to the next, producing the correct 4-bit sum and final carry-out.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage.
- **Timing:** See `reports/timing.rpt` — check the WNS (Worst Negative Slack). Note that ripple carry adders are inherently slower than carry-lookahead designs since the carry must propagate serially through all stages.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Next Steps

- Compare this design's timing against a carry-lookahead adder (CLA) of the same width to see the propagation delay difference.
- Extend to 8-bit or parameterizable width.
- Add a testbench and simulation waveform for functional verification.
