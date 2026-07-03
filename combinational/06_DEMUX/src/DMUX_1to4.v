`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 11:32:23
// Design Name: 
// Module Name: DMUX_1to4
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


module DMUX_1to4(input Din, input [1:0]sel, output y3,y2,y1,y0
    );
    wire t0,t1;
    DMUX_1to2 a(.Din(Din), .sel(sel[1]), .y1(t1), .y0(t0));
    DMUX_1to2 b(.Din(t0), .sel(sel[0]), .y1(y1), .y0(y0));
    DMUX_1to2 c(.Din(t1), .sel(sel[0]), .y1(y3), .y0(y2));
endmodule
