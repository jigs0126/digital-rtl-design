# Conclusion — Carry Lookahead Adder (4-bit)

The 4-bit carry lookahead adder was successfully designed, synthesized, and
implemented on the xc7s50csga324-1 target device, using propagate/generate
logic to compute all carries in parallel.

- **Functionality:** Verified that carries are correctly derived from the propagate/generate signals, producing the correct 4-bit sum and final carry-out.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage. Expect somewhat higher LUT usage than the ripple carry adder, since more logic is needed to compute carries in parallel.
- **Timing:** See `reports/timing.rpt` — check the WNS (Worst Negative Slack). This design should show better (less negative / higher) slack than the ripple carry adder, since carry no longer has to propagate serially through every stage.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Comparison with Ripple Carry Adder

| | Ripple Carry Adder | Carry Lookahead Adder |
|---|---|---|
| Carry computation | Serial (stage to stage) | Parallel (from p/g signals) |
| Speed | Slower for wider adders | Faster |
| Logic/area | Smaller | Larger |

## Next Steps

- Directly compare WNS and LUT count against the ripple carry adder to quantify the speed/area tradeoff.
- Extend to 8-bit or a hierarchical (block) carry lookahead structure for wider adders.
- Add a testbench and simulation waveform for functional verification.
