module part1(MuxSelect, Input, Out); //module part 1 declaration
	//Setting inputs and outputs 
	input [2:0] MuxSelect; 
	input [6:0] Input;
	output Out;
	reg Out;	//output signal for always block must be declared using 'reg'
	always @(*) // declare always block
	begin
		case (MuxSelect[2:0]) // start case statement
			3'b000: Out = Input[0]; // case 0
			3'b001: Out = Input[1]; // case 1
			3'b010: Out = Input[2]; // case 2
			3'b011: Out = Input[3]; // case 3
			3'b100: Out = Input[4]; // case 4
			3'b101: Out = Input[5]; // case 5
			3'b110: Out = Input[6]; // case 6
			default: Out = Input[0]; // default case
		endcase
	end
endmodule