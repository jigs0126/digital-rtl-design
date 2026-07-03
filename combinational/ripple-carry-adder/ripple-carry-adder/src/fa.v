`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 11:26:10
// Design Name: 
// Module Name: fa
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


module fa(
    input a,
    input b,
    input c_in,
    output s,
    output c_out
    );
    assign s = a^b^c_in;
    assign c_out = (a&b) + (c_in &(a^b));
endmodule