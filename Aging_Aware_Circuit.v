
`timescale 1ns/1ps

module aging_aware_circuit (
    input wire a,
    input wire b,
    input wire aging_mode,
    output reg y,
    output reg timing_warning
);

    reg normal_result;
    reg backup_result;
    integer delay_value;

    always @(*) begin
        normal_result = a & b;
        backup_result = a & b;

        // Simplified educational aging model
        if (aging_mode)
            delay_value = 8;
        else
            delay_value = 2;

        // Simulated timing warning
        if (delay_value > 5)
            timing_warning = 1'b1;
        else
            timing_warning = 1'b0;

        // Select the output path
        if (aging_mode)
            y = backup_result;
        else
            y = normal_result;
    end

endmodule
