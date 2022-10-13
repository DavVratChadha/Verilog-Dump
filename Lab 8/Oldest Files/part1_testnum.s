.text

.global _start
.global ONES

_start:
	LDR R1, =TEST_NUM
	LDR R1,[R1]
	MOV R0,#0
	BL ONES

END: B END

ONES:
	CMP R1, #0
	BEQ END
	LSR R2,R1,#1
	AND R1,R1,R2
	ADD R0,#1
	B ONES
	


TEST_NUM: .word 0b000110, 0b001110, 0b100100, 0b111000, 0b111111, 0b000001, 0b010101, 0b111100, 0b101010, -1
		  .end	
		  