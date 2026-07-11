`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 12:15:47
// Design Name: 
// Module Name: tb_SR_latch
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

module tb_SR_latch;
    reg S, R;
    wire Q, Qbar;
    SR_latch uut (
        .S(S),
        .R(R),
        .Q(Q),
        .Qbar(Qbar)
    );
    initial begin
        $monitor(
            "t=%0t S=%b R=%b Q=%b Qbar=%b",
            $time, S, R, Q, Qbar
        );
        S = 1'b0;
        R = 1'b0;
        #10;
        R = 1'b1;
        #10;
        S = 1'b1;
        R = 1'b0;
        #10;
        S = 1'b0;
        R = 1'b0;
        #10;
        S = 1'b1;
        R = 1'b1;
        #50;
        $finish;
    end
endmodule

