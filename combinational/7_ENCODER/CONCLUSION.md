# Conclusion — 2-to-1 Encoder

The 2-to-1 encoder was successfully designed, synthesized, and implemented
on the xc7s50csga324-1 target device.

- **Functionality:** Verified that each valid one-hot input (`i1i0 = 01` or `10`) produces the correct output bit; invalid combinations (`00`, `11`) are treated as don't-care.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage.
- **Timing:** See `reports/timing.rpt` — check the WNS (Worst Negative Slack) to confirm the design meets timing.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Next Steps

- Extend to a 4-to-2 or 8-to-3 encoder for a larger input set.
- Implement a priority encoder variant that produces a defined output even when multiple inputs are active, instead of don't-care.
- Add a testbench and simulation waveform for functional verification.
