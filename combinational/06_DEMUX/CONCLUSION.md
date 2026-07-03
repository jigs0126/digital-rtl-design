# Conclusion — 1-to-4 Demultiplexer

The 1-to-4 demultiplexer was successfully designed, synthesized, and
implemented on the xc7s50csga324-1 target device, built hierarchically
from three 1-to-2 demux instances.

- **Functionality:** Verified that each `sel` combination correctly routes `Din` to the matching output while the other three outputs stay at 0, per the truth table.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage.
- **Timing:** See `reports/timing.rpt` — check the WNS (Worst Negative Slack) to confirm the design meets timing.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Relation to the 4-to-1 MUX

This design is the functional inverse of the [4-to-1 MUX](../4_MUX): the mux
combines four inputs into one output based on `sel`, while this demux spreads
one input across four outputs based on `sel`.

## Next Steps

- Extend to a 1-to-8 or 1-to-16 demux by chaining more 1-to-2/1-to-4 stages.
- Add a testbench and simulation waveform for functional verification.
