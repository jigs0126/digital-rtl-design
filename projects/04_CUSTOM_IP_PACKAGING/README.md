# Custom IP Packaging: Priority Encoder, JK Flip-Flop, 4-to-1 MUX

Three existing modules from earlier in this repo, repackaged as
**reusable custom Vivado IP cores** using the IP Packager, then
instantiated inside a Vivado Block Design (`design_1.bd`) rather than
used as plain RTL. This project demonstrates the IP packaging workflow
itself, not new digital logic — the underlying circuits are the
[priority encoder](../../combinational/09_PRIORITY_ENCODER), [JK
flip-flop](../../sequential/03_JK_FF), and [4-to-1 MUX](../../combinational/05_MUX)
built earlier in this repo.

## Contents

1. [Priority Encoder IP](priority_encoder_ip)
2. [JK Flip-Flop IP](JK_ip)
3. [4-to-1 MUX IP](mux4to1_ip)
4. [Conclusion](CONCLUSION.md)

## What "Packaging as IP" Means

Rather than just adding a `.v` file to a project, each module here went
through Vivado's **Create and Package New IP** flow, which generates:

- **`component.xml`** — the IP-XACT metadata describing the IP's ports, parameters, and interfaces, making it recognizable to Vivado's IP Catalog.
- **A GUI customization script (`*_v1_0.tcl`)** — controls how the IP's customization dialog looks when someone drops it into a design.
- **A Block Design (`design_1.bd`)** — each IP was instantiated inside a Block Design canvas, Vivado's graphical way of wiring IP cores together (as opposed to hand-writing instantiations in RTL).

This is the same packaging mechanism Xilinx uses for its own IP (like the
Block Memory Generator used elsewhere in this repo's
[`designs-using-bram-ip`](../../designs-using-bram-ip)) — these three
modules are now usable the same way: dropped into any Block Design,
customized through a GUI, and reused across projects without copying RTL.

## Per-IP Notes

### Priority Encoder IP
Wraps the [4-to-2 priority encoder](../../combinational/09_PRIORITY_ENCODER).
No constraints or implementation run were included with this IP (packaging-only).

### JK Flip-Flop IP
Wraps the [JK flip-flop](../../sequential/03_JK_FF), including its
internal clock-divider pattern — see that module's README for the note on
the clock divider discrepancy, which still applies here since the RTL is
unchanged. No constraints or implementation run were included with this IP.

### 4-to-1 MUX IP
Wraps the [4-to-1 MUX](../../combinational/05_MUX). This is the only one
of the three with a full constraints file and synthesis/implementation
run — see `mux4to1_ip/reports/`.

## Tools Used

- Xilinx Vivado 2025.1, IP Packager, Block Design (IP Integrator)

## How to Reproduce

1. Open Vivado and create a new RTL project for each module (or add all three to one project).
2. Add the corresponding `.v` source to each.
3. Use **Tools → Create and Package New IP** to package each module, matching the settings in that IP's `component.xml`.
4. Create a Block Design and instantiate the packaged IP from the IP Catalog.
5. (4-to-1 MUX only) Add `mux4to1_ip/constraints/mux_ip.xdc` and run Synthesis → Implementation → Generate Bitstream to reproduce the reports.

See `CONCLUSION.md` for a summary.
