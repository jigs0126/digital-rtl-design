# Conclusion — 32-bit Radix-2 Booth's Multiplier

The Booth's multiplier control path / datapath system was designed and
thoroughly verified in simulation — the most functionally rigorous
testbench in this repo so far, with 7 directed cases covering negative
operands, zero, and both signed extreme values.

- **Functionality:** All 7 test cases passed, including the two hardest edge cases: `65535 * 65535 = 4294836225` (large positive × positive) and `-2147483648 * 1 = -2147483648` (minimum signed 32-bit value, which has no positive counterpart in two's complement). See `simulation/console_log.txt` and `simulation/waveform.png`.
- **Resource Utilization / Timing / Power:** Not available for this entry — no constraints file or synthesis/implementation run was provided, so this project currently covers RTL + simulation only, unlike most other entries in this repo.

## Why This Design Matters

Booth's algorithm is the standard technique for building compact signed
multipliers: rather than a large combinational array multiplier (fast but
resource-heavy), this design reuses a single adder/subtractor across 32
clock cycles, driven by an FSM — the same core idea behind the [equation
solver](../02_EQUATION_SOLVER)'s shared-multiplier approach, applied here
to build the multiplier itself rather than share an existing one.

## Next Steps

- Add constraints and run Synthesis/Implementation (e.g. targeting the Basys 3 board referenced in the source header) to get utilization, timing, and power reports, matching the rest of this repo.
- Compare resource usage against a direct combinational `*` multiplier for the same bit width, to quantify the area/latency tradeoff.
- Extend to Radix-4 Booth's encoding to roughly halve the number of cycles needed.
