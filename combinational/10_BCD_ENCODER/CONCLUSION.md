# Conclusion — Binary-to-BCD Encoder

The binary-to-BCD encoder was successfully designed and implemented on the
xc7s50csga324-1 target device, using the double dabble (shift-and-add-3)
algorithm.

- **Functionality:** `tb_bcd_encoder.v` checks 5 directed test cases (0, 5, 12, 45, 99) against a directly computed tens/ones split. Run it in Vivado's simulator to confirm all pass.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage.
- **Timing:** See `reports/timing.rpt` — check the WNS (Worst Negative Slack) to confirm the design meets timing.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Next Steps

- Run the testbench in Vivado's simulator and export a waveform screenshot to include in the repo.
- Extend the input range beyond 99 by adding a hundreds digit nibble.
- Add exhaustive (all 100 values) simulation coverage instead of the 5 directed test cases.
