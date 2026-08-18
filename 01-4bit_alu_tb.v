module alu_tb;

reg [3:0] A, B;
reg [2:0] opcode;
wire [3:0] result;

alu uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result)
);

initial begin

    A = 4'd3;
    B = 4'd2;
    opcode = 3'b000;
    #10;

    A = 4'd5;
    B = 4'd2;
    opcode = 3'b001;
    #10;

    A = 4'b1010;
    B = 4'b1100;
    opcode = 3'b010;
    #10;

    A = 4'b1010;
    B = 4'b1100;
    opcode = 3'b011;
    #10;

    A = 4'b1010;
    B = 4'b1100;
    opcode = 3'b100;
    #10;

end

endmodule
