`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 12:23:20
// Design Name: 
// Module Name: tb_and_bram
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

module tb_and_bram;

    reg clk;
    reg A;
    reg B;
    wire Y;

    // Instantiate the DUT
    and_bram uut (
        .clk(clk),
        .A(A),
        .B(B),
        .Y(Y)
    );

    // Clock generation (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Apply test vectors
    initial begin
        A = 0; B = 0;
        #20;

        A = 0; B = 1;
        #20;

        A = 1; B = 0;
        #20;

        A = 1; B = 1;
        #500;

        $finish;
    end

    // Display results
    initial begin
        $display("Time\tA\tB\tY");
        $monitor("%0t\t%b\t%b\t%b", $time, A, B, Y);
    end

endmodule