
module testbench;
    reg a, b;
    reg fault1, fault2, fault3;
    wire y;

    tmr_healing_system dut (
        .a(a),
        .b(b),
        .fault1(fault1),
        .fault2(fault2),
        .fault3(fault3),
        .y(y)
    );

    task check;
        input expected;
        begin
            #10;
            if (y !== expected)
                $display("FAIL: a=%b b=%b y=%b expected=%b",
                         a, b, y, expected);
            else
                $display("PASS: a=%b b=%b y=%b",
                         a, b, y);
        end
    endtask

    initial begin
        a=0; b=0;
        fault1=0; fault2=0; fault3=0;
        check(0);

        a=0; b=1;
        check(0);

        a=1; b=0;
        check(0);

        a=1; b=1;
        check(1);

        // Inject a fault into module 1
        fault1=1;
        check(1);

        // Inject a fault into module 2
        fault1=0; fault2=1;
        check(1);

        // Inject a fault into module 3
        fault2=0; fault3=1;
        check(1);

        $finish;
    end
endmodule

