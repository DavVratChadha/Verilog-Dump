.global _start
.global SWAP

_start:
    LDR R9,=LIST		//assigning list address to a register
    LDR R4,[R9] 		//n
    MOV R5,R6 
    B BUBBLESORT
	
BUBBLESORT:
    LDR R9,=LIST		//assigning list address to a register
    SUB R4,R4,#1 		//n = n-1
    CMP R4,#0 			//end if R4 == 0
    BEQ END
    MOV R5,R4 
    B LOOP
	
LOOP:
    ADD R9,R9,#4
    MOV R0,R9 
    BL SWAP 
    CMP R5,#1 
    BEQ BUBBLESORT
    SUB R5,R5,#1 
    B LOOP
	
SWAP:
    LDR R2,[R0,#4]
    LDR R1,[R0]
    CMP R2,R1
    BLT SUBSWAP 
    MOV R0,#0
    MOV PC,LR			//End subroutine

SUBSWAP:
    STR R2,[R0]
    STR R1,[R0, #4]
    MOV R0,#1
    MOV PC,LR			//End subroutine
    
END: 
	B END

.end
	