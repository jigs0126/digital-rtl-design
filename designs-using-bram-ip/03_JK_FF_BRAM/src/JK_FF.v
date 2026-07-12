`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 15:55:58
// Design Name: 
// Module Name: JK_FF
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

module JK_FF(
    input clk,
    input rst,
    input J,
    input K,
    output reg Q,
    output reg Qbar
);

wire [1:0] dout;

blk_mem_gen_0 u0 (
    .clka(clk),
    .ena(1'b1),
    .wea(1'b0),
    .addra({J,K,Q}),
    .dina(2'b00),
    .douta(dout)
);

always @(posedge clk)
begin
    if(rst)
    begin
        Q    <= 1'b0;
        Qbar <= 1'b1;
    end
    else
        {Q,Qbar} <= dout;
end

endmodule