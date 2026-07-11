`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 11:53:35
// Design Name: 
// Module Name: tb_JK
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


module tb_JK;
    reg clr, preset, J, K, clk;
    wire Q, Qbar;
    JK_FF uut (
        .clr(clr),
        .preset(preset),
        .J(J),
        .K(K),
        .clk(clk),
        .Q(Q),
        .Qbar(Qbar)
    );
    initial
        clk = 1'b0;
    always #10 clk = ~clk;
    initial begin
        clr    = 1'b0;
        preset = 1'b0;
        J      = 1'b0;
        K      = 1'b0;
        $monitor(
            "t=%0t clk=%b clr=%b preset=%b J=%b K=%b Q=%b Qbar=%b",
            $time, clk, clr, preset, J, K, Q, Qbar
        );
        #10;
        J = 1'b1;
        #10;
        clr = 1'b1;
        #20;
        clr = 1'b0;
        #10;
        J = 1'b1;
        K = 1'b0;
        #10;
        J = 1'b0;
        K = 1'b1;
        #10;
        preset = 1'b1;
        #20;
        preset = 1'b0;
        #10;
        K = 1'b0;
        #10;
        J = 1'b1;
        K = 1'b1;
        #50;
        $finish;
    end
endmodule