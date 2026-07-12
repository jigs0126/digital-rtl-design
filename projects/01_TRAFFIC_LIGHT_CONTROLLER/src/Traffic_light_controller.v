`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2026 11:59:20
// Design Name: 
// Module Name: Traffic_light_controller
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
module Traffic_light_controller(
    input clk,
    output reg H1_red, output reg H1_yellow, output reg H1_green,
    output reg H2_red, output reg H2_yellow, output reg H2_green
);

    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;
    parameter s3 = 2'b11;
    parameter [3:0] delay = 4'd5;

    reg [1:0] state;
    reg [3:0] count;
    reg [26:0] cnt;
    wire clk_out;

    // Clock divider
    always @(posedge clk) begin
        cnt <= 27'b00;
        cnt <= cnt + 1'b1;
    end
    assign clk_out = cnt[26];

    // FSM timer
    always @(posedge clk_out) begin
        if (count < delay)
            count <= count + 1'b1;
        else begin
            count <= 4'd0;
            case (state)
                s0: state <= s1;
                s1: state <= s2;
                s2: state <= s3;
                s3: state <= s0;
                default: state <= s0;
            endcase
        end
    end

    // Output decoding
    always @(*) begin
        H1_red    = 0;
        H1_yellow = 0;
        H1_green  = 0;
        H2_red    = 0;
        H2_yellow = 0;
        H2_green  = 0;
        case (state)
            s0: begin H1_red = 1;    H2_green  = 1; end
            s1: begin H1_red = 1;    H2_yellow = 1; end
            s2: begin H1_green = 1;  H2_red    = 1; end
            s3: begin H1_yellow = 1; H2_red    = 1; end
        endcase
    end

endmodule