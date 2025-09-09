/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_digital_gates (
    input  wire [7:0] ui_in,    // inputs
    output wire [7:0] uo_out,   // outputs
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire ena,            // required
    input  wire clk,            // required
    input  wire rst_n           // required
);

    // Assign unused IOs to default values
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // Example: implement basic gates
    wire a = ui_in[0];
    wire b = ui_in[1];

    assign uo_out[0] = ena & (a & b);   // AND
    assign uo_out[1] = ena & (a | b);   // OR
    assign uo_out[2] = ena & (a ^ b);   // XOR
    assign uo_out[3] = ena & ~(a & b);  // NAND
    assign uo_out[4] = ena & ~(a | b);  // NOR
    assign uo_out[5] = ena & ~(a ^ b);  // XNOR
    assign uo_out[6] = ena & ~a;        // NOT
    assign uo_out[7] = ena & b;         // just pass-through b

endmodule

