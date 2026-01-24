//Carry: Phép cộng khi bit vượt khỏi MSB, phép trừ nếu như không mượn
//Zero: Khi phép toán bằng = 0
//Negative: Khi kết quả là âm a < b

module alu (
	input wire [7:0] a,
	input wire [7:0] b,
	input wire [2:0] ctrl,
	output reg [7:0] y,
	output reg zero,
	output reg negative,
	output reg carry
);

reg [8:0] out; 

always @(*) begin
        out      = 9'b0;
        
        carry    = 1'b0;

	case (ctrl)
		3'b000: 
			begin
				y[7:0]   = a[7:0] & b[7:0];
                zero     = (y == 0) ? (1'b1) : (1'b0);  
                carry    = 1'b0;
                negative = 1'b0;
			end
		3'b001:
			begin
				y[7:0]   = a[7:0] | b[7:0];
                zero     = (y == 0) ? (1'b1) : (1'b0);
                carry    = 1'b0;
                negative = 1'b0;  
			end
		3'b010:
			begin
				out[8:0] = a[7:0] + b[7:0];
                y[7:0]   = out[7:0];
                zero     = (y == 0) ? (1'b1) : (1'b0);  
                carry    = out[8];
                negative = 1'b0;
			end
		3'b110:
			begin
				out[8:0] = a[7:0] - b[7:0];
                y[7:0]   = out[7:0];
                zero     = (y == 0) ? (1'b1) : (1'b0);  
                carry    = out[8];
                negative = y[7];
			end
		default: 
			begin
                // NOT a math operation → flags = 0
            end	
	endcase
          
end

endmodule
