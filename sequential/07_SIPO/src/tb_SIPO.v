`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 12:17:19
// Design Name: 
// Module Name: tb_SIPO
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

module tb_SIPO;

    reg clk;
    reg reset;
    reg serial_in;
    wire [3:0] llrl_out;

    SIPO uut(
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .llrl_out(llrl_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;
        serial_in = 0;

        // Reset active
        #10;
        reset = 0;

        // Apply serial bits
        #10 serial_in = 1'b1;
        #10 serial_in = 1'b0;
        #10 serial_in = 1'b1;
        #10 serial_in = 1'b1;

        #50;
        $finish;
    end
    initial begin
        $monitor("Time = %0t reset = %b serial_in = %b llrl_out = %b", $time,reset,serial_in,llrl_out);
    end

endmodule