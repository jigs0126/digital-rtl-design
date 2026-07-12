`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2026 15:41:20
// Design Name: 
// Module Name: USR_bram
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
module USR_bram (
    input        clk,
    input  [1:0] mode,
    input        sin,
    input  [3:0] pin,
    output [3:0] Q
);
    reg  [3:0] next;
    wire [3:0] dout;
    
    reg [26:0] cnt;
    wire clk_out;

    // Clock divider
    always @(posedge clk) begin
        cnt <= 27'b00;
        cnt <= cnt + 1'b1;
    end
    assign clk_out = cnt[26];  

    always @(*) begin
        case (mode)
            2'b00: next = dout;                    // hold
            2'b01: next = {sin, dout[3:1]};        // shift right
            2'b10: next = {dout[2:0], sin};        // shift left
            2'b11: next = pin;                      // parallel load
        endcase
    end

    blk_mem_gen_0 u0 (
        .clka(clk_out),
        .addra(1'b0),   
        .dina(next),
        .wea(1'b1),
        .ena(1'b1),     
        .douta(dout)
    );

    assign Q = dout;
endmodule