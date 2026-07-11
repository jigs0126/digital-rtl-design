# Conclusion — SISO Shift Register

**Status: functional simulation complete (Vivado behavioral sim).**

Functional correctness was verified both in Icarus Verilog (pre-handoff)
and in Vivado's behavioral simulator against `tb_SISO`. Resource,
timing, and power reports from synthesis/implementation are still
pending.

## Functional Summary

- [x] Vivado behavioral simulation matches expected shift/latency behavior
- [x] Waveform attached in `simulation/waveform.png`

**Waveform observations (`tb_SISO_behav.wcfg`, 0–100ns window):**
- `reset` is held high for the first two clock cycles, during which
  `serial_out` stays at 0 — confirms synchronous clear works correctly.
- After `reset` deasserts, `serial_in` is pulsed high for one clock
  cycle at two points in the trace.
- `serial_out` shows corresponding high pulses later in the trace, each
  delayed by a fixed number of clock cycles relative to its matching
  `serial_in` pulse — confirming the fixed-latency shift-through
  behavior with no glitches around the reset-release boundary.

## Resource Utilization

*(paste summary from `reports/utilization.rpt` once available)*

## Timing

*(paste WNS/TNS summary from `reports/timing.rpt` once available)*

## Power

*(paste summary from `reports/power.rpt` once available)*

## Notes / Interview Talking Points

- SISO is the simplest member of the shift-register family and the
  natural precursor to the SIPO/PISO/PIPO/Universal variants already
  in this repo — good to frame as "delay line" / serial-to-parallel
  bridge building block.
- Both `rst` and `en` are synchronous here, in contrast to the T
  flip-flop's asynchronous clear — worth being able to explain the
  tradeoff (glitch/metastability risk of async reset vs. reset
  recovery/removal timing closure of sync reset) if asked in an
  interview.
- The waveform's input-to-output latency directly demonstrates
  `DEPTH` clock cycles of pipeline delay — a good visual to point to
  when explaining fixed-latency serial datapaths.

