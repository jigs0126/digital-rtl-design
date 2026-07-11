`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 11:38:22
// Design Name: 
// Module Name: USR
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

module USR(
    input clk,
    input [1:0] mode,
    input s_left,
    input s_right,
    input [3:0] p_in,
    output reg [3:0] q
);
  /*  reg [26:0] cnt;
    wire clk_out;

    // Clock divider
    always @(posedge clk) begin
        cnt <= 27'b00;
        cnt <= cnt + 1'b1;
    end
    assign clk_out = cnt[26];   */
    always @(posedge clk)
    begin
        case(mode)

            // Hold
            2'b00:
                q <= q;

            // Shift Right
            2'b01:
                q <= {s_right, q[3:1]};

            // Shift Left
            2'b10:
                q <= {q[2:0], s_left};

            // Parallel Load
            2'b11:
                q <= p_in;

        endcase
    end

endmodule