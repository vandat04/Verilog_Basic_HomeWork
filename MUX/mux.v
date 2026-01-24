// MUX: (Multiplexer – bộ dồn kênh) 
// là mạch chọn 1 trong nhiều tín hiệu đầu vào để đưa ra 1 đầu ra duy nhất, dựa trên các đường chọn (Select lines).
module mux (
	input wire in_1,
	input wire in_2,
	input wire in_3,
	input wire in_0,
	input wire SEL_0,
	input wire SEL_1,
	output wire out
);

	assign out = SEL_1 ? (SEL_0 ? in_3 : in_2) : (SEL_0 ? in_1 : in_0);

endmodule
