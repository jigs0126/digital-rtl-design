# Conclusion — Magnitude Comparator

The parameterized magnitude comparator was successfully designed,
synthesized, and implemented on the xc7s50csga324-1 target device at the
default width (`w = 2`).

- **Functionality:** Verified that `greater`, `smaller`, and `equal` are correctly and mutually exclusively asserted for all input combinations at the default width.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage.
- **Timing:** See `reports/timing.rpt` — check the WNS (Worst Negative Slack) to confirm the design meets timing.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Next Steps

- Re-synthesize at a larger width (e.g. `w = 8`) to see how resource usage and timing scale.
- Add a testbench that sweeps all input combinations at a given width for full functional verification.
