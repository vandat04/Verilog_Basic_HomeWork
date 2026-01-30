module catcher_tb;
    reg clk;
    reg rst_n;
    reg in1;
    reg in2;
    wire out;

    catcher dut (
        .clk(clk),
        .rst_n(rst_n),
        .in1(in1),
        .in2(in2),
        .out(out)
    );

    // clock 10ns
    always #5 clk = ~clk;

    initial begin
        // init
        clk = 0;
        rst_n = 0;
        in1 = 0;
        in2 = 0;

        // reset
        #12;
        rst_n = 1;

        // ---- SET by in1 (1 cycle only) ----
        @(posedge clk);
        in1 <= 1;

        @(posedge clk);
        in1 <= 0;   // in1 chỉ 1 cycle

        // ---- HOLD ----
        repeat(3) @(posedge clk);

        // ---- CLEAR by in2 falling edge ----
        @(posedge clk);
        in2 <= 1;

        @(posedge clk);
        in2 <= 0;   // falling edge → clear out

        repeat(2) @(posedge clk);
        $stop;
    end
endmodule
