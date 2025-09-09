/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// Digital Trainer Kit - All Basic Gates
module digital_gates (
    input  wire a, b,
    output wire and_out,
    output wire or_out,
    output wire not_out_a,
    output wire not_out_b,
    output wire nand_out,
    output wire nor_out,
    output wire xor_out,
    output wire xnor_out
);

    // Gate-level modeling
    assign and_out  = a & b;
    assign or_out   = a | b;
    assign not_out_a = ~a;
    assign not_out_b = ~b;
    assign nand_out = ~(a & b);
    assign nor_out  = ~(a | b);
    assign xor_out  = a ^ b;
    assign xnor_out = ~(a ^ b);

endmodule

