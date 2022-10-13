module part2(ClockIn, Reset, Speed, CounterValue);
    input ClockIn, Reset;
    input [1:0] Speed;
    output reg [3:0] CounterValue;
    
    wire coop;

    reg [11:0] RateDivider;
    reg [11:0] pp;

    assign coop = (RateDivider == 0)?1:0; 
    
    
    always @(posedge ClockIn) begin
        RateDivider <= RateDivider - 1;


        if(Speed[1:0] == 2'b00)
            RateDivider <= 0;


        else if((Speed[1:0] == 2'b01) & ((RateDivider == 0) | (RateDivider > 499)))
            RateDivider <=499;


        else if((Speed[1:0] == 2'b10) & ((RateDivider == 0) | (RateDivider > 999)))
            RateDivider <=999;


        else if((Speed[1:0] == 2'b11) & ((RateDivider == 0) | (RateDivider > 1999)))
            RateDivider <= 1999;


        if (Reset == 1'b1) begin
            CounterValue <= 0; 
		RateDivider <= 0;
	end

        else if (coop == 1'b1) 
            CounterValue <= CounterValue + 1;

        else if (CounterValue == 4'b1111)
            CounterValue <= 0;


    end
endmodule
