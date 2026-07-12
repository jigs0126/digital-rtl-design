`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 08:08:07
// Design Name: 
// Module Name: cp
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


module cp(
    input clk,
    input rst,
    input start,

    output reg sel,
    output reg en_mult,
    output reg en_div,
    output reg en_add,
    output reg en_sub,
    output reg ldA,
    output reg ldB,
    output reg done
);

    localparam IDLE = 2'b00,
               S1   = 2'b01,
               S2   = 2'b10,
               S3   = 2'b11;

    reg [1:0] state,next_state;

    // State register
    always @(posedge clk or posedge rst) begin
        if(rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case(state)

            IDLE:
                if(start)
                    next_state = S1;
                else
                    next_state = IDLE;

            S1:
                next_state = S2;

            S2:
                next_state = S3;

            S3:
                next_state = IDLE;

            default:
                next_state = IDLE;

        endcase
    end

    // Output logic
    always @(*) begin

        sel     = 0;
        en_mult = 0;
        en_div  = 0;
        en_add  = 0;
        en_sub  = 0;
        ldA     = 0;
        ldB     = 0;
        done    = 0;

        case(state)

            S1: begin
                sel     = 1;
                en_mult = 1;
                ldA     = 1;

                en_div  = 1;
            end

            S2: begin
                sel     = 0;
                en_mult = 1;
                ldB     = 1;

                en_add  = 1;
            end

            S3: begin
                en_sub = 1;
                done   = 1;
            end

        endcase
    end

endmodule