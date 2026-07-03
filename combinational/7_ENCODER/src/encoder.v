`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 11:43:57
// Design Name: 
// Module Name: encoder
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


module encoder( input i1, input i0, output reg out
    );
    always @(*) begin
        case ({i1,i0})
            2'b01 : out = 1'b0;
            2'b10 : out = 1'b1;
            2'b00 : out = 1'bx;
            2'b11 : out = 1'bx;
            default: out = 1'bx;
        endcase
    end
endmodule
