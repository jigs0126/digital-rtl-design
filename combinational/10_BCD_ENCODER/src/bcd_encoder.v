`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2026 12:13:55
// Design Name: 
// Module Name: bcd_encoder
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
module bcd_encoder (
    input  wire [6:0] binary_in,
    output reg  [7:0] out        
);
    integer i;
    reg [14:0] shift_reg;   // 4 (tens) + 4 (ones) + 7 (binary) = 15 bits

    always @(*) begin
        shift_reg = 15'd0;
        shift_reg[6:0] = binary_in;
        for (i = 0; i < 7; i = i + 1) begin
            if (shift_reg[10:7] >= 5)
                shift_reg[10:7] = shift_reg[10:7] + 3;
            if (shift_reg[14:11] >= 5)
                shift_reg[14:11] = shift_reg[14:11] + 3;
            shift_reg = shift_reg << 1;
        end
        out = {shift_reg[14:11], shift_reg[10:7]};
    end
endmodule