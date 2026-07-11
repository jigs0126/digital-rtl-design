`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: SIPO
// Description: Serial-In Parallel-Out shift register with an on-board clock
//              divider, so shifting is visible on LEDs at human timescales
//              when run on real hardware (default DIV_BITS=26 @ 100MHz clk
//              gives ~0.67s per shift). Override DIV_BITS to a small value
//              in a testbench for fast functional simulation - see
//              tb_SIPO_fast.v.
//////////////////////////////////////////////////////////////////////////////////

module SIPO #(
    parameter DIV_BITS = 26   // clock-divider width; small value = fast sim, 26 = real hardware
)(
    input  wire clk,
    input  wire reset,
    input  wire serial_in,
    output wire [3:0] llrl_out
);

    reg q0, q1, q2, q3;
    reg [DIV_BITS-1:0] cnt;
    wire clk_out = cnt[DIV_BITS-1];

    // Free-running clock divider, synchronously reset
    always @(posedge clk) begin
        if (reset)
            cnt <= {DIV_BITS{1'b0}};
        else
            cnt <= cnt + 1'b1;
    end

    // SIPO shift, clocked on the divided-down clock
    always @(posedge clk_out) begin
        if (reset) begin
            q0 <= 1'b0;
            q1 <= 1'b0;
            q2 <= 1'b0;
            q3 <= 1'b0;
        end else begin
            q0 <= serial_in;
            q1 <= q0;
            q2 <= q1;
            q3 <= q2;
        end
    end

    assign llrl_out = {q3, q2, q1, q0};

endmodule
