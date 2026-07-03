# Conclusion — 3-bit Even Parity Generator

The 3-bit even parity generator was designed and verified in simulation.

- **Functionality:** All 8 input combinations were checked; the output correctly reflects even parity (`p = 1` when the number of 1s in `in` is even). See `simulation/waveform.png` and the truth table in the README.
- **Resource Utilization / Timing / Power:** Not available — no Vivado project (constraints or synthesis/implementation reports) was provided for this module, only the source and testbench.

## Next Steps

- Add constraints and run synthesis/implementation in Vivado to get utilization, timing, and power reports, matching the other modules in this repo.
- Extend to a parity checker module that takes `in` plus a received parity bit and flags a transmission error if they don't match.
- Generalize to a parameterized width (like the [magnitude comparator](../11_COMPARATOR)) instead of a fixed 3-bit input.
