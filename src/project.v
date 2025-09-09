/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_digital_gates (
    input  wire clk,      
    input  wire rst_n,    
    input  wire [7:0] ui_in,   
    output wire [7:0] uo_out,  
    input  wire [7:0] uio_in,  
    output wire [7:0] uio_out, 
    output wire [7:0] uio_oe   
);

    // Two input bits for gates
    wire a = ui_in[0];
    wire b = ui_in[1];

    // Map different logic gates to outputs
    assign uo_out[0] = a & b;   // AND
    assign uo_out[1] = a | b;   // OR
    assign uo_out[2] = a ^ b;   // XOR
    assign uo_out[3] = ~(a & b); // NAND
    assign uo_out[4] = ~(a | b); // NOR
    assign uo_out[5] = ~(a ^ b); // XNOR
    assign uo_out[6] = ~a;       // NOT of A
    assign uo_out[7] = ~b;       // NOT of B

    // IOs unused
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
