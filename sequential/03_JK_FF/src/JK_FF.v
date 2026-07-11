`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 11:51:18
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

module JK_FF(input J,input K,input clk,input clr,input preset,
    output reg Q,output Qbar);
    reg [26:0] cnt;
    wire clk_out;

    // Clock divider
    always @(posedge clk) begin
        cnt <= 27'b00;
        cnt <= cnt + 1'b1;
    end
    assign clk_out = cnt[26];
    always @(posedge clk_out) begin
       if (clr)
           Q <= 1'b0;
       else if (preset)
           Q <= 1'b1;
       else
           Q <= ((~K)&Q)|((~Q)&J);
    end
    assign Qbar = ~Q;
endmodule
