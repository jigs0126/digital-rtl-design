`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 08:08:26
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top #(parameter W = 3)(
    input clk,
    input rst,
    input start,

    input [W-1:0] z,
    input [W-1:0] y1,
    input [W-1:0] d,

    output [W+1:0] x,
    output [W-1:0] c,
    output [W+1:0] y2,
    output done
);

    wire sel;
    wire en_mult;
    wire en_div;
    wire en_add;
    wire en_sub;
    wire ldA;
    wire ldB;
   // wire CLK;
    
    //clk_divider u0(.clk_master(clk),.rst(rst), .clk_slave(CLK));

    cp CTRL(
        .clk(clk),
        .rst(rst),
        .start(start),

        .sel(sel),
        .en_mult(en_mult),
        .en_div(en_div),
        .en_add(en_add),
        .en_sub(en_sub),
        .ldA(ldA),
        .ldB(ldB),
        .done(done)
    );

    dp #(W) DP(
        .clk(clk),
        .rst(rst),

        .z(z),
        .y1(y1),
        .d(d),

        .sel(sel),

        .en_mult(en_mult),
        .en_div(en_div),
        .en_add(en_add),
        .en_sub(en_sub),

        .ldA(ldA),
        .ldB(ldB),

        .x(x),
        .c(c),
        .y2(y2)
    );

endmodule