`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 12:52:54
// Design Name: 
// Module Name: SR_FF
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

module SR_FF(input S,input R,input clk,input clr,input preset,
    output reg Q,output Qbar);
    /*reg [26:0] cnt;
    wire clk_out;

    always @(posedge clk) begin
        cnt <= 27'b00;
        cnt <= cnt + 1'b1;
    end
    assign clk_out = cnt[26]; */
    always @(posedge clk) begin
       if (clr)
           Q <= 1'b0;
       else if (preset)
           Q <= 1'b1;
       else if (S==1'b1 & R == 1'b1)
           Q <= 1'bx;
       else
           Q <= S|((~R)&Q);
    end
    assign Qbar = ~Q;
endmodule
