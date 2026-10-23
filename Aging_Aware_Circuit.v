
`timescale 1ns/1ps

module aging_aware_circuit (
    input wire a,
    input wire b,
    input wire aging_mode,
    output wire y,
    output reg timing_warning
);

    reg normal_result;
    reg aged_result;

    // Normal path: 2 ns propagation delay
    // Aged path: 8 ns propagation delay
    assign #2 normal_result = a & b;
    assign #8 aged_result = a & b;

    // Select the output path
    assign y = aging_mode ? aged_result : normal_result;

    // Timing warning for delay exceeding 5 ns
    always @(*) begin
        if (aging_mode)
            timing_warning = 1'b1;
        else
            timing_warning = 1'b0;
    end

endmodule
