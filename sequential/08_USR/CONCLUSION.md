# Conclusion — Universal Shift Register (USR)

**Status: synthesis, implementation, and behavioral simulation all complete.**

## Functional Summary

- [x] Standalone simulation of the exact RTL/testbench pair matches
      the Vivado waveform bit-for-bit:

  | Time (ns) | mode | p_in | s_left | s_right | q |
  |-----------|------|------|--------|---------|---|
  | 20 | 11 (load) | 1011 | 0 | 0 | 1011 |
  | 30 | 01 (shift right) | 0000 | 0 | 1 | 1101 |
  | 40 | 01 (shift right) | 0000 | 0 | 0 | 0110 |
  | 50 | 10 (shift left) | 0000 | 1 | 0 | 1101 |
  | 60 | 10 (shift left) | 0000 | 0 | 0 | 1010 |
  | 70 | 00 (hold) | 0000 | 0 | 0 | 1010 |

- [x] Vivado behavioral simulation waveform attached in `simulation/waveform.png`,
      showing the same `x → b → d → 6 → d → a` progression.

All four modes (hold, shift-right, shift-left, parallel-load) behave
exactly as specified, with no glitches at mode transitions.

## Resource Utilization

From `reports/utilization.rpt` (post-implementation, fully placed):

| Resource | Used | Available | Util% |
|----------|------|-----------|-------|
| Slice LUTs | 6 | 20800 | 0.03% |

A 4:1 mux per bit (for the 4 modes) plus the register itself — small
but noticeably more logic than SISO/SIPO's single dedicated shift
direction, which makes sense given the extra mode-select muxing.

## Timing

From `reports/timing.rpt`:

- WNS = `inf`, TNS = `0.000` — again, **no user-specified timing
  constraints** (no `create_clock` in the XDC), same as the SIPO
  module. This is now a repeated pattern worth fixing at the source:
  consider adding a standard `create_clock -period 10.000 -name
  sys_clk [get_ports clk]` to every future XDC template so timing
  numbers are actually meaningful by default.

## Power

From `reports/power.rpt`:

| Metric | Value |
|--------|-------|
| Total On-Chip Power | 4.717 W |
| Dynamic Power | 4.645 W |
| Device Static Power | 0.072 W |
| Confidence Level | Low |

Confidence Level is "Low" for the same reason as SIPO — no
simulation activity file was supplied to `report_power`, so this is a
vectorless/default-activity estimate rather than one grounded in
actual simulated switching.

## Notes / Interview Talking Points

- This module is the "parent" of the whole shift-register family in
  this repo: SISO is `mode` hardwired to shift-only, SIPO adds a
  parallel-read tap, PISO/PIPO are the load-then-shift-out inverse.
  Good to explicitly draw that connection when discussing the repo's
  design progression.
- The 2-bit `mode` mux is a clean example of priority-free case-based
  control — every mode is mutually exclusive and fully specified
  (`case` with all 4 values covered), so there's no latch inference
  risk here, unlike an incompletely-specified `if/else` chain.
- No reset: worth being able to explain the tradeoff if asked — fine
  for a small demo register whose first real operation is a parallel
  load or shift, but a synchronous reset would be standard practice
  in a larger datapath (e.g. feeding into RV-CORDIX) so that
  power-up/verification behavior is deterministic rather than relying
  on FPGA configuration-time initial values.
