`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2026 13:19:51
// Design Name: 
// Module Name: priority_encoder_ip
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



module Priority_Encoder(input [3:0] din, output y1, output y0
    );
    assign y1 = din[3] | din[2];
    assign y0 = din[3] | ( din[1] & (~din[2]));
endmodule
