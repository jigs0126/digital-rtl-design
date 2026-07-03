`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 11:23:25
// Design Name: 
// Module Name: RCA
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


module RCA(input [3:0]a , input [3:0]b,  input c_in, output c_out,
output [3:0]s
    );
    wire c0,c1,c2;
    fa a0(a[0],b[0],c_in,s[0],c0);
    fa a1(a[1],b[1],c0,s[1],c1);
    fa a2(a[2],b[2],c1,s[2],c2);
    fa a3(a[3],b[3],c2,s[3],c_out);
    
endmodule
