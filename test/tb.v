`default_nettype none
`timescale 1ns/1ps

module tb;

    reg clk;
    reg rst_n;
    reg [7:0] ui_in;
    wire [7:0] uo_out;
    wire [7:0] uio_in = 8'b0;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    tt_um_digital_gates dut (
        .clk(clk),
        .rst_n(rst_n),
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(uio_in),
        .uio_out(uio_out),
        .uio_oe(uio_oe)
    );

    // clock
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, tb);

        clk = 0;
        rst_n = 0;
        ui_in = 8'b0;
        #10 rst_n = 1;

        // Test all combinations of a and b
        ui_in[0] = 0; ui_in[1] = 0; #10;
        ui_in[0] = 0; ui_in[1] = 1; #10;
        ui_in[0] = 1; ui_in[1] = 0; #10;
        ui_in[0] = 1; ui_in[1] = 1; #10;

        $finish;
    end

endmodule
