`default_nettype none
`timescale 1ns/1ps

module tb_tt_um_digital_gates;

    // DUT signals
    reg  [7:0] ui_in;
    wire [7:0] uo_out;
    reg  [7:0] uio_in;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;
    reg ena;
    reg clk;
    reg rst_n;

    // Instantiate DUT
    tt_um_digital_gates dut (
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out),
        .uio_oe(uio_oe),
        .ena(ena),
        .clk(clk),
        .rst_n(rst_n)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_tt_um_digital_gates.vcd");
        $dumpvars(0, tb_tt_um_digital_gates);

        // Initialize signals
        clk    = 0;
        rst_n  = 0;
        ena    = 0;
        ui_in  = 8'b0;
        uio_in = 8'b0;

        // Reset cycle
        #10;
        rst_n = 1;
        ena   = 1;

        $display("A B | AND OR XOR NAND NOR XNOR NOTA B");
        $display("-----------------------------------");

        // Test all input combinations
        ui_in[0] = 0; ui_in[1] = 0; #10;
        $display("%b %b |  %b   %b   %b    %b    %b    %b    %b    %b",
                 ui_in[0], ui_in[1],
                 uo_out[0], uo_out[1], uo_out[2], uo_out[3],
                 uo_out[4], uo_out[5], uo_out[6], uo_out[7]);

        ui_in[0] = 0; ui_in[1] = 1; #10;
        $display("%b %b |  %b   %b   %b    %b    %b    %b    %b    %b",
                 ui_in[0], ui_in[1],
                 uo_out[0], uo_out[1], uo_out[2], uo_out[3],
                 uo_out[4], uo_out[5], uo_out[6], uo_out[7]);

        ui_in[0] = 1; ui_in[1] = 0; #10;
        $display("%b %b |  %b   %b   %b    %b    %b    %b    %b    %b",
                 ui_in[0], ui_in[1],
                 uo_out[0], uo_out[1], uo_out[2], uo_out[3],
                 uo_out[4], uo_out[5], uo_out[6], uo_out[7]);

        ui_in[0] = 1; ui_in[1] = 1; #10;
        $display("%b %b |  %b   %b   %b    %b    %b    %b    %b    %b",
                 ui_in[0], ui_in[1],
                 uo_out[0], uo_out[1], uo_out[2], uo_out[3],
                 uo_out[4], uo_out[5], uo_out[6], uo_out[7]);

        #20 $finish;
    end

endmodule
