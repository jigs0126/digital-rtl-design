# Conclusion — SIPO Shift Register

**Status: synthesis + implementation complete; behavioral sim waveform pending.**

## Functional Summary

- [x] Functional correctness verified with `tb_SIPO_fast.v` (fast
      divider override) — `llrl_out` correctly reaches `1011` after
      shifting in bits `1,0,1,1`.
- [ ] Vivado behavioral simulation waveform attached in `simulation/waveform.png`
      (recommend capturing this with `tb_SIPO_fast.v`, not `tb_SIPO.v` —
      see README note on the clock divider making `tb_SIPO.v` impractical
      to observe directly in a short sim run)

## Resource Utilization

From `reports/utilization.rpt` (post-implementation, fully placed):

| Resource | Used | Available | Util% |
|----------|------|-----------|-------|
| Slice LUTs | 2 | 20800 | <0.01% |
| Slice Registers | 33 | 41600 | 0.08% |

Extremely lightweight design, as expected for a 4-stage shift register
plus a 26-bit divider counter.

## Timing

From `reports/timing.rpt`:

- WNS = `inf`, TNS = `0.000` — but **no user-specified timing
  constraints were found** (no `create_clock` in the XDC). This means
  Vivado isn't actually checking setup/hold against a real clock
  period target; the "infinite slack" result isn't meaningful evidence
  of timing closure. Worth adding `create_clock -period 10.000 -name
  sys_clk [get_ports clk]` (10ns = 100 MHz) to the XDC before treating
  timing as validated — a good habit for every future module, and a
  likely interview question ("how do you know your design meets
  timing?").

## Power

From `reports/power.rpt`:

| Metric | Value |
|--------|-------|
| Total On-Chip Power | 3.096 W |
| Dynamic Power | 3.029 W |
| Device Static Power | 0.067 W |
| Confidence Level | Low |

Confidence Level is "Low" because there's no simulation activity file
tied to the power estimate — Vivado is using default/vectorless
activity rates rather than data from an actual simulation run. Once a
`.saif` or similar activity file from the fast-sim testbench is
supplied to `report_power`, this number will be far more trustworthy.

## Notes / Interview Talking Points

- Good example of the difference between a *design-intent* clock
  divider (for human-visible LED output) and *simulation practicality*
  — the two want opposite divider widths, which is exactly why the
  parameter was added.
- The uninitialized-counter bug is a classic "works by accident in
  hardware (FPGAs often initialize registers to 0 at configuration),
  fails in simulation" trap — a good real interview story about the
  gap between simulation and synthesis semantics.
- Missing `create_clock` constraint is worth calling out proactively:
  an unconstrained design can "pass" implementation with no idea
  whether it actually meets its target frequency.
