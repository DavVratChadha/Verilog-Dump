module mux2to1(x,y,s,m);
	input x, y, s;
	output m;
	assign m = s ? y : x;
   
		
endmodule
/*
always @(posedge Clock) // triggered every time clock rises
	begin
	if (Reset_b == 1'b1) // when Reset b is 0 (note this is tested on every rising clock edge)
		ALUout <= 0; // q is set to 0. Note that the assignment uses <=
	else // when Reset b is not 0
		ALUout <= q; // value of d passes through to output q
	end
*/
module flipflop (d, clock, q,reset);
	input d, clock, reset;
	output reg Q;
	always @(posedge Clock) 
	begin
		if (Reset_b == 1'b1)
			q <= 0;
		else 
			q <= d;
	end
endmodule

module subCirc(right, left, LoadLeft, data_D, parallel_loadn, datato_dff, clock, reset, out_Q);
	input right;
	input left;
	input LoadLeft;
	wire rotatedata; //output from 1st mux
	input data_D;
	input parallel_loadn;
	wire datato_dff; //output from 2nd mux
	
	mux2to1 M1(
		.x(right),
		.y(left),
		.s(LoadLeft),
		.m(rotatedata)
		);

	mux2to1 M2(
		.x(data_D),
		.y(rotatedata),
		.s(parallel_loadn),
		.m(datato_dff)
		);
	
	flipflop F0(
		.d(datato_dff),
		.q(out_Q),
		.clock(clock),
		.reset(reset)
		);

endmodule 

module part3(clock, reset, ParallelLoadn, RotateRight, ASRight, Data_IN, Q);

endmodule	
