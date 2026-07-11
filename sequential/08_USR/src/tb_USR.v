`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 11:56:23
// Design Name: 
// Module Name: tb_USR
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

module tb_USR;

    reg clk;
    reg [1:0] mode;
    reg s_left;
    reg s_right;
    reg [3:0] p_in;

    wire [3:0] q;

    // DUT Instantiation
    USR uut (
        .clk(clk),
        .mode(mode),
        .s_left(s_left),
        .s_right(s_right),
        .p_in(p_in),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        mode = 2'b00;
        s_left = 0;
        s_right = 0;
        p_in = 4'b0000;

        $display("---------------------------------------------------");
        $display("Time\tMode\tp_in\ts_left\ts_right\tq");
        $display("---------------------------------------------------");

        // --------------------------------
        // Parallel Load
        // mode = 11
        // --------------------------------

        #10;
        mode = 2'b11;
        p_in = 4'b1011;

        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b",
                 $time, mode, p_in, s_left, s_right, q);

        // --------------------------------
        // Shift Right
        // mode = 01
        // --------------------------------

        mode = 2'b01;
        p_in = 4'b0000;

        s_right = 1'b1;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b",
                 $time, mode, p_in, s_left, s_right, q);

        s_right = 1'b0;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b",
                 $time, mode, p_in, s_left, s_right, q);

        // --------------------------------
        // Shift Left
        // mode = 10
        // --------------------------------

        mode = 2'b10;

        s_left = 1'b1;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b",
                 $time, mode, p_in, s_left, s_right, q);

        s_left = 1'b0;
        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b",
                 $time, mode, p_in, s_left, s_right, q);

        // --------------------------------
        // Hold
        // mode = 00
        // --------------------------------

        mode = 2'b00;

        #10;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b",
                 $time, mode, p_in, s_left, s_right, q);

        #20;
        $finish;

    end

endmodule