# Conclusion — Full Subtractor

The full subtractor was successfully designed, synthesized, and implemented
on the xc7s50csga324-1 target device, reusing a full adder module for the
difference bit and adding separate borrow logic.

- **Functionality:** Verified against the expected truth table, including correct borrow propagation.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage.
- **Timing:** See `reports/timing.rpt` — check the WNS (Worst Negative Slack) to confirm the design meets timing.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Relation to the Full Adder

The sum/difference logic (`x ^ y ^ Bin`) is identical between a full adder
and a full subtractor — only the carry/borrow logic differs. This design
takes advantage of that by reusing the `FA` module rather than duplicating
the XOR logic.

## Next Steps

- Chain multiple full subtractors together to build a ripple borrow subtractor, mirroring the ripple carry adder.
- Add a testbench and simulation waveform for functional verification.
