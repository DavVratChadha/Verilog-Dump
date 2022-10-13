#Setting working dir
vlib work

#Compiling Verilog
vlog part2.v

#Loading simulation using mux2to1 as the top level simulation module
vsim v7404

#Logging all signals
log {/*}
#Adding wave {/*} to add all items from mux2to1
add wave {/*}

#Test Cases
force {pin1} 1
run 10ns

force {pin1} 0 
run 10ns
