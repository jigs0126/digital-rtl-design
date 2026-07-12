`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 11:06:03
// Design Name: 
// Module Name: tb_top
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


module tb_top;

    parameter W = 3;

    reg clk;
    reg rst;
    reg start;

    reg [W-1:0] z;
    reg [W-1:0] y1;
    reg [W-1:0] d;

    wire [W+1:0] x;
    wire [W-1:0] c;
    wire [W+1:0] y2;
    wire done;

    top #(W) DUT (
        .clk(clk),
        .rst(rst),
        .start(start),

        .z(z),
        .y1(y1),
        .d(d),

        .x(x),
        .c(c),
        .y2(y2),

        .done(done)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10 ns period
    end

    initial begin

        rst   = 1;
        start = 0;

        z  = 0;
        y1 = 0;
        d  = 0;

        #20;
        rst = 0;

        
        z  = 3'd4;
        y1 = 3'd5;
        d  = 3'd2;

        @(posedge clk);
        start = 1;

        @(posedge clk);
        start = 0;

        wait(done);

        #10;

     
        z  = 3'd6;
        y1 = 3'd7;
        d  = 3'd1;


        @(posedge clk);
        start = 1;

        @(posedge clk);
        start = 0;

        wait(done);

        #10;

        #50;
        $finish;

    end

   

endmodule