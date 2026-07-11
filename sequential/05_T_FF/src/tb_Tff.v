`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 13:08:36
// Design Name: 
// Module Name: tb_Tff
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


module tb_Tff;
    reg clk,clr,preset,t;
    wire Q,Qbar;
    T_FF dut(.clk(clk), .clr(clr), .preset(preset),
    .t(t),.Q(Q),.Qbar(Qbar));
    initial
        clk = 1'b0;
    always #10 clk = ~clk;
    initial begin
        t = 1'b0;
        preset = 1'b0;
        clr = 1'b0;
        $monitor ("t = %t,clk = %b,clr = %b,preset = %b,t = %t,Q= %b,Qbar = %b",$time,clk,clr,
        preset,t,Q,Qbar);
        #10;
        t = 1'b1;
        #10;
        clr = 1'b1;
        #20;
        clr = 1'b0;
        #10;
        t = 1'b1;
        #10;
        preset = 1'b1;
        #20;
        preset = 1'b0;
        #10;
        t = 1'b0;
        #10;
        t = 1'b1;
        #50;
        $finish;
    end
        
endmodule
