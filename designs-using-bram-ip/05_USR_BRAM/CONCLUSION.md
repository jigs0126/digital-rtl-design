# Conclusion — Universal Shift Register via BRAM

This design was successfully implemented on the xc7s50csga324-1 target
device — the first design in `designs-using-bram-ip` to use BRAM as
**register storage** itself, rather than as a combinational lookup table
like [`01_AND_BRAM`](../01_AND_BRAM), [`02_ADDER_BRAM`](../02_ADDER_BRAM),
and [`04_RING_COUNTER_BRAM`](../04_RING_COUNTER_BRAM), or as next-state
logic like [`03_JK_FF_BRAM`](../03_JK_FF_BRAM).

- **Functionality:** `simulation/waveform.png` and the testbench's directed steps confirm hold, shift-right, shift-left, and parallel-load all behave as expected.
- **Resource Utilization:** See `reports/utilization.rpt` — compare directly against the gate-level [Universal Shift Register](../../sequential/08_USR) elsewhere in this repo for a concrete BRAM-vs-flip-flop resource comparison.
- **Timing:** See `reports/timing.rpt`. Using BRAM as a register adds real latency/routing considerations that a plain flip-flop-based register doesn't have.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT/BRAM count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.
>
> Also see the duplicate-IP and clock-divider notes in the README — both
> worth resolving, especially the duplicate IP customization, before
> treating this project as a clean reference example.

## Why This Is a Different Kind of BRAM Usage

This is a meaningfully different technique from the other BRAM designs in
this repo: instead of using BRAM to look up a precomputed answer, this
design continuously **writes** new values back into the same memory
location every clock cycle, using the BRAM word itself as the flip-flops
would normally be used. It's an unusual (if somewhat wasteful) way to
build a register, but demonstrates that BRAM read/write ports can
function as general storage, not just as ROM.

## Next Steps

- Directly compare resource/timing reports against the gate-level [`08_USR`](../../sequential/08_USR) to quantify the actual cost of this approach.
- Resolve the duplicate IP customization and clock divider issues noted in the README.
- Consider whether a multi-word BRAM (rather than a single address) could store several register "snapshots" for something like a small history buffer.
