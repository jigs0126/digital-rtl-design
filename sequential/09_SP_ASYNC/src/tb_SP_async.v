`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 13:19:46
// Design Name: 
// Module Name: tb_SP_async
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

module tb_SP_async;
    parameter DW= 8;
    parameter AW= 4;
    parameter DEPTH= 16;
    
    reg cs,we;
    reg [AW-1:0]addr;
    reg [DW-1:0]din;
    wire [DW-1:0]dout;
    
    SP_async #(.DW(DW), .AW(AW), .DEPTH(DEPTH)) DUT(
         .cs(cs), .we(we), .addr(addr), .din(din), .dout(dout));
    
    
    initial begin
        cs =0;we = 0; addr = 0; din = 0;
        
        #10;
        cs = 1;
        we = 1;
        addr = 4'h3;
        din = 8'hAB;
        #10;
        cs = 1;
        we = 1;
        addr = 4'h7;
        din = 8'hCD;
        #10;
        cs = 1;
        we = 0;
        addr = 4'h3;
        #10;
        cs = 1;
        we = 0;
        addr = 4'h7;
        #500;
        
        $finish;
        
    end
        
endmodule

