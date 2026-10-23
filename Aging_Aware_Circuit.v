
module aging_aware_circuit (
    input wire a,
    input wire b,
    input wire aging_mode,
    output wire y
);

    wire normal_output;
    wire backup_output;

    // Main logic circuit
    assign normal_output = a & b;

    // Backup logic with an alternative implementation
    assign backup_output = ~(~a | ~b);

    // Select output based on aging mode
    assign y = aging_mode ? backup_output : normal_output;

endmodule
