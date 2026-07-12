# Conclusion — Equation Solver (Shared-Multiplier Datapath)

The control path / datapath system was successfully designed and
implemented on the xc7s50csga324-1 target device.

- **Functionality:** Verified in Vivado's Behavioral Simulation against both directed test cases — see `simulation/waveform.png`. Both `(z=4,y1=5,d=2)` and `(z=6,y1=7,d=1)` produced the correct `x`, `c`, and `y2` values.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage — notably lower multiplier usage than three independent multipliers would need, since this design shares one multiplier across two states.
- **Timing:** See `reports/timing.rpt` — check the WNS (Worst Negative Slack).
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Why This Is a Useful Datapath Example

This design demonstrates a core HLS/RTL design pattern: instead of giving
each expression (`x`, `c`, `y2`) its own dedicated arithmetic hardware, the
FSM sequences a **shared** multiplier through two different roles
(computing `3*y1` in one state, `3*z` in the next), trading extra clock
cycles for less hardware — a classic area/latency tradeoff.

## Next Steps

- Parameterize the constants (currently hardcoded `3`, `4`, `6`) so the same datapath can solve a different equation set.
- Decide whether `clk_divider.v` should actually be wired in, or removed from the project since it's currently unused.
- Add more test cases to `tb_top.v`, including edge cases like `d=0` (which the datapath already handles by forcing `c=0`).
