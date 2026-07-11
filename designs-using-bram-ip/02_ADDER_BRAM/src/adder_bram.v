`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 13:22:45
// Design Name: 
// Module Name: adder_bram
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
module adder_bram(
    input clk,
    input A,
    input B,
    input C,
    output sum,
    output carry
);

wire [1:0] dout;

blk_mem_gen_1 U0 (
    .clka(clk),
    .ena(1'b1),
    .wea(1'b0),
    .addra({A,B,C}),
    .dina(1'b0),
    .douta({sum,carry})
);

assign {sum,carry} = dout;

endmodule