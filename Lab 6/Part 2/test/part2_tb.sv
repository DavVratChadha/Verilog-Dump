//Tester
//TESTCASES=2
`timescale 1ns / 10ps

`timescale 1ns / 10ps

module part2_tb;
    //input
    reg clk;
    reg resetn;
    reg go;
    reg [7:0]data_in;
    
    //output
    wire[7:0]data_result;
    
    //golden
    reg [7:0]data_result_golden;

    part2 DUT(.Clock(clk), .Resetn(resetn), .Go(go), .DataIn(data_in), .DataResult(data_result));
    
    task KEYPRESS;
    begin
        go = 0; //key press
        $display("At cycle %d, resetn = %d, data_in = %d, go = %d", $time, resetn, data_in, go);
        #1;
        go = 1; //key release
        $display("At cycle %d, resetn = %d, data_in = %d, go = %d", $time, resetn, data_in, go);
        #1;
    end
    endtask
    
    task CHECK_LEDR;
    input [7:0] a, b, c, x;
	begin
		if(data_result == data_result_golden)
            $display("At cycle %d, A = %d, B = %d, C = %d, X = %d, output = %d golden_output = %d PASSED", $time, a, b, c, x, data_result, data_result_golden); 
		else
            $display("At cycle %d, A = %d, B = %d, C = %d, X = %d, output = %d golden_output = %d FAILED", $time, a, b, c, x, data_result, data_result_golden); 
	end
	endtask 
    
    task TEST;
    input [7:0] a, b, c, x;
    begin
        data_in = a;
        KEYPRESS();
        data_in = b;
        KEYPRESS();
        data_in = c;
        KEYPRESS();
        data_in = x;
        KEYPRESS();
        data_result_golden = a * x * x + b * x + c;
        #5
        CHECK_LEDR(a, b, c, x);
    end
    endtask
    
    initial begin
        clk    = 1'b1;
        resetn = 1'b0;
        go = 1;
        data_result_golden = 0;
        #5
        $display("At cycle %d, resetn = %d, go = %d", $time, resetn, go);
        $display("Checking Reset");
        CHECK_LEDR(0,0,0,0);
        resetn = 1'b1;

        TEST(1, 2, 3, 4);
        $finish;
    end
    always
        #0.5 clk = ~clk;
endmodule
