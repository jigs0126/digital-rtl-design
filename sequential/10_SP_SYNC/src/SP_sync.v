`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 12:36:42
// Design Name: 
// Module Name: SP_sync
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

module SP_sync #(
    parameter DW = 8,
    parameter AW = 4,
    parameter DEPTH = 16 )(
    input cs,clk,we,
    input [AW-1:0]addr,
    input [DW-1 : 0]din,
    output reg [DW-1 :0]dout
    );
    
    reg [DW-1:0] mem[0:DEPTH-1];
    always @(posedge clk) begin
        if (cs && we)
            mem[addr] <= din;
    end

    always @(posedge clk) begin
        if (cs && !we)
            dout <= mem[addr];
        else
            dout <= {DW{1'b0}};
    end
endmodule