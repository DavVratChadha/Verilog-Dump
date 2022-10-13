vlib work

vlog part3.v

#load simulation
vsim part3

#log all signals
log {/*}

add wave {/*}

#Test cases
#inputs: part3(Clock, Resetn, Go, Divisor, Dividend, Quotient, Remainder)


force {Clock} 1 0ns, 0 {5ns} -r 10ns 


force {Resetn} 0	
run 10ns

force {Resetn} 1	  
force {Go} 1
force {Divisor} 0010
force {Dividend} 0111
run 10ns

force {Go} 0
run 500ns

force {Resetn} 0	  
run 10ns

force {Resetn} 1	  
force {Go} 1
force {Divisor} 1100
force {Dividend} 1111
run 10ns

force {Go} 0
run 500ns
