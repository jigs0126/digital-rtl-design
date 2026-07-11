// =============================================================
// Module      : SISO_SR
// Description : Serial-In Serial-Out (SISO) Shift Register
//               Parameterized depth, synchronous active-high reset,
//               single enable-controlled shift per clock.
// Author      : Jigyasha
// =============================================================

module SISO_SR #(
    parameter DEPTH = 8   // number of flip-flop stages (shift depth)
) (
    input  wire clk,
    input  wire rst,       // synchronous, active-high
    input  wire en,        // shift enable
    input  wire serial_in,
    output wire serial_out
);

    // Internal shift register: reg[0] is the stage nearest serial_in,
    // reg[DEPTH-1] drives serial_out
    reg [DEPTH-1:0] shift_reg;

    always @(posedge clk) begin
        if (rst)
            shift_reg <= {DEPTH{1'b0}};
        else if (en)
            shift_reg <= {shift_reg[DEPTH-2:0], serial_in};
    end

    assign serial_out = shift_reg[DEPTH-1];

endmodule
