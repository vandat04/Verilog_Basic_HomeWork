`timescale 1ns/1ps

module testbench;

    // ===== KHAI BÁO TÍN HIỆU =====
    reg  [3:0] a;
    reg  [3:0] b;
    wire [3:0] sum;
    wire       carry;

    // ===== GỌI MODULE CẦN TEST =====
    full_adder_N_bit uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    // ===== KÍCH THÍCH TEST =====
    initial begin
      $monitor("At time %t, a = %b, b = %b => sum = %b, carry = %b", $time, a, b, sum, carry);
        a = 4'b0000; b = 4'b0000; #10;
        a = 4'b0001; b = 4'b0001; #10;
        a = 4'b0011; b = 4'b0101; #10;
        a = 4'b0111; b = 4'b0001; #10;
        a = 4'b1111; b = 4'b0001; #10;
        a = 4'b1010; b = 4'b0101; #10;
        a = 4'b1111; b = 4'b1111; #10;

        $finish;
    end

endmodule
