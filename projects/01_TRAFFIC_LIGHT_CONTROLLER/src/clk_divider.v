`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2026 12:00:35
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
  input rst,clk_master,
  output clk_slave
);
  reg [1:0]count;
  always@(posedge clk_master)begin
    if(!rst)
      count<=1'b0;
    else
      count<=count+1'b1;
  end
  assign clk_slave=count[1];
endmodule