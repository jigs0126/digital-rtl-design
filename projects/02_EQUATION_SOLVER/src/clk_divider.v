`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 11:09:13
// Design Name: 
// Module Name: clk_divider
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

module clk_divider(
    input  clk_master,
    input  rst,
    output clk_slave
);
    reg [1:0] count;
    always @(posedge clk_master) begin
        if (rst) count <= 0;
        else     count <= count + 1;
    end
    assign clk_slave = count[1];
endmodule