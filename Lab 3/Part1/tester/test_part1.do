#Setting working dir
vlib work

#Compiling Verilog
vlog test1.v

#Loading simulation using part1 as the top level simulation module
vsim test1

#Logging all signals
log {/*}
#Adding wave {/*} to add all items from mux2to1
add wave {/*}

#Test Cases
#Case 1
#Settin input values
force {MuxSelect[0]} 1
force {MuxSelect[1]} 1
force {MuxSelect[2]} 1
force {Input[0]} 1
force {Input[1]} 0
force {Input[2]} 0
force {Input[3]} 0
force {Input[4]} 0
force {Input[5]} 0
force {Input[6]} 0
run 10ns


force {MuxSelect[0]} 0
force {MuxSelect[1]} 1
force {MuxSelect[2]} 1
force {Input[0]} 1
force {Input[1]} 0
force {Input[2]} 0
force {Input[3]} 0
force {Input[4]} 0
force {Input[5]} 0
force {Input[6]} 0
run 10ns
