# Conclusion — JK Flip-Flop

The JK flip-flop was successfully designed and implemented on the
xc7s50csga324-1 target device, resolving the SR flip-flop's `S=R=1`
undefined case by making that combination toggle the output instead.

- **Functionality:** Verified in Vivado's Behavioral Simulation — the waveform in `simulation/waveform.png` confirms clear, preset, set, reset, and toggle behavior.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage.
- **Timing:** See `reports/timing.rpt` — check the WNS (Worst Negative Slack) relative to the clock period.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.
>
> Also see the clock divider note in the README — worth resolving before
> treating this design's timing numbers as final, since the intended clock
> source (`clk` vs. the divided `clk_out`) isn't fully clear from the
> observed simulation behavior.

## Relation to the SR Flip-Flop

The [SR flip-flop](../02_SR_FF) leaves `S=R=1` undefined. This JK flip-flop
fixes that gap entirely — every combination of J/K now has a well-defined
next state, including the useful toggle behavior at `J=K=1`, which is
directly useful for building counters.

## Next Steps

- Resolve the clock divider question above.
- Build a T flip-flop by tying `J` and `K` together (this becomes trivial once you have a working JK flip-flop).
- Use the toggle behavior to build a simple ripple counter.
