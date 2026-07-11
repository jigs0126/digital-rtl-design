`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 12:29:24
// Design Name: 
// Module Name: D_FF
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

module D_FF(input d, input clk,input preset,input clr,
    output reg Q,output Qbar);
    always @(posedge clk) begin
        if (clr)
            Q <= 1'b0;
        else if (preset)
            Q <= 1'b1;
        else
            Q <= d;
     end
     assign Qbar = ~Q;
endmodule
