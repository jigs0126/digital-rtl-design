## =============================================================
## Constraints : SISO_SR.xdc
## Target      : xc7s50csga324-1 (update if targeting a different board)
## Note        : Pin locations below are placeholders - update LOC to
##               match your board's actual switch/LED/clock pins.
## =============================================================

## Clock signal
set_property PACKAGE_PIN R2 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk -waveform {0.000 5.000} [get_ports clk]

## Synchronous reset
set_property PACKAGE_PIN T1 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## Shift enable
set_property PACKAGE_PIN U1 [get_ports en]
set_property IOSTANDARD LVCMOS33 [get_ports en]

## Serial input
set_property PACKAGE_PIN W13 [get_ports serial_in]
set_property IOSTANDARD LVCMOS33 [get_ports serial_in]

## Serial output
set_property PACKAGE_PIN V3 [get_ports serial_out]
set_property IOSTANDARD LVCMOS33 [get_ports serial_out]
