#Setting working dir
vlib work

#Compiling Verilog
vlog part1.v

#Loading simulation using part1 as the top level simulation module
vsim part1

#Logging all signals
log {/*}
#Adding wave {/*} to add all items from mux2to1
add wave {/*}

#Test Cases
#Case 1
#Settin input values
force {MuxSelect} 001
force {Input} 1000000
run 10ns

force {MuxSelect} 111
force {Input} 1000000
run 10ns