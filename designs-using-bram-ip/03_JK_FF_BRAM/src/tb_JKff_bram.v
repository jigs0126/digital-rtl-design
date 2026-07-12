`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 16:30:05
// Design Name: 
// Module Name: tb_JKff_bram
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
module tb_JKff_bram;

reg clk;
reg rst;
reg J;
reg K;
wire Q;
wire Qbar;

JK_FF uut(
    .clk(clk),
    .rst(rst),
    .J(J),
    .K(K),
    .Q(Q),
    .Qbar(Qbar)
);

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin
    rst = 1;
    J = 0;
    K = 0;

    #12;
    rst = 0;

    J = 0; K = 0;
    #20;

    J = 0; K = 1;
    #20;

    J = 1; K = 0;
    #20;

    J = 1; K = 1;
    #40;

    $finish;
end
endmodule