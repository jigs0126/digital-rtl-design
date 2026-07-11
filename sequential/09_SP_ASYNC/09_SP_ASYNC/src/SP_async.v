`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 13:17:29
// Design Name: 
// Module Name: SP_async
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

module SP_async #(
    parameter DW = 8,
    parameter AW = 4,
    parameter DEPTH = 16 )(
    input cs,we,
    input [AW-1:0]addr,
    input [DW-1 : 0]din,
    output reg [DW-1 :0]dout
    );
    
    reg [DW-1:0] mem[0:DEPTH-1];
    always @(*) begin
        if (cs && we)
            mem[addr] <= din;
    end

    always @(*) begin
        if (cs && !we)
            dout <= mem[addr];
        else
            dout <= {DW{1'b0}};
    end
endmodule