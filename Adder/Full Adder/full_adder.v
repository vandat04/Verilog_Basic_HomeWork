module full_adder(
  input wire a,
  input wire b, 
  input wire c,
  output wire sum
  output wire carry
);

wire s;
wire[1:0] ca;

half_adder ha_1(.(a_in(a) , b_in(b) , sum_out(s) , carry_out(ca[0]));
half_adder ha_2(.(a_in(s) , b_in(c) , sum_out(sum) , carry_out(ca[1]));

assign carry = ca[0] | ca[1];

endmodule


module half_adder(
  input wire a_in, b_in,
  output wire sum_out, carry_out
);

assign sum_out = a_in ^ b_in;
assign carry_out = a_in & b_in;

endmodule
