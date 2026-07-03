`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 11:30:26
// Design Name: 
// Module Name: DMUX_1to2
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


module DMUX_1to2(input Din, input sel, output y0,output y1
    );
    assign {y1,y0} = sel ? {Din,1'b0} : {1'b0,Din}; 
endmodule
