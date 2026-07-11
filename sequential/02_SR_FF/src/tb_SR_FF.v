`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 12:54:04
// Design Name: 
// Module Name: tb_SR_FF
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
module tb_SR_FF;
    reg clr, preset, S, R, clk;
    wire Q, Qbar;
    SR_FF uut (
        .clr(clr),
        .preset(preset),
        .S(S),
        .R(R),
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
        S      = 1'b0;
        R      = 1'b0;
        $monitor(
            "t=%0t clk=%b clr=%b preset=%b S=%b R=%b Q=%b Qbar=%b",
            $time, clk, clr, preset, S, R, Q, Qbar
        );
        #10;
        R = 1'b1;
        #10;
        clr = 1'b1;
        #20;
        clr = 1'b0;
        #10;
        S = 1'b1;
        R = 1'b0;
        #10;
        preset = 1'b1;
        #10;
        preset = 1'b0;
        #10;
        R = 1'b1;
        #50;
        $finish;
    end
endmodule