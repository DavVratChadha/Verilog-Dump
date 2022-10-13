#Setting working dir
vlib work

#Compiling Verilog
vlog part2.v

#Loading simulation using mux2to1 as the top level simulation module
vsim mux2to1

#Logging all signals
log {/*}
#Adding wave {/*} to add all items from mux2to1
add wave {/*}

#Test Cases
#Case 1
#Settin input values
force {x} 1
force {y} 0
force {s} 0
run 10ns


force {x} 0
force {y} 1
force {s} 0 
run 10ns


force {x} 1
force {y} 0
force {s} 0 
run 10ns


force {x} 1
force {y} 0
force {s} 1 
run 10ns


force {x} 0
force {y} 1
force {s} 1 
run 10ns
