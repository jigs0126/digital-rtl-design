`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 12:21:09
// Design Name: 
// Module Name: and_bram
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

module and_bram(
    input clk,
    input A,
    input B,
    output Y
);

wire [0:0] dout;

blk_mem_gen_0 U0 (
    .clka(clk),
    .ena(1'b1),
    .wea(1'b0),
    .addra({A,B}),
    .dina(1'b0),
    .douta(dout)
);

assign Y = dout[0];

endmodule