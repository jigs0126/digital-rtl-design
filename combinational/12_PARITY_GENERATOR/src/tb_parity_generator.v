`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2026 17:04:13
// Design Name: 
// Module Name: tb_parity_generator
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

module tb_parity_generator;

    reg [2:0] in;
    wire p;

    // Instantiate the parity generator
    parity_generator uut (
        .in(in),
        .p(p)
    );

    initial begin

        $monitor("t = %t, in = %b, parity = %b",
                  $time, in, p);

        #10 in = 3'b000;
        #10 in = 3'b001;
        #10 in = 3'b010;
        #10 in = 3'b011;
        #10 in = 3'b100;
        #10 in = 3'b101;
        #10 in = 3'b110;
        #10 in = 3'b111;

        #10;
        $finish;

    end

endmodule