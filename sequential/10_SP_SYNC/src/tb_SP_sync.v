`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 12:53:00
// Design Name: 
// Module Name: tb_SP_sync
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

module tb_SP_sync;
    parameter DW= 8;
    parameter AW= 4;
    parameter DEPTH= 16;
    
    reg clk,cs,we;
    reg [AW-1:0]addr;
    reg [DW-1:0]din;
    wire [DW-1:0]dout;
    
    SP_sync #(.DW(DW), .AW(AW), .DEPTH(DEPTH)) DUT(
        .clk(clk), .cs(cs), .we(we), .addr(addr), .din(din), .dout(dout));
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        cs =0;we = 0; addr = 0; din = 0;
        
        @(posedge clk);
        cs = 1;
        we = 1;
        addr = 4'h3;
        din = 8'hAB;
        @(posedge clk);
        cs = 1;
        we = 1;
        addr = 4'h7;
        din = 8'hCD;
        @(posedge clk);
        cs = 1;
        we = 0;
        addr = 4'h3;
        @(posedge clk);
        cs = 1;
        we = 0;
        addr = 4'h7;
        @(posedge clk);
        
        $finish;
        
    end
        
endmodule
