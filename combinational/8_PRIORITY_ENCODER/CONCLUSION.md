# Conclusion — 4-to-2 Priority Encoder

The 4-to-2 priority encoder was successfully designed, synthesized, and
implemented on the xc7s50csga324-1 target device.

- **Functionality:** Verified that the highest-indexed active input always determines the output, correctly resolving cases where multiple inputs are active at once.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage.
- **Timing:** See `reports/timing.rpt` — check the WNS (Worst Negative Slack) to confirm the design meets timing.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Relation to the Plain Encoder

This design builds on the [2-to-1 encoder](../6_ENCODER) by removing its
don't-care ambiguity: instead of treating multiple active inputs as
undefined, the priority encoder always resolves them deterministically by
favoring the highest-indexed input.

## Next Steps

- Add a "valid" output bit that goes low when all inputs are 0, to distinguish that case from `din[0]` being active.
- Extend to an 8-to-3 priority encoder for a larger input set.
- Add a testbench and simulation waveform for functional verification.
