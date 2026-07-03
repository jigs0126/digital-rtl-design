`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 11:38:03
// Design Name: 
// Module Name: CLA
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

module CLA(input [3:0]a,b ,input c_in, output [3:0]s, output c_out
    );
    wire p0,p1,p2,p3,g0,g1,g2,g3,c0,c1,c2;
    
    assign p0 = a[0]^b[0], p1 = a[1]^b[1], p2 = a[2]^b[2], p3 = a[3]^b[3],
    g0 = a[0]&b[0],g1 = a[1]&b[1],g2 = a[2]&b[2],g3= a[3]&b[3];
    
    assign c0 = g0|(p0&c_in),
    c1 = g1|(g0&p1)|(c_in&p0&p1),
    c2 = g2|(p2&g1)|(p1&g0&p2)|(p0&p1&p2&c_in),
    c_out = g3|(p3&g2)|(p2&g1&p3)|(p1&g0&p1&p2&p3)|(c_in&p0&p1&p2&p3);
    
    assign s[0] = p0^c_in,
    s[1] = p1^c0,
    s[2] = p2^c1,
    s[3] = p3^c2;
endmodule
