#Setting working dir
vlib work

#Compiling Verilog
vlog part2.v

#Loading simulation using part1 as the top level simulation module
vsim part2

#Logging all signals
log {/*}
#Adding wave {/*} to add all items from mux2to1
add wave {/*}

#Test Cases
#Case 1
#Settin input values
force {a} 1000
force {b} 1010
force {c_in} 0
run 10ns
