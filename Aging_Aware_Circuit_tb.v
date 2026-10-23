
`timescale 1ns/1ps

module testbench;

    reg a, b;
    reg aging_mode;
    wire y;
    wire timing_warning;

    aging_aware_circuit dut (
        .a(a),
        .b(b),
        .aging_mode(aging_mode),
        .y(y),
        .timing_warning(timing_warning)
    );

    initial begin
        $display("Aging-Aware Circuit Test");

        // Normal mode
        a = 1; b = 1; aging_mode = 0;
        #10;
        if (y == 1 && timing_warning == 0)
            $display("PASS: Normal mode");
        else
            $display("FAIL: Normal mode");

        // Aged mode
        a = 1; b = 1; aging_mode = 1;
        #10;
        if (y == 1 && timing_warning == 1)
            $display("PASS: Aged mode warning");
        else
            $display("FAIL: Aged mode warning");

        // Check AND logic in aged mode
        a = 0; b = 1; aging_mode = 1;
        #10;
        if (y == 0 && timing_warning == 1)
            $display("PASS: Aged mode logic");
        else
            $display("FAIL: Aged mode logic");

        $finish;
    end

endmodule
