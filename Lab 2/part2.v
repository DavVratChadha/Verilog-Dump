module v7404 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8,pin10, pin12); 
	//Declaring inputs & outputs 
	input pin1, pin3, pin5, pin9, pin11, pin13; 
	output pin2, pin4, pin6, pin8, pin10, pin12; 
	//Assigning values to output pins 
	assign pin2 = !pin1; 
	assign pin4 = !pin3; 
	assign pin6 = !pin5; 
	assign pin8 = !pin9; 
	assign pin10 = !pin11; 
	assign pin12 = !pin13; 
endmodule //NOT
 
module v7408 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8,pin10, pin12); 
	//Declaring inputs & outputs 
	input pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13; 
	output pin3, pin6, pin8, pin11; 
	//Assigning values to output pins 
	assign pin3 = pin1 & pin2; 
	assign pin6 = pin4 & pin5; 
	assign pin8 = pin9 & pin10; 
	assign pin11 = pin12 & pin13; 
endmodule //AND 

module v7432 (pin1, pin3, pin5, pin9, pin11, pin13, pin2, pin4, pin6, pin8,pin10, pin12); 
	//Declaring inputs & outputs 
	input pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13; 
	output pin3, pin6, pin8, pin11; 
	//Assigning values to output pins 
	assign pin3 = pin1 | pin2; 
	assign pin6 = pin4 | pin5; 
	assign pin8 = pin9 | pin10; 
	assign pin11 = pin12 | pin13; 
endmodule //OR
 
module mux2to1(x, y, s, m); 
	//Declaring inputs & outputs 
	input x, y, s; 
	output m; 
	//m = !s&x + s&y; 
	//Declaring wires 
	wire w1; 
	wire w2; 
	wire w3; 
	//Using 7400 series chips 

	//NOT chip 
	v7404 u0( 
		.pin1(s), 
		.pin2(w1) 	//w1 = !s 
		); 

	//AND chip 
	v7408 u1( 
		.pin1(x), 
		.pin2(w1), 
		.pin3(w2),	//w2 = !s&x 
		.pin4(y), 
		.pin5(s), 
		.pin6(w3)	//w3 = s&y 
		);
	 
	//OR chip 
	v7432 u2( 
		.pin1(w2), 
		.pin2(w3), 
		.pin3(m)		//m = w2 + w3 = !s&x + s&y; 
		);
endmodule