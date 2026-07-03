`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 13:18:40
// Design Name: 
// Module Name: SUB
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


module SUB(
    input x,y,Bin,
    output Bout,s
    );
    FA u0( .a(x), .b(y), .c(Bin), .sum(s), .carry());
    assign Bout = ~x&y | Bin &(~x^y) ;
endmodule
