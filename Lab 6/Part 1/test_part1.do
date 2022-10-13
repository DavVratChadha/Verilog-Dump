vlib work

vlog part1.v

#load simulation
vsim part1

#log all signals
log {/*}

add wave {/*}

#Test cases
#inputs: Clock, Resetn, w

#figure 1 (page 3)
force {Clock} 0   
force {Resetn} 1	  
force {w} 0   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 0   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 0   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 0   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 0   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 0   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 0   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 0   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 0   
run 10ns


#our own tests (checking synchronous reset)
force {Clock} 1   
force {Resetn} 1	  
force {w} 0   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 1   
force {Resetn} 0	  
force {w} 1   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 0   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 1   
run 10ns

force {Clock} 1   
force {Resetn} 1	  
force {w} 0   
run 10ns