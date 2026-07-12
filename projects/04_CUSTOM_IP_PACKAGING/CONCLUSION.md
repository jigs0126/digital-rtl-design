# Conclusion — Custom IP Packaging

Three previously built modules — the priority encoder, JK flip-flop, and
4-to-1 MUX — were successfully repackaged as reusable Vivado IP cores and
instantiated inside Block Designs.

- **Functionality:** Unchanged from the original modules (see their linked READMEs); this project doesn't add new logic, only new reusability.
- **Resource Utilization / Timing / Power:** Only available for the [4-to-1 MUX IP](mux4to1_ip) — see `mux4to1_ip/reports/`. The other two IPs weren't taken through synthesis/implementation as part of this packaging exercise.

## Why This Is Worth Having in the Repo

Everything else in this repo is either hand-instantiated RTL or Xilinx's
own IP (Block Memory Generator). This project is the first example of
**authoring your own reusable IP core** — the same mechanism that makes
large designs manageable, where common building blocks get packaged once
and dropped into many designs via a GUI, instead of being copy-pasted as
source files each time.

## Next Steps

- Add constraints and run synthesis/implementation for the Priority Encoder and JK Flip-Flop IPs, matching the MUX IP, so all three have complete reports.
- Build a small top-level Block Design that instantiates all three IPs together into one combined system, demonstrating IP reuse in practice rather than in isolation.
- Package a few more modules from this repo (e.g. the [ripple carry adder](../../combinational/02_ripple-carry-adder)) the same way, to build out a small personal IP library.
