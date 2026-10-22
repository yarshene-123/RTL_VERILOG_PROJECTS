
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
    input wire fault1,
    input wire fault2,
    input wire fault3,
    output wire y
);
    wire r1, r2, r3;
    wire y1, y2, y3;

    logic_unit m1 (.a(a), .b(b), .y(r1));
    logic_unit m2 (.a(a), .b(b), .y(r2));
    logic_unit m3 (.a(a), .b(b), .y(r3));

    assign y1 = r1 ^ fault1;
    assign y2 = r2 ^ fault2;
    assign y3 = r3 ^ fault3;

    assign y = (y1 & y2) |
               (y2 & y3) |
               (y1 & y3);
endmodule

