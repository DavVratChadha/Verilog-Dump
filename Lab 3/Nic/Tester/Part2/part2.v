module mux2to1(x, y, sel, m);
    input x; //select 0
    input y; //select 1
    input sel; //select signal
    output m; //output
  
    //assign m = s & y | ~s & x;
    // OR
    assign m = sel ? y : x;

endmodule


module full_adder(a_0, b_0, c_in_0, s_0, c_out_0);
	//Set inputs and outputs
	input a_0, b_0, c_in_0;
	output c_out_0, s_0;
	
	//Define wire that is the output of XOR of A and B
	wire xor_a_b; 
	assign xor_a_b = a_0^b_0;
	
	//Define 's' bit
	assign s_0 = c_in_0^xor_a_b;
	
	//Instantiate mux2to1 module, with inputs c_in, b, xor_a_b
	mux2to1 u1(
		.x(b_0),
		.y(c_in_0),
		.sel(xor_a_b),
		.m(c_out_0));
	
endmodule

module part2(a, b, c_in, s, c_out); //top module, module part2 declaration
	input [3:0] a;
	input [3:0] b;
	input c_in;
	output [3:0] c_out;
	output [3:0] s;

	full_adder u1(
		.a_0(a[0]),
		.b_0(b[0]),
		.c_in_0(c_in),
		.s_0(s[0]),
		.c_out_0(c_out[1]));
	
	full_adder u2(
		.a_0(a[1]),
		.b_0(b[1]),
		.c_in_0(c_out[1]),
		.s_0(s[1]),
		.c_out_0(c_out[2]));
		
	full_adder u3(
		.a_0(a[2]),
		.b_0(b[2]),
		.c_in_0(c_out[2]),
		.s_0(s[2]),
		.c_out_0(c_out[3]));
		
	full_adder u4(
		.a_0(a[3]),
		.b_0(b[3]),
		.c_in_0(c_out[3]),
		.s_0(s[3]),
		.c_out_0(c_out[0]));
	

endmodule