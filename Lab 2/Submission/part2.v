`timescale 1ns / 1ns // `timescale time_unit/time_precision



//six inverters
module v7404 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);	
	input pin1, pin3, pin5, pin9, pin11, pin13;
	output pin2, pin4, pin6, pin8, pin10, pin12;
	
	assign pin2 = ~pin1;
	assign pin4 = ~pin3;
	assign pin6 = ~pin5;
	assign pin12 = ~pin13;
	assign pin10 = ~pin11;
	assign pin8 = ~pin9;
endmodule

//four 2-input AND gates
module v7408 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8, pin10, pin12);

	input pin1, pin2, pin4, pin5, pin13, pin12, pin10, pin9;
	output pin3, pin6, pin11, pin8;
	assign pin3 = pin1 & pin2;
	assign pin6 = pin4 & pin5;
	assign pin11 = pin13 & pin12;
	assign pin8 = pin10 & pin9;
endmodule

//four 2-input OR gates
module v7432 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8,pin10, pin12);
	input pin1, pin2, pin4, pin5, pin13, pin12, pin10, pin9;
	output pin3, pin6, pin11, pin8;
	assign pin3 = pin1 | pin2; 
	assign pin6 = pin4 | pin5;
	assign pin11 = pin13 | pin12; 
	assign pin8 = pin10 | pin9;
endmodule

module mux2to1(x,y,s,m);
	input x, y, s;
    output m;
	wire not_s;
	wire not_s_and_x;
	wire s_and_y;
	
    /*mux2to1 u0(
        .x(SW[0]),
        .y(SW[1]),
        .s(SW[9]),
        .m(LEDR[0])
        );*/
	v7404 u1(
		.pin1(s), //s input to inverter
		.pin2(not_s)); //not s output from inverter	
	
	v7408 u2(
		.pin1(x), //x input to first input pin of and gate for x and not s
		.pin2(not_s), //not s is the second input to x and not s
		.pin3(not_s_and_x), //value of not s and x, output from AND gate
		.pin4(y), //y input to and gate for y and s
		.pin5(s), //s input to and gate for y and s
		.pin6(s_and_y)); //output from y and s
		
	v7432 u3(
		.pin1(not_s_and_x), //not s and x input for !s*x + s*y
		.pin2(s_and_y), //s and y input for !s*x + s*y
		.pin3(m)); //value of m = !s*x + s*y, output for multiplexer
		
endmodule