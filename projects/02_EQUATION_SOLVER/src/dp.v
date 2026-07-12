`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 08:07:41
// Design Name: 
// Module Name: dp
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
module dp #(parameter W = 3)(
    input clk,
    input rst,

    input  [W-1:0] z,
    input  [W-1:0] y1,
    input  [W-1:0] d,

    input sel,

    input en_mult,
    input en_div,
    input en_add,
    input en_sub,

    input ldA,
    input ldB,

    output reg [W+1:0] x,
    output reg [W-1:0] c,
    output reg [W+1:0] y2
);

    wire [W-1:0] mux_out;

    reg [W+1:0] mult_out;
    reg [W-1:0] div_out;
    reg [W+1:0] add_out;
    reg [W+1:0] sub_out;

    reg [W+1:0] regA;
    reg [W+1:0] regB;

    
    assign mux_out = (sel) ? y1 : z;

    always @(*) begin
        mult_out = 0;

        if (en_mult)
            mult_out = 3 * mux_out;
    end

    always @(*) begin
        div_out = 0;

        if (en_div) begin
            if (d != 0)
                div_out = 4 / d;
            else
                div_out = 0;
        end
    end

    always @(*) begin
        add_out = 0;

        if (en_add)
            add_out = regA + z;
    end

    always @(*) begin
        sub_out = 0;

        if (en_sub)
            sub_out = regB - 6;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            regA <= 0;
            regB <= 0;

            x <= 0;
            c <= 0;
            y2 <= 0;
        end
        else begin

            if (ldA)
                regA <= mult_out;

            if (ldB)
                regB <= mult_out;

            if (en_div)
                c <= div_out;

            if (en_add)
                x <= add_out;
           
            if (en_sub)
                y2 <= sub_out;
            
        end
    end

endmodule