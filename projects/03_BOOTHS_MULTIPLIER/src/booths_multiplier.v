`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Jigyasha
// 
// Create Date: 04.07.2026 22:16:05
// Design Name: 
// Module Name: booths_multiplier
// Project Name: rv-cordix
// Target Devices: basys 3
// Tool Versions: 
// Description: Top-level 32-bit Radix-2 Booth's Multiplier.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: It is a 32 bit radix 2 booth's multiplier
// 
//////////////////////////////////////////////////////////////////////////////////

module booths_multiplier(
    input wire clk,rst,start,
    input [31:0] multiplier,
    input [31:0] multiplicand,
    output [63:0] product,
    output done
    );
    
    wire load,add_en,sub_en,shift_en,count_dec;
    wire q0,q_1,last_cycle;
    
    
    booths_controller u_ctrl (
        .clk        (clk),
        .rst        (rst),
        .start      (start),
        .q0         (q0),
        .q_1        (q_1),
        .last_cycle (last_cycle),
        .load       (load),
        .add_en     (add_en),
        .sub_en     (sub_en),
        .shift_en   (shift_en),
        .count_dec  (count_dec),
        .done       (done)
    );

    booths_datapath u_dp (
        .clk          (clk),
        .rst          (rst),
        .load         (load),
        .add_en       (add_en),
        .sub_en       (sub_en),
        .shift_en     (shift_en),
        .count_dec    (count_dec),
        .multiplicand (multiplicand),
        .multiplier   (multiplier),
        .q0           (q0),
        .q_1          (q_1),
        .last_cycle   (last_cycle),
        .product      (product)
    );

endmodule
