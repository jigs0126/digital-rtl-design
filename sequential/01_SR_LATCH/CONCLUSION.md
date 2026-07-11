# Conclusion — SR Latch

The NOR-based SR latch was successfully designed and implemented on the
xc7s50csga324-1 target device — the first sequential (state-holding) design
in this repo.

- **Functionality:** Verified in Vivado's Behavioral Simulation — the waveform in `simulation/waveform.png` confirms correct hold, reset, set, and invalid `S=R=1` behavior across the testbench sequence.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage.
- **Timing:** See `reports/timing.rpt` — note that latch-based designs can behave differently from clocked (flip-flop) designs in static timing analysis, since there's no clock edge to reference.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Why This Starts the `sequential/` Folder

Unlike every design so far in `combinational/`, this circuit's output
depends on its own previous state, not just the current inputs — that
feedback is what makes it sequential rather than combinational.

## Next Steps

- Add a gated/clocked SR latch (adds an enable input).
- Build a D latch from this SR latch by tying `D` and `~D` to `S` and `R`.
- Progress toward edge-triggered flip-flops (D, JK, T) as the next sequential building blocks.
