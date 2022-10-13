

module test1(LEDR, SW);
    input [9:0] SW;
    output [9:0] LEDR;

    part1 u0(
        .MuxSelect[0](SW[0]),
	.MuxSelect[1](SW[1]),
	.MuxSelect[2](SW[2]),
        .Input[0](SW[3]),
	.Input[1](SW[4]),
	.Input[2](SW[5]),
	.Input[3](SW[6]),
	.Input[4](SW[7]),
	.Input[5](SW[8]),
	.Input[6](SW[9]),
        .Out(LEDR[0])
        );
endmodule

module part1(MuxSelect, Input, Out);
	input MuxSelect[2:0];
	input Input[6:0];
	output reg Out;
	
	always @(*)begin
		case(MuxSelect[2:0])
			3'b000: Out = Input[0];
			3'b001: Out = Input[1];
			3'b010: Out = Input[2];
			3'b011: Out = Input[3];
			3'b100: Out = Input[4];
			3'b101: Out = Input[5];
			3'b110: Out = Input[6];
			3'b111: Out = Input[6];
			default: Out = 0;
		endcase
	end
endmodule
