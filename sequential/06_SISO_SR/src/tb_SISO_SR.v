// =============================================================
// Testbench   : tb_SISO_SR
// Purpose     : Verify SISO shift register - reset, shift-through
//               latency (DEPTH cycles), and enable gating.
// =============================================================

`timescale 1ns/1ps

module tb_SISO_SR;

    parameter DEPTH = 8;

    reg clk;
    reg rst;
    reg en;
    reg serial_in;
    wire serial_out;

    // Instantiate DUT
    SISO_SR #(.DEPTH(DEPTH)) dut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Bit stream to send in, and a shadow queue to predict output
    reg [15:0] tx_pattern = 16'b1011_0010_1101_0001; // arbitrary test pattern
    integer i;

    initial begin
        $dumpfile("tb_SISO_SR.vcd");
        $dumpvars(0, tb_SISO_SR);

        // --- Reset check ---
        rst = 1; en = 0; serial_in = 0;
        @(posedge clk); @(posedge clk);
        if (serial_out !== 1'b0)
            $display("FAIL: output not 0 after reset");
        else
            $display("PASS: reset clears shift register");

        rst = 0;
        en  = 1;

        // --- Shift in DEPTH bits before expecting valid output ---
        for (i = 0; i < DEPTH; i = i + 1) begin
            serial_in = tx_pattern[15 - i];
            @(posedge clk);
            #1; // settle before next input change - avoids edge race
        end

        // --- Now continue shifting and check output equals the bit
        //     that entered DEPTH cycles ago ---
        for (i = DEPTH; i < 16; i = i + 1) begin
            serial_in = tx_pattern[15 - i];
            @(posedge clk);
            #1; // allow output to settle after clock edge
            if (serial_out !== tx_pattern[15 - (i - DEPTH + 1)])
                $display("FAIL: cycle %0d expected %b got %b",
                          i, tx_pattern[15 - (i - DEPTH + 1)], serial_out);
            else
                $display("PASS: cycle %0d serial_out = %b (correct)",
                          i, serial_out);
        end

        // --- Enable gating check: freeze shifting ---
        en = 0;
        serial_in = 1'b1; // should be ignored
        @(posedge clk); #1;
        $display("INFO: with en=0, serial_out held at %b (should not change)",
                  serial_out);

        $display("Testbench complete.");
        $finish;
    end

endmodule
