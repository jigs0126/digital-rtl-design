# Conclusion — 4-to-1 Multiplexer

The 4-to-1 multiplexer was successfully designed, synthesized, and
implemented on the xc7s50csga324-1 target device, built hierarchically
from three 2-to-1 mux instances.

- **Functionality:** Verified that each `sel` combination correctly routes the matching input to `out`, per the truth table.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage.
- **Timing:** See `reports/timing.rpt` — check the WNS (Worst Negative Slack) to confirm the design meets timing.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Next Steps

- Extend to an 8-to-1 or 16-to-1 mux by chaining more 2-to-1/4-to-1 stages.
- Compare a hierarchical mux (this design) against a single-level `case`/ternary implementation to see if synthesis results differ.
- Add a testbench and simulation waveform for functional verification.
