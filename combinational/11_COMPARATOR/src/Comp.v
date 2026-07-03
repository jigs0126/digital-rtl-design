`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 13:34:40
// Design Name: 
// Module Name: Comp
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

module Comp #(parameter w = 2)(
    input [w-1:0]a,
    input [w-1:0]b,
    output reg greater,
    output reg smaller,
    output reg equal
    );
    
    integer i;
    always @(*) begin :loop
        greater = 0;
        smaller = 0;
        equal = 1;
    
        for (i = w-1 ; i >= 0 ; i = i-1)begin
            if (a[i] != b[i]) begin
                equal = 0;
                if (a[i] > b[i])
                    greater = 1;
                else
                    smaller = 1;
                disable loop;
            end
        end
        
    end

endmodule
