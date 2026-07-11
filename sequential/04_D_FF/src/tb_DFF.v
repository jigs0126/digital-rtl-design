`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 12:51:44
// Design Name: 
// Module Name: tb_DFF
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


module tb_DFF;
    reg clk,clr,preset,d;
    wire Q,Qbar;
    D_FF dut(.clk(clk), .clr(clr), .preset(preset),
    .d(d),.Q(Q),.Qbar(Qbar));
    initial
        clk = 1'b0;
    always #10 clk = ~clk;
    initial begin
        d = 1'b0;
        preset = 1'b0;
        clr = 1'b0;
        $monitor ("t = %t,clk = %b,clr = %b,preset = %b,d = %b,Q= %b,Qbar = %b",$time,clk,clr,
        preset,d,Q,Qbar);
        #10;
        d = 1'b1;
        #10;
        clr = 1'b1;
        #20;
        clr = 1'b0;
        #10;
        d = 1'b1;
        #10;
        preset = 1'b1;
        #20;
        preset = 1'b0;
        #10;
        d = 1'b0;
        #10;
        d = 1'b1;
        #50;
        $finish;
    end
        
endmodule
