`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 12:58:10
// Design Name: 
// Module Name: mux_4to1
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


module mux4to1(input [3:0]in,input [1:0]sel, output out
    );
    wire [1:0]t;
    //assign out = in[sel];
    mux_2to1 a (in[2],in[3], sel[0],t[0]);
    mux_2to1 b (in[0],in[1], sel[0],t[1]);
    mux_2to1 c (t[0],t[1], sel[1],out);
    
endmodule