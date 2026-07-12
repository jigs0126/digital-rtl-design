`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2026 11:54:38
// Design Name: 
// Module Name: tb_booths_multiplier
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
module tb_booths_multiplier;

    reg         clk, rst, start;
    reg  [31:0] multiplicand, multiplier;
    wire [63:0] product;
    wire        done;

    integer errors = 0;

    booths_multiplier dut (
        .clk(clk), .rst(rst), .start(start),
        .multiplicand(multiplicand), .multiplier(multiplier),
        .product(product), .done(done)
    );

    // 100MHz clock
    always #5 clk = ~clk;

    task run_case(input signed [31:0] a, input signed [31:0] b);
        reg signed [63:0] expected;
        begin
            expected = a * b;

            @(posedge clk);
            multiplicand = a;
            multiplier   = b;
            start        = 1'b1;
            @(posedge clk);
            start        = 1'b0;

            wait (done == 1'b1);
            @(negedge clk);

            if ($signed(product) !== expected) begin
                $display("FAIL: %0d * %0d = %0d (expected %0d)",
                          a, b, $signed(product), expected);
                errors = errors + 1;
            end else begin
                $display("PASS: %0d * %0d = %0d", a, b, $signed(product));
            end

            // return to IDLE
            @(posedge clk);
        end
    endtask

    initial begin
        clk = 0; rst = 1; start = 0;
        multiplicand = 0; multiplier = 0;
        repeat (2) @(posedge clk);
        rst = 0;

        run_case( 32'sd5,    32'sd3);      // positive * positive
        run_case(-32'sd5,    32'sd3);      // negative * positive
        run_case( 32'sd5,   -32'sd3);      // positive * negative
        run_case(-32'sd5,   -32'sd3);      // negative * negative
        run_case( 32'sd0,    32'sd1234);   // zero case
        run_case( 32'sd65535, 32'sd65535); // large positive
        run_case(-32'sd2147483648, 32'sd1);// min 32-bit signed value
        run_case( 32'sd123456, -32'sd7891);

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("%0d TEST(S) FAILED", errors);

        $finish;
    end

endmodule

