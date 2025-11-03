module full_adder_2b(
  input wire[1:0] a,
  input wire[1:0] b,
  input wire cin,
  input wire[1:0] sum,
  input wire carry,
);
  
input wire cout,
  full_adder fa_1(.a(a[0]) , .b(b[0]) , .c(cin) , .sum(sum[0]) , .carry(cout) );
  full_adder fa_2(.a(a[1]) , .b(b[1]) , .c(cout) , .sum(sum[1]) , .carry(carry) );
  
endmodule 

//Full Adder
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

//Half Adder
module half_adder(
  input wire a_in, b_in,
  output wire sum_out, carry_out
);

assign sum_out = a_in ^ b_in;
assign carry_out = a_in & b_in;

endmodule
