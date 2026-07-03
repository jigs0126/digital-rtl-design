`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2026 12:14:42
// Design Name: 
// Module Name: tb_bcd_encoder
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

`timescale 1ns/1ps
module tb_bcd_encoder;

    reg  [6:0] binary_in;
    wire [7:0] out;

    integer tens, ones;
    reg [7:0] expected;

    // Instantiate DUT
    bcd_encoder uut (
        .binary_in(binary_in),
        .out(out)
    );

    task check;
        begin
            #10;
            tens = binary_in / 10;
            ones = binary_in % 10;
            expected = {tens[3:0], ones[3:0]};

            if (out !== expected)
                $display("❌ ERROR: In=%0d | Out=%h | Exp=%h",
                          binary_in, out, expected);
            else
                $display("✅ OK   : In=%0d | Out=%h (T=%0d O=%0d)",
                          binary_in, out, out[7:4], out[3:0]);
        end
    endtask

    initial begin
        $display("===== TEST START =====");

        binary_in = 0;   check();
        binary_in = 5;   check();
        binary_in = 12;  check();
        binary_in = 45;  check();
        binary_in = 99;  check();

        $display("===== TEST END =====");
        $finish;
    end

endmodule