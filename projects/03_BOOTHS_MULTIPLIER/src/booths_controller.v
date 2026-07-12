`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2026 11:21:31
// Design Name: 
// Module Name: booths_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: FSM Controller for 32-bit Radix-2 Booth's Multiplier
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module booths_controller(
    input clk,
    input rst,
    input start,
    input q0,
    input q_1,
    input last_cycle,
    
    output reg load,
    output reg add_en,
    output reg sub_en,
    output reg shift_en,
    output reg count_dec,
    output reg done
    );
    
    localparam[2:0]
        IDLE = 3'd0,
        LOAD = 3'd1,
        ADD_SUB = 3'd2,
        SHIFT = 3'd3,
        DONE = 3'd4;
        
    reg [2:0] state,next_state;
    
    always@(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end
    
    always @(*) begin
        case(state)
            IDLE: next_state = start? LOAD : IDLE;
            LOAD: next_state = ADD_SUB;
            ADD_SUB: next_state = SHIFT;
            SHIFT: next_state = last_cycle? DONE: ADD_SUB;
            DONE: next_state = IDLE;
            default: next_state = IDLE;
         endcase
     end
     
     always @(*) begin
        load = 1'b0;
        add_en = 1'b0;
        sub_en = 1'b0;
        shift_en = 1'b0;
        count_dec = 1'b0;
        done = 1'b0;
        
        case(state)
            LOAD: load = 1'b1;
            
            ADD_SUB: begin
                case ({q0,q_1}) 
                    2'b01: add_en = 1'b1;
                    2'b10: sub_en = 1'b1;
                    default: ;
                endcase
            end
            
            SHIFT: begin
                shift_en = 1'b1;
                count_dec = 1'b1;
            end
            
            DONE: done = 1'b1;
             
            default: ;
            
       endcase
   end
endmodule
