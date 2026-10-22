
module logic_unit (
    input wire a,
    input wire b,
    output wire y
);
    assign y = a & b;
endmodule

module tmr_healing_system (
    input wire a,
    input wire b,
    input wire fault,
    output wire y
);
    wire y1, y2, y3;

    logic_unit m1 (.a(a), .b(b), .y(y1));
    logic_unit m2 (.a(a), .b(b), .y(y2));

    assign y3 = (a & b) ^ fault;

    assign y = (y1 & y2) |
               (y2 & y3) |
               (y1 & y3);
endmodule
