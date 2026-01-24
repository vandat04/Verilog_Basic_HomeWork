`timescale 1ns/1ps

module testbench;
	// ===== KHAI BÁO TÍN HIỆU =====
	reg [3:0] in;
	reg [1:0] SEL;
	wire out;

	// ===== GỌI MODULE CẦN TEST =====
    mux uut ( .in_0(in[0]) , .in_1(in[1]) , .in_2(in[2]) , .in_3(in[3]), .SEL_0(SEL[0]) , .SEL_1(SEL[1]), .out(out));

	// ===== KÍCH THÍCH TEST =====
	initial begin
		$monitor("At time %t, in_0 = %b, in_1 = %b, in_2 = %b, in_3 = %b , SEL_0 = %b, SEL_1 = %b, out=%b", $time, in[0], in[1], in[2], in[3], SEL[0], SEL[1] , out);
		in = 4'b0000; SEL = 2'b01; #10;
		in = 4'b0001; SEL = 2'b01; #10;
		in = 4'b0011; SEL = 2'b01; #10;
	end
  
endmodule
