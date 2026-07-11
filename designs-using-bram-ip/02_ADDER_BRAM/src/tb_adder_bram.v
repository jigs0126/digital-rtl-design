`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 13:26:50
// Design Name: 
// Module Name: tb_adder_bram
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

module tb_adder_bram;

    reg clk;
    reg A;
    reg B;
    reg C;
    wire sum;
    wire carry;

    // Instantiate the DUT
    adder_bram uut (
        .clk(clk),
        .A(A),
        .B(B), .C(C),
        .sum(sum), .carry(carry)
    );

    // Clock generation (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Apply test vectors
    initial begin
        A = 0; B = 0; C= 0;
        #10;
        A = 0; B = 0; C= 1;
        #10;
        A = 0; B = 1; C= 0;
        #10;
        A = 0; B = 1; C= 1;
        #10;
        A = 1; B = 0; C= 0;
        #10;
        A = 1; B = 0; C= 1;
        #10;
        A = 1; B = 1; C= 0;
        #10;
        A = 1; B = 1; C= 1;
        #50;
        $finish;
    end

endmodule