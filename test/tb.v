`default_nettype none
`timescale 1ns/1ps
module tb_digital_gates;

    reg a, b;
    wire and_out, or_out, not_out_a, not_out_b, nand_out, nor_out, xor_out, xnor_out;

    // Instantiate DUT
    tt_um_digital_gates user_project (
        .a(a),
        .b(b),
        .and_out(and_out),
        .or_out(or_out),
        .not_out_a(not_out_a),
        .not_out_b(not_out_b),
        .nand_out(nand_out),
        .nor_out(nor_out),
        .xor_out(xor_out),
        .xnor_out(xnor_out)
    );

    // Apply stimulus
    initial begin
        $display("A B | AND OR NOTA NOTB NAND NOR XOR XNOR");
        $monitor("%b %b |  %b    %b    %b    %b     %b    %b    %b    %b",
                 a, b, and_out, or_out, not_out_a, not_out_b, nand_out, nor_out, xor_out, xnor_out);

        // Test all input combinations
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
