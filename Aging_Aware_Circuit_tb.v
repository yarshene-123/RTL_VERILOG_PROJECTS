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
        $display("Aging-Aware Circuit Timing Test");

        // Test normal path
        a = 1; b = 1; aging_mode = 0;
        #1;
        if (y !== 1'b0)
            $display("FAIL: Normal path should not update yet");
        #2;
        if (y == 1 && timing_warning == 0)
            $display("PASS: Normal path timing");
        else
            $display("FAIL: Normal path timing");

        // Test aged path
        a = 0; b = 0; aging_mode = 1;
        #1;
        if (timing_warning == 1)
            $display("PASS: Aged timing warning");
        else
            $display("FAIL: Aged timing warning");

        a = 1; b = 1;
        #9;
        if (y == 1 && timing_warning == 1)
            $display("PASS: Aged path output");
        else
            $display("FAIL: Aged path output");

        $finish;
    end

endmodule
