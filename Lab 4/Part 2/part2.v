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


module adder(a, b, c_in, s, c_out); //top module, module part2 declaration
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


module part2(Clock,Reset_b, Data, Function, ALUout);
	input [3:0] Data; 
	input Clock;
	input Reset_b;
	input [2:0] Function;
	output reg [7:0] ALUout;
	reg [7:0] q;
	wire [4:0] res;
	reg [3:0] B; 
	
	adder u1(
		.a(Data),
		.b(ALUout[3:0]),
		.c_in(1'b0),
		.s(res[3:0]),
		.c_out(res[4]));

	always@(posedge Clock) // triggered every time clock rises
	begin
		if(Reset_b == 1'b0) // when Reset b is 0 (note this is tested on every rising clock edge)
			ALUout <= 8'b00011000;
		else // when Reset_b is not 0
			ALUout <= q;
	end	

	always@(*)
	begin
		B[3:0] = ALUout[3:0];		case(Function) // start case statement // B = ALUout[3:0] // A = Data
			3'b000: q = {3'b000, res};  //A + B using the adder from Part II of Lab 3
			3'b001: q = Data + B;//A + B using the Verilog `+' operator
			3'b010: q = {{4{B[3]}}, {B}};//Sign extension of B to 8 bits
			3'b011: q = {7'b0000000, |{Data, B}};//Output 8'b00000001 if at least 1 of the 8 bits in the two inputs is 1 using a single OR operation
			3'b100: q = {7'b0000000, &{Data, B}};//Output 8'b00000001 if all of the 8 bits in the two inputs are 1 using a single AND operation
			//these should work
			3'b101: q = B << Data;//Left shift B by A bits using the Verilog shift operator
			3'b110: q = Data*B;//A x B using the Verilog `*' operator
			3'b111: q = ALUout; //Hold current value in the Register, i.e., the Register value does not change
			default: q = 8'b00000000; // default case
		endcase
	end

	
endmodule 
	