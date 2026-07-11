# Conclusion — D Flip-Flop

The D flip-flop was successfully designed and implemented on the
xc7s50csga324-1 target device — the simplest flip-flop in this repo,
with no undefined or ambiguous input combinations.

- **Functionality:** Verified in Vivado's Behavioral Simulation — the waveform in `simulation/waveform.png` confirms `Q` correctly tracks `d` on each rising clock edge, with `clr`/`preset` correctly overriding it.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage.
- **Timing:** See `reports/timing.rpt` — check the WNS (Worst Negative Slack) relative to the clock period.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Relation to SR and JK Flip-Flops

Both the [SR flip-flop](../02_SR_FF) and [JK flip-flop](../03_JK_FF) have
two control inputs with special-case behavior (`S=R=1` invalid for SR,
`J=K=1` toggle for JK). The D flip-flop sidesteps all of that with a single
data input — this simplicity is exactly why D flip-flops are the standard
choice for registers, counters, and most general-purpose sequential logic.

## Next Steps

- Chain multiple D flip-flops together to build a shift register.
- Use a D flip-flop with feedback (`D = ~Q`) to build a simple toggle/divide-by-2 circuit, similar to what a T flip-flop does.
- Build a register file or simple FSM using D flip-flops as the state-holding elements.
