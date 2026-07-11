# Conclusion — SP_async (Single-Port Asynchronous RAM)

**Status: synthesis, implementation, and behavioral simulation all complete.**

## Functional Summary

- [x] Standalone simulation of the exact RTL confirms read-after-write
      correctness:

  | Operation | addr | din | dout |
  |-----------|------|-----|------|
  | Write | 3 | AB | — |
  | Write | 7 | CD | — |
  | Read | 3 | — | AB |
  | Read | 7 | — | CD |

- [x] Vivado behavioral simulation waveform attached in
      `simulation/waveform.png`, showing the identical sequence.

## Resource Utilization

From `reports/utilization.rpt` (post-implementation, fully placed):

| Resource | Used | Available | Util% |
|----------|------|-----------|-------|
| Slice LUTs | 56 | 20800 | 0.27% |
| Register as Latch | 128 | 41600 | 0.31% |
| Register as Flip-Flop | 0 | 41600 | 0.00% |
| Block RAM Tile | 0 | 50 | 0.00% |

**The 128 latches (16 words × 8 bits) and zero Block RAM usage are
the headline result here** — see the README note for why: async
writes can't map to Vivado's clocked BRAM primitives, so every
storage bit becomes a latch instead. This is the expected, correct
outcome for this design as written, not a bug.

## Timing

From `reports/timing.rpt`:

- WNS = `inf`, TNS = `0.000` across 136 endpoints. Unlike the SIPO and
  USR modules, this is **not** a missing-constraint issue — the
  design has no clock at all, so there's nothing for `create_clock`
  to constrain. The "infinite slack" is simply the correct result for
  a fully combinational/latch-based circuit.

## Power

From `reports/power.rpt`:

| Metric | Value |
|--------|-------|
| Total On-Chip Power | 5.986 W |
| Dynamic Power | 5.908 W |
| Device Static Power | 0.078 W |
| Confidence Level | Low |

Notably higher dynamic power than the other small sequential modules
in this repo so far — consistent with 128 latches being inherently
more "active"/transparent than an equivalent number of flip-flops,
plus no simulation activity file was supplied to ground the estimate
(same "Low confidence" caveat as prior modules).

## Notes / Interview Talking Points

- This is the cleanest possible example of the "async write cannot
  become Block RAM" rule — a very common RTL interview question
  ("why did my memory turn into latches instead of BRAM?"). The
  utilization report is direct evidence: 128 latches, 0 BRAM tiles.
- Good contrast piece against the synchronous single-port and
  dual-port RAM designs studied earlier (from the CDC/async-FIFO
  work) — those use `posedge clk`-triggered writes specifically to
  qualify for BRAM inference.
- Latch-based storage has real risks beyond just resource usage:
  transparency during the non-write period means any glitch on
  `addr`, `cs`, or `we` while `we=0` can propagate straight through
  to `dout`, and there's no defined value until the first write —
  worth mentioning if asked about latch hazards specifically.
- If this were to become a synthesizable synchronous SRAM model (e.g.
  as a stepping stone toward the AXI4-Lite/SRAM controller in the
  portfolio plan), the write path would need `always @(posedge clk)`
  and ideally a registered read too, to get real BRAM inference and a
  meaningful timing report.
