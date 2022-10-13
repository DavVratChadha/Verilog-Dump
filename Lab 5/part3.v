module part3(ClockIn, Resetn, Start, Letter, DotDashOut);
    input ClockIn, Resetn, Start;
    input [2:0] Letter;

    output reg DotDashOut;
    
	reg dkey;
    reg [4:0]p;
    reg [11:0]cece;
    reg [11:0] lookuptabool; //spelt intentionally for  all purposes pertaining to humour
    
    
    wire setter;
    reg [10:0] RateDivider;

    assign setter = (RateDivider == 0)?1:0; 
    
    always @(*)begin
        case(Letter) //for each letter
            3'b000: lookuptabool = 12'b101110000000; // A

            3'b001: lookuptabool = 12'b111010101000;

            3'b010: lookuptabool = 12'b111010111010;

            3'b011: lookuptabool = 12'b111010100000;

            3'b100: lookuptabool = 12'b100000000000;

            3'b101: lookuptabool = 12'b101011101000;

            3'b110: lookuptabool = 12'b111011101000;

            3'b111: lookuptabool = 12'b101010100000;

            default: lookuptabool = 0;
        endcase
    end
    



always @(posedge ClockIn or negedge Resetn)
    begin
	if (Start ==1'b1)
		dkey <= 1;
        if(Resetn == 0)

	    begin
            RateDivider <= 249;
            DotDashOut <= 0;
            p <= 0;
            cece <= 0;
            dkey <= 0;
        end

       else begin
            RateDivider <= (RateDivider == 0)?249:RateDivider-1;

            if((dkey == 1'b1)&(setter == 1'b1)) 
                begin
					     cece = lookuptabool << p;
                    DotDashOut <= cece[11];	
                    p = (p == 11)?0:p + 1;
                end
            end
    end
  endmodule
