`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2026 12:03:40
// Design Name: 
// Module Name: tb_TLC
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
module tb_TLC;
    reg clk;
    reg rst;
    wire H1_red, H1_yellow, H1_green, H2_red, H2_yellow, H2_green;

    Traffic_light_controller uut(
        .clk(clk), .rst(rst),
        .H1_red(H1_red), .H1_yellow(H1_yellow), .H1_green(H1_green),
        .H2_red(H2_red), .H2_yellow(H2_yellow), .H2_green(H2_green)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        rst = 1'b1;   // assert reset first
        #20;          // hold through at least one clk posedge
        rst = 1'b0;   // release reset; design runs from here
        
    end

    initial begin
        $monitor("t=%0t rst=%b clk=%b | cnt=%b clk_out=%b | count=%0d state=%b | H1(r,y,g)=%b%b%b H2(r,y,g)=%b%b%b",
                  $time, rst, clk, uut.cnt, uut.clk_out, uut.count, uut.state,
                  H1_red, H1_yellow, H1_green, H2_red, H2_yellow, H2_green);
    end
endmodule