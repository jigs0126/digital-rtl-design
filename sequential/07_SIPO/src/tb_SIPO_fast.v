`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: tb_SIPO_fast
// Description: Fast functional-verification testbench for SIPO. Overrides
//              DIV_BITS to 3 (clk_out toggles every 8 clk edges instead of
//              2^26) so the shift-in behavior is actually observable within
//              a short simulation run. Use tb_SIPO.v (DIV_BITS=26, the
//              hardware default) only for synthesis/implementation, not
//              for behavioral simulation - it will show all-X output for
//              any realistic sim run length.
//////////////////////////////////////////////////////////////////////////////////

module tb_SIPO_fast;

    localparam DIV_BITS = 3; // clk_out toggles every 8 clk cycles - fast enough to observe

    reg clk;
    reg reset;
    reg serial_in;
    wire [3:0] llrl_out;

    SIPO #(.DIV_BITS(DIV_BITS)) uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .llrl_out(llrl_out)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        serial_in = 0;

        // Hold reset through a couple of clk_out edges
        #200;
        reset = 0;

        // Apply serial bits, one per clk_out period (80ns at DIV_BITS=3)
        #80 serial_in = 1'b1;
        #80 serial_in = 1'b0;
        #80 serial_in = 1'b1;
        #80 serial_in = 1'b1;
        #80; // let the 4th bit finish shifting in, then check immediately
        $display("Result after 4 bits (1,0,1,1 in): llrl_out = %b (expect 1011, MSB=first bit in)", llrl_out);

        #200;
        $finish;
    end

    initial begin
        $monitor("Time = %0t reset = %b serial_in = %b llrl_out = %b", $time, reset, serial_in, llrl_out);
    end

endmodule
