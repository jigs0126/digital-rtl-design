`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 13:06:41
// Design Name: 
// Module Name: T_FF
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

module T_FF(input t, input clk,input preset,input clr,
    output reg Q,output Qbar);
    always @(posedge clk or posedge clr) begin
        if (clr)
            Q <= 1'b0;
        else if (preset)
            Q <= 1'b1;
        else
            Q <= t^Q;
     end
     assign Qbar = ~Q;
endmodule