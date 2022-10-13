module part1(Clock, Enable, Clear_b, CounterValue);
	input Clock, Enable, Clear_b;
	output [7:0] CounterValue;

    wire pp[7:0];

    assign pp[0]= Enable;
    assign pp[1]= pp[0] & CounterValue[0];
    assign pp[2]= pp[1] & CounterValue[1];
    assign pp[3]= pp[2] & CounterValue[2];
    assign pp[4]= pp[3] & CounterValue[3];
    assign pp[5]= pp[4] & CounterValue[4];
    assign pp[6]= pp[5] & CounterValue[5];
    assign pp[7]= pp[6] & CounterValue[6];



	fleepfloop f1(pp[0], Clock, Clear_b, CounterValue[0]);
    fleepfloop f2(pp[1], Clock, Clear_b, CounterValue[1]);
    fleepfloop f3(pp[2], Clock, Clear_b, CounterValue[2]);
    fleepfloop f4(pp[3], Clock, Clear_b, CounterValue[3]);
    fleepfloop f5(pp[4], Clock, Clear_b, CounterValue[4]);
    fleepfloop f6(pp[5], Clock, Clear_b, CounterValue[5]);
    fleepfloop f7(pp[6], Clock, Clear_b, CounterValue[6]);
    fleepfloop f8(pp[7], Clock, Clear_b, CounterValue[7]);
endmodule


module fleepfloop(T, clk, rst, Q);
	input T;
	input clk;
    input rst;
	output reg Q;
	
	always @(posedge clk or negedge rst)
		begin 
			if (!rst)
				Q<=0;
			else 
				Q<=Q^T;
		end
endmodule