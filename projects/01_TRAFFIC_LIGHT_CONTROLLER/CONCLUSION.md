# Conclusion — Traffic Light Controller

The traffic light controller FSM was successfully designed and implemented
on the xc7s50csga324-1 target device — the first project-level design in
this repo, building on the flip-flops and combinational blocks from
earlier modules into a complete, self-contained state machine.

- **Functionality:** The captured waveform in `simulation/waveform.png` shows the FSM correctly cycling through all 4 states with H1/H2 lights changing in the expected pattern (only one direction green/yellow at a time).
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage.
- **Timing:** See `reports/timing.rpt` — check the WNS (Worst Negative Slack).
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.
>
> Also see the design notes in the README — the missing `rst` port and the
> clock divider discrepancy are both worth resolving before treating this
> design as final, even though the simulation output looks correct.

## Next Steps

- Add a proper `rst` input to the module (and wire it into the FSM's state register) so the testbench's reset connection is actually meaningful.
- Resolve the clock divider question — either confirm `clk_out` is intentionally driving the FSM timer, or simplify to a direct `clk`-driven counter like the [SR flip-flop](../../sequential/02_SR_FF) and [D flip-flop](../../sequential/04_D_FF) use.
- Extend to a 4-way intersection, or add a pedestrian-crossing state.
