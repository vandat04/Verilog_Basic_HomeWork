module half_adder(
    input wire a,
    input wire b,
    output wire sum,
    output wire carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

module full_adder (
	input wire a,
	input wire b,
	input wire c_in,
	output wire sum,
	output wire carry
);
	wire [1:0] c_out;
	wire sum_1;
	half_adder ha1 ( .a(a) , .b(b) , .sum(sum_1) , .carry(c_out[1]) );
	half_adder ha2 ( .a(sum_1) , .b(c_in) , .sum(sum) , .carry(c_out[0]) );
	
	assign carry = c_out[1] | c_out[0];
endmodule

module full_adder_N_bit(
	input wire [3:0]a,
	input wire [3:0]b,
	output wire [3:0]sum,
	output wire carry
);

    wire [4:0] c_out;
	assign c_out[0] = 1'b0;

    genvar  i;
	generate
	    for ( i = 0; i < 4 ; i = i+1) begin : gen_block
		    full_adder fa (.a(a[i]) , .b(b[i]) , .c_in(c_out[i]), .sum(sum[i]) , .carry(c_out[i+1]) );
	    end
    endgenerate

	assign carry = c_out[4];
endmodule
