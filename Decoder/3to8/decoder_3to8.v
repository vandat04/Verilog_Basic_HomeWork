module decoder_2to4 (
	input wire enable,
    input wire[1:0] in,
	output reg [3:0] out
);

	always @(*) begin
		if (enable == 1'b0) begin
			out = 4'b0000;
		end
		else begin
		case(in)
			2'b00: out = 4'b1000;
			2'b01: out = 4'b0100;
			2'b10: out = 4'b0010;
			2'b11: out = 4'b0001;
			default: out = 4'b0000;
		endcase
		end
	end

endmodule

module decoder_3to8 (
	input wire enable,
	input wire [1:0] in,
	input reg [7:0] out
);
  decoder_2to4 d1( .enable(enable) , .in(in) , .out(out[3:0]) );
  decoder_2to4 d2( .enable(~enable) , .in(in) , .out(out[7:4]) );
endmodule
