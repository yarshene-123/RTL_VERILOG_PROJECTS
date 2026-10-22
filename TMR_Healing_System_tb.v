
module testbench;
    reg a, b, fault;
    wire y;

    tmr_healing_system dut (
        .a(a),
        .b(b),
        .fault(fault),
        .y(y)
    );

    initial begin
        $monitor("a=%b b=%b fault=%b y=%b",
                 a, b, fault, y);

        a=0; b=0; fault=0; #10;
        a=0; b=1; fault=0; #10;
        a=1; b=1; fault=0; #10;

        // Inject fault into module 3
        a=1; b=1; fault=1; #10;

        $finish;
    end
endmodule
