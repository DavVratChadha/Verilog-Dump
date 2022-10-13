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
		.c_out_0(c_out[0]));
	
	full_adder u2(
		.a_0(a[1]),
		.b_0(b[1]),
		.c_in_0(c_out[0]),
		.s_0(s[1]),
		.c_out_0(c_out[1]));
		
	full_adder u3(
		.a_0(a[2]),
		.b_0(b[2]),
		.c_in_0(c_out[1]),
		.s_0(s[2]),
		.c_out_0(c_out[2]));
		
	full_adder u4(
		.a_0(a[3]),
		.b_0(b[3]),
		.c_in_0(c_out[2]),
		.s_0(s[3]),
		.c_out_0(c_out[3]));

endmodule

module hex_decoder(c, display); //Hexadecimal decoder
	input [3:0] c; 
	output [6:0] display;
	assign display[0] = !(!c[2]&!c[0] | c[1]&!c[3] | c[1]&c[2] | c[3]&!c[0] | !c[1]&c[3]&!c[2] | !c[3]&c[2]&c[0]);
	assign display[1] = !(!c[3]&!c[2] | !c[0]&!c[2] | c[1]&c[0]&!c[3] | !c[1]&!c[0]&!c[3] | !c[1]&c[0]&c[3]);
	assign display[2] = !(c[3]&!c[2] | !c[1]&!c[3] | !c[3]&c[0] | c[2]&!c[3] | !c[1]&c[0]);
	assign display[3] = !(!c[1]&c[3] | c[1]&!c[2]&c[0] | !c[1]&c[0]&c[2] | c[2]&c[1]&!c[0] | !c[0]&!c[2]&!c[3]);
	assign display[4] = !(c[3]&c[2] | c[1]&!c[0] | c[3]&c[1] | !c[0]&!c[2]);
	assign display[5] = !(c[3]&!c[2] | !c[1]&!c[0] | c[2]&!c[0] | c[1]&c[3] | !c[3]&c[2]&!c[1]);
	assign display[6] = !(c[3]&!c[2] | c[1]&!c[0] | c[3]&c[0] | !c[3]&c[2]&!c[1] | !c[2]&c[1]);
endmodule

module part3(A, B, Function, ALUout); //Arithmetic Logic Unit, top-level module
	input A[3:0], B[3:0];
	output Function[2:0], ALUout[7:0];
	reg ALUout;
	wire [7:0] fullAddOut;
	wire [3:0] cout1;
	wire [3:0] sout1;
	full_adder u1(
		.a(A),
		.b(B),
		.c_in(0),
		.s(sout1),
		.c_out(cout1));
	assign fullAddOut = {cout1[3],sout1};
		
	always @(*)begin
		case(Function)
			3'b000: ALUout =  fullAddOut; // A + B (full adder)
			3'b001: ALUout = A + B; // A + B (Verilog bitwise '+' operator)
			3'b010: ALUout = {4{B[0]},B}; // Extension of B to 8 bits
			3'b011: ALUout =  {7{0},|{A,B}};//{4{0},B} | {4{0},A}; // output 8b1 if one bit is 1
			3'b100: ALUout = {7{0},&{A,B}}; // output 8b1 if all 8 bits are 1 
			//3'b101: ALUout = {A[0],A[1],A[2],A[3],B[4],B[5],B[6],B[7]}; // Display A in the most significant four bits and B in the lower four bits
			3'b101: ALUout = {{A[3:0],{B[7:4]}};			
			default: ALUout = 0; // default case
		endcase
	end
endmodule