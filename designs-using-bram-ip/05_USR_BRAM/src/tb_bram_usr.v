`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2026 15:49:35
// Design Name: 
// Module Name: tb_bram_usr
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
`timescale 1ns/1ps

module tb_bram_usr;

    reg        clk;
    reg  [1:0] mode;
    reg        sin;
    reg  [3:0] pin;
    wire [3:0] Q;

    // DUT
    USR_bram uut (
        .clk  (clk),
        .mode (mode),
        .sin  (sin),
        .pin  (pin),
        .Q    (Q)
    );

    // clock: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("time\tmode\tsin\tpin\tQ");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, mode, sin, pin, Q);

        // ---- Initial state ----
        mode = 2'b00; sin = 0; pin = 4'b0000;
        #2; // small offset so we sample after posedge settles, before next edge

        // ---- Test 1: Parallel load, Q should become pin ----
        mode = 2'b11; pin = 4'b1010;
        @(posedge clk); #1;
        // expect Q = 1010

        // ---- Test 2: Hold, Q should stay 1010 ----
        mode = 2'b00; sin = 1;
        @(posedge clk); #1;
        // expect Q = 1010 (unchanged, sin ignored)

        // ---- Test 3: Shift right, sin=1 -> Q = {1, Q[3:1]} = {1,101} = 1101 ----
        mode = 2'b01; sin = 1;
        @(posedge clk); #1;
        // expect Q = 1101

        // ---- Test 4: Shift right again, sin=0 -> Q = {0, Q[3:1]} = {0,110} = 0110 ----
        mode = 2'b01; sin = 0;
        @(posedge clk); #1;
        // expect Q = 0110

        // ---- Test 5: Shift left, sin=1 -> Q = {Q[2:0],1} = {110,1} = 1101 ----
        mode = 2'b10; sin = 1;
        @(posedge clk); #1;
        // expect Q = 1101

        // ---- Test 6: Shift left again, sin=0 -> Q = {Q[2:0],0} = {101,0} = 1010 ----
        mode = 2'b10; sin = 0;
        @(posedge clk); #1;
        // expect Q = 1010

        // ---- Test 7: Parallel load new value ----
        mode = 2'b11; pin = 4'b0101;
        @(posedge clk); #1;
        // expect Q = 0101

        // ---- Test 8: Hold ----
        mode = 2'b00;
        @(posedge clk); #1;
        // expect Q = 0101 (unchanged)

        #20;
        $display("Test complete.");
        $finish;
    end

endmodule