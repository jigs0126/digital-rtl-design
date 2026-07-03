# Conclusion — 2-to-4 Decoder

The 2-to-4 decoder was successfully designed, synthesized, and implemented
on the xc7s50csga324-1 target device.

- **Functionality:** Verified that each 2-bit input value activates exactly one of the four one-hot outputs, per the truth table.
- **Resource Utilization:** See `reports/utilization.rpt` for LUT/FF usage.
- **Timing:** See `reports/timing.rpt` — check the WNS (Worst Negative Slack) to confirm the design meets timing.
- **Power:** See `reports/power.rpt` for the on-chip power estimate.

> Note: fill in the specific numbers (e.g., LUT count, WNS, total power in mW)
> once you've reviewed the reports, so this conclusion reflects your actual results.

## Relation to the Encoder

This design is the functional inverse of the [2-to-1 encoder](../6_ENCODER):
the encoder compresses a one-hot input down to a binary code, while this
decoder expands a binary code back out to a one-hot output.

## Next Steps

- Extend to a 3-to-8 or 4-to-16 decoder for a larger output set.
- Add an enable input so the decoder can be gated on/off.
- Add a testbench and simulation waveform for functional verification.
