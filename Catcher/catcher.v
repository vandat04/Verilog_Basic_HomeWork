module catcher (
	input wire clk,
	input wire rst_n,
	input wire in1,
	input wire in2,
	output reg out
); 
	
	reg in2_pre;
	
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			out <= 1'b0;
			in2_pre <= 1'b0;
		end else begin
			
			in2_pre <= in2;			

			if (in1) begin
				out <= 1'b1;
			end else if (in2_pre && !in2) begin
				out <= 1'b0;
			end
		end		
	end 

endmodule
