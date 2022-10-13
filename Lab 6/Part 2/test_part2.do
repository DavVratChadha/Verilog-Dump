vlib work

vlog part2.v

#load simulation
vsim part2

#log all signals
log {/*}

add wave {/*}

#Test cases
#inputs: Clock, Resetn, Go, [7:0] DataIn //synchronous active low reset


force {Clock} 1 0ns, 0 {5ns} -r 10ns 


force {Resetn} 0	  
force {Go} 0
force {DataIn} 00000000
run 10ns

   
force {Resetn} 1	  
force {Go} 0
force {DataIn} 00000000
run 10ns

   
force {Resetn} 1	  
force {Go} 1
force {DataIn} 00001010
#A
run 10ns

   
force {Resetn} 1	  
force {Go} 0
force {DataIn} 00001010
run 10ns

   
force {Resetn} 1	  
force {Go} 1
force {DataIn} 00010001
#B
run 10ns

   
force {Resetn} 1	  
force {Go} 0
force {DataIn} 00010001
run 10ns



   
force {Resetn} 1	  
force {Go} 1
force {DataIn} 00011110
#C
run 10ns

   
force {Resetn} 1	  
force {Go} 0
force {DataIn} 00011110
run 10ns


  

   
force {Resetn} 1	  
force {Go} 1
force {DataIn} 00000011
#X
run 10ns

force {Go} 0
run 500ns
