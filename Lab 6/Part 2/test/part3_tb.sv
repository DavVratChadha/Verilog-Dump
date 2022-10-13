//Tester
//TESTCASES=9

`timescale 1ns / 10ps

module part3_tb;
    //input
    reg Clock;
    reg Resetn;
    reg Go;
    reg [3:0]Dividend;
    reg [3:0]Divisor;
    //output
    wire [3:0]Quotient;
    wire [3:0]Remainder;
    //golden
    reg [3:0]Quotient_golden;
    reg [3:0]Remainder_golden;
    
    part3 DUT(
    .Clock(Clock),
    .Resetn(Resetn),
    .Go(Go),
    .Divisor(Divisor),
    .Dividend(Dividend),
    .Quotient(Quotient),
    .Remainder(Remainder));
    
    task KEYPRESS;
    begin
        Go = 1; //key press
        #1;
        Go = 0; //key release
        #1;
    end
    endtask
    
    task CHECK_QUOTIENT_REMAINDER;
    begin
        $display("Checking Quotient and Remainder");
        if (Quotient == Quotient_golden)
            $display("Your Quotient = %b, Golden Quotient = %b, PASSED", Quotient, Quotient_golden);
        else
            $display("Your Quotient = %b, Golden Quotient = %b, FAILED", Quotient, Quotient_golden);
        if (Remainder == Remainder_golden)
            $display("Your Remainder = %b, Golden Remainder = %b, PASSED", Remainder, Remainder_golden);
        else
            $display("Your Remainder = %b, Golden Remainder = %b, FAILED", Remainder, Remainder_golden);
    end
    endtask

    initial begin
        Resetn = 1'b0;
        Go = 0;
		Clock = 1'b0;
	    Dividend = 0;
	    Divisor = 0;
        Quotient_golden = 0;
        Remainder_golden = 0;
        #1
        $display("Checking Reset");
        CHECK_QUOTIENT_REMAINDER();
        
        Resetn = 1'b1;
        #1
        
        Dividend = 7;
        Divisor = 3;
        Quotient_golden = 2;
        Remainder_golden = 1;
        KEYPRESS();
        #50
        CHECK_QUOTIENT_REMAINDER();
        
        Dividend = 7;
        Divisor = 3;
        $display("Input Dividend = %d, Divisor = %d", Dividend, Divisor);
        Quotient_golden = 2;
        Remainder_golden = 1;
        KEYPRESS();
        #50
        CHECK_QUOTIENT_REMAINDER();
        
        $finish;
    end
    always
        #0.5 Clock = ~Clock;
endmodule
