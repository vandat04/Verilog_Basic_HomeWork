`timescale 1ns/1ps

module tb_multi_bit_FF;

    reg clk;
    reg rst_n;
    reg count_en;
    reg count_clr;

    wire [7:0] count;
    wire overflow;

    // =============================
    // Instantiate DUT
    // =============================
    multi_bit_FF dut (
        .clk(clk),
        .rst_n(rst_n),
        .count_en(count_en),
        .count_clr(count_clr),
        .count(count),
        .overflow(overflow)
    );

    // =============================
    // Clock generation (10ns)
    // =============================
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // =============================
    // Stimulus
    // =============================
    initial begin
        // Init
        rst_n     = 0;
        count_en = 0;
        count_clr= 0;

        // Reset active
        #20;
        rst_n = 1;              // nhả reset

        // Enable counter
        #10;
        count_en = 1;

        // Chạy cho đến overflow
        wait (overflow == 1'b1);
        $display(">>> OVERFLOW at time=%0t, count=%d", $time, count);

        // Clear counter
        #10;
        count_clr = 1;
        #10;
        count_clr = 0;

        // Chạy tiếp vài chu kỳ
        #100;

        $finish;
    end

    // =============================
    // Monitor
    // =============================
    initial begin
        $monitor("T=%0t | rst_n=%b | en=%b | clr=%b | count=%d | ovf=%b",
                  $time, rst_n, count_en, count_clr, count, overflow);
    end

endmodule
