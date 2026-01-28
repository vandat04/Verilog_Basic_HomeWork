
`timescale 1ns/1ps

module tb_bit_counter;

    reg        clk;
    reg        rst_n;
    wire       overflow;
    wire [7:0] count;

    // Instantiate DUT (Device Under Test)
    bit_counter dut (
        .clk(clk),
        .rst_n(rst_n),
        .overflow(overflow),
        .count(count)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Init
        clk   = 0;
        rst_n = 0;

        // Hold reset for a few cycles
        #20;
        rst_n = 1;

        // Run long enough to see overflow (256 cycles)
        #3000;

        // Finish simulation
        $finish;
    end

    // Monitor signals
    initial begin
        $display("Time\tclk\trst_n\tcount\toverflow");
        $monitor("%0t\t%b\t%b\t%0d\t%b",
                 $time, clk, rst_n, count, overflow);
    end

endmodule

