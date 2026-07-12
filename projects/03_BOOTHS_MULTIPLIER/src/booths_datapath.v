`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 23:40:29
// Design Name: 
// Module Name: booths_datapath
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

module booths_datapath(
    input clk,
    input rst,
    input load,
    input add_en,
    input sub_en,
    input shift_en,
    input count_dec,
    input signed [31:0] multiplicand,
    input signed [31:0] multiplier,
    output q0,
    output q_1,
    output last_cycle,
    output [63:0] product
    );
    reg signed [32:0] A;
    reg signed [31:0] Q;
    reg  Q_1;
    reg signed [32:0] M;
    reg [5:0] count; 
    wire signed[32:0] sum = A+M;
    wire signed[32:0] diff = A-M;  
    assign q0 = Q[0];
    assign q_1 = Q_1;
    assign last_cycle = (count ==6'd1);
    assign product = {A[31:0],Q};   
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            A <= 32'd0;
            M <= 32'd0;
            Q <= 32'd0;
            Q_1 <= 1'b0;
            count <= 6'd0;
        end
        else if (load) begin
            A <= 32'd0;
            Q <= multiplier;
            M <= {multiplicand[31],multiplicand};
            Q_1 <= 1'b0;
            count <= 6'd32; 
        end
        else begin
            if (add_en)
                A <= sum;
            if (sub_en)
                A <= diff;
            if (shift_en)
                {A,Q,Q_1} <= $signed({A,Q,Q_1}) >>> 1;
            if (count_dec)
                count <= count - 6'd1;
        end
    end           
endmodule
