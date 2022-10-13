.text
.global _start
_start:
//R7 holds sum of all positive numbers
//R8 holds the number of positive numbers in the list
LDR R0, =TEST_NUM //load testnum memory address in R0
MOV R7, #0
MOV R8, #0
B LOOP1

LOOP1: LDR R1, [R0] //load value stored in address in R0 into R1
	   CMP R1, #0
	   BLE END
	   ADD R7, R7, R1
	   ADD R0, R0, #4 //increment R0 by 4 bytes 
	   ADD R8, R8, #1
	   B LOOP1
	
	
END: B END

//TEST_NUM: .word 1,2,3,4,5,6, -1
	//	 .end
	