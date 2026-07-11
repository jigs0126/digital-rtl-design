`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2026 11:12:36
// Design Name: 
// Module Name: DP_sync
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

module DP_sync #(parameter DW = 3,AW = 3,DEPTH =8 )(
    input clk,we_a,we_b,cs_a,cs_b,
    input [AW-1:0]addr_a,
    input [AW-1:0]addr_b,
    input [DW-1:0]din_a,
    input [DW-1:0]din_b,
    output reg [DW-1:0]dout_a,
    output reg [DW-1:0]dout_b
    );
    reg [DW-1:0]mem[0:DEPTH-1];
    always @(posedge clk) begin
        dout_a <= {DW{1'b0}};
        if (cs_a) begin
            if (we_a)
              mem[addr_a] <= din_a;
            else
              dout_a <= mem[addr_a];
         end
     end 
     
     always @(negedge clk) begin
        dout_b <= {DW{1'b0}};
        if (cs_b) begin
            if (we_b)
              mem[addr_b] <= din_b;
            else
              dout_b <= mem[addr_b];
         end
     end   
endmodule