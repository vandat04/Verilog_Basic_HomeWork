module multi_bit_FF (
	input wire clk,
	input wire rst_n,
	input wire count_en,
	input wire count_clr,
	output wire overflow,
	output wire [7:0] count
);

	reg [7:0] cnt;
	wire [7:0] pre_cnt;
	assign pre_cnt = (count_clr == 1) ? (8'b0) : ((count_en == 1) ? (count + 8'd1) : (count) );

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			cnt <= 8'd0;	
		end else begin
			cnt <= pre_cnt;			
		end 
	end

	assign count = cnt;
	assign overflow = (count == 8'd255);
endmodule
