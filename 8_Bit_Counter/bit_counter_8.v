// “Mỗi lần có xung clock,
// tôi lấy giá trị hiện tại,
// cộng thêm 1,
// rồi lưu lại.”


module bit_counter (
	input wire clk,
	input wire rst_n,
	output wire overflow,
	output wire [7:0] count
);
	wire [7:0] sum;
	wire [7:0] cnt;

	full_adder_8_bit fa8b ( .a(8'd1) , .b(cnt) , .sum(sum) , .carry(overflow));	
	
	dff u_dff0 ( .clk(clk) , .rst_n(rst_n) ,.d(sum[0]) , .q(cnt[0])  );
	dff u_dff1 ( .clk(clk) , .rst_n(rst_n) ,.d(sum[1]) , .q(cnt[1])  );
	dff u_dff2 ( .clk(clk) , .rst_n(rst_n) ,.d(sum[2]) , .q(cnt[2])  );
	dff u_dff3 ( .clk(clk) , .rst_n(rst_n) ,.d(sum[3]) , .q(cnt[3])  );
	dff u_dff4 ( .clk(clk) , .rst_n(rst_n) ,.d(sum[4]) , .q(cnt[4])  );
	dff u_dff5 ( .clk(clk) , .rst_n(rst_n) ,.d(sum[5]) , .q(cnt[5])  );
	dff u_dff6 ( .clk(clk) , .rst_n(rst_n) ,.d(sum[6]) , .q(cnt[6])  );
	dff u_dff7 ( .clk(clk) , .rst_n(rst_n) ,.d(sum[7]) , .q(cnt[7])  );

	assign count = cnt ;

endmodule

module dff (
	input wire clk,
	input wire rst_n,
	input wire d,
	output reg q
); 

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) 
			q<= 1'b0;
		else 
			q <= d;
	end

endmodule

module full_adder_8_bit (
	input  wire [7:0] a,
	input  wire [7:0] b,
	output wire [7:0] sum,
	output wire       carry
);
	wire [8:0] c_out;
	assign c_out[0] = 1'b0;

	genvar i;
	generate
		for (i = 0; i < 8; i = i + 1) begin
			full_adder fa (
				.a(a[i]),
				.b(b[i]),
				.c_in(c_out[i]),
				.sum(sum[i]),
				.carry(c_out[i+1])
			);
		end
	endgenerate

	assign carry = c_out[8];
endmodule

module full_adder (
	input wire a,
	input wire b,
	input wire c_in,
	output wire sum,
	output wire carry
);
	wire [1:0] c_out;
	wire s;
	half_adder ha_1 ( .a(a) , .b(b) , .sum(s) , .carry(c_out[0]) );
	half_adder ha_2 ( .a(s) , .b(c_in) , .sum(sum) , .carry(c_out[1]) );
	assign carry = c_out[0] | c_out[1];
endmodule

module half_adder (
	input wire a,
	input wire b,
	output wire sum,
	output wire carry
);
	assign sum = a ^ b;
	assign carry = a & b;
endmodule
