//Tester
//TESTCASES=3
`timescale 1 ns/10 ps 
module part1_tb;
    //input
    reg reset;
    reg w;
    reg clock;

    //output
    wire out;
    wire [3:0] state;
    //golden
    reg [3:0]state_golden;
    reg z_golden;
    
    localparam A = 4'b0000, B = 4'b0001, C = 4'b0010, D = 4'b0011, E = 4'b0100, F = 4'b0101, G = 4'b0110;

	part1 DUT (.Clock(clock), .Resetn(reset), .w(w), .z(out), .CurState(state));

	task CHECK_LEDR;
	begin
        
		if(out == z_golden && state == state_golden)
            $display("At cycle %d, state = %d, output = %d, golden_state = %d, golden_output = %d PASSED",
                $time, state, out, state_golden, z_golden); 
		else
			$display("At cycle %d, state = %d, output = %d, golden_state = %d, golden_output = %d FAILED",
                $time, state, out, state_golden, z_golden); 
	end
	endtask 
    
    initial begin 
        clock = 1;
        reset = 0;
        w = 0;
        #1;
        $display("At cycle %d, reset = %d, w = %d", $time, reset, w);
        #1;
        reset = 1;
        w = 0;
        $display("At cycle %d, reset = %d, w = %d", $time, reset, w);
        state_golden = A;
        z_golden = 0;
        #1
        
        state_golden = A;
        z_golden = 0;
        #1
        w = 1;
        $display("At cycle %d, reset = %d, w = %d", $time, reset, w);
        #1
        CHECK_LEDR();
        
        state_golden = B;
        z_golden = 0;
        #1
        CHECK_LEDR();

        state_golden = C;
        z_golden = 0;
        #1
        CHECK_LEDR();
        $finish;
    end
    
    always
    begin
        #0.5 clock = !clock;
    end
endmodule
