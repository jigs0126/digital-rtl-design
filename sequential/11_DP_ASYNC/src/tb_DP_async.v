`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2026 12:20:28
// Design Name: 
// Module Name: tb_DP_async
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

module tb_DP_async;
    parameter DW = 3;
    parameter AW = 3;
    parameter DEPTH = 8;
    
    reg we_a,we_b,cs_a,cs_b;
    reg [AW-1:0]addr_a;
    reg [AW-1:0]addr_b;
    reg [DW-1:0]din_a;
    reg [DW-1:0]din_b;
    
    wire  [DW-1:0]dout_a;
    wire  [DW-1:0]dout_b;
    
    DP_async #(.DW(DW), .AW(AW), .DEPTH(DEPTH)) DUT(we_a,we_b,cs_a,cs_b,
         addr_a,addr_b,din_a,din_b,dout_a,dout_b);
                
    
    initial begin
        cs_a =0;we_a = 0; addr_a = 0; din_a = 0;
        cs_b =0;we_b = 0; addr_b = 0; din_b = 0;
        
        #10;
        cs_a = 1;
        we_a = 1;
        addr_a = 3'h3;
        din_a = 3'h7;
        
        #10;
        cs_a = 1;
        we_a = 0;
        addr_a =3'h3;
        
        #10;
        cs_b = 1;
        we_b = 1;
        addr_b = 3'h7;
        din_b = 3'h5;
      
        #10;
        cs_b = 1;
        we_b = 0;
        addr_b = 3'h7;
        #500;
        
        $finish;
        
    end
        
endmodule

