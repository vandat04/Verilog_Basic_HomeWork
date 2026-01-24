`timescale 1ns/1ps

module testbench;

    // ===== KHAI BÁO TÍN HIỆU =====
	reg  [7:0] a;
	reg  [7:0] b;
	reg  [2:0] ctrl;
	wire [7:0] y;
	wire zero;
	wire negative;
	wire carry;

    // ===== GỌI MODULE CẦN TEST =====
 	alu uut (
        .a(a),
        .b(b),
        .ctrl(ctrl),
        .y(y),
        .zero(zero),
        .negative(negative),
        .carry(carry)
    );

    // ===== KÍCH THÍCH TEST =====
    initial begin
        $monitor("At time %t | a=%b b=%b ctrl=%b | y=%b zero=%b negative=%b carry=%b", $time, a, b, ctrl, y, zero, negative, carry);

        // AND
        a = 8'b00001111; b = 8'b11110000; ctrl = 3'b000;#10;

        // OR
        a = 8'b00001111; b = 8'b11110000; ctrl = 3'b001;#10;

        // ADD (no carry)
        a = 8'b00000101; b = 8'b00000011; ctrl = 3'b010;#10;

        // ADD (with carry)
        a = 8'b11111111; b = 8'b00000001; ctrl = 3'b010;#10;

        // SUB (positive result)
        a = 8'b00001000; b = 8'b00000010; ctrl = 3'b110;#10;

        // SUB (negative result)
        a = 8'b00000010; b = 8'b00001000; ctrl = 3'b110;#10;

        // INVALID ctrl
        a = 8'b10101010; b = 8'b01010101; ctrl = 3'b111;#10;

        $finish;
    end

endmodule
