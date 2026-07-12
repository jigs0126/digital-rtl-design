# Conclusion — Full Adder via BRAM

The BRAM-based full adder was implemented on the xc7s50csga324-1 target
device, extending the same lookup-table approach from
[`01_AND_BRAM`](../01_AND_BRAM) to a 2-output function.

- **Functionality:** Check `simulation/waveform.png` closely against the truth table in the README — the redundant/conflicting driver on `sum`/`carry` (see design note in the README) may or may not be causing simulation artifacts, and is worth resolving regardless of whether the waveform looks correct.
- **Resource Utilization:** See `reports/utilization.rpt` — expect a Block RAM primitive rather than LUTs, similar to `01_AND_BRAM`.
- **Timing:** See `reports/timing.rpt`. As with the AND BRAM design, the registered BRAM read adds a cycle of latency versus a purely combinational full adder.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT/BRAM count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Relation to the Gate-Level Full Adder

This repo already has a [full adder built the traditional way, from XOR/AND
gates](../../combinational/02_ripple-carry-adder) (as part of the ripple
carry adder). Comparing the two versions directly — resource usage,
timing, and design complexity — is a good way to see the real tradeoffs
between logic-based and memory-based implementations of the same function.

## Next Steps

- Fix the double-driver issue on `sum`/`carry` described in the README.
- Compare `reports/utilization.rpt` and `reports/timing.rpt` directly against the gate-level full adder used in the ripple carry adder design.
- Extend to a 4-bit ripple carry adder built entirely from BRAM-based full adder lookups, paralleling [`02_ripple-carry-adder`](../../combinational/02_ripple-carry-adder).
