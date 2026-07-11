`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2026 11:49:33
// Design Name: 
// Module Name: DP_async
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


module DP_async #(parameter DW = 3,AW = 3,DEPTH =8 )(
    input we_a,we_b,cs_a,cs_b,
    input [AW-1:0]addr_a,
    input [AW-1:0]addr_b,
    input [DW-1:0]din_a,
    input [DW-1:0]din_b,
    output reg [DW-1:0]dout_a,
    output reg [DW-1:0]dout_b
    );
    reg [DW-1:0]mem[0:DEPTH-1];
    always @(*) begin
        if (cs_a && we_a)
              mem[addr_a] = din_a;
        if (cs_b && we_b)
              mem[addr_b] = din_b;
     end 
     
     always @(*) begin
        dout_a = {DW{1'b0}};
        if (cs_a && !we_a)
            dout_a = mem[addr_a];
     end 
     
     always @(*) begin
        dout_b = {DW{1'b0}};
        if (cs_b && !we_b)
            dout_b = mem[addr_b];
     end   
endmodule