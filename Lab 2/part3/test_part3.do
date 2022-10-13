#Setting working dir
vlib work

#Compiling Verilog
vlog part3.v

#Loading simulation using mux2to1 as the top level simulation module
vsim hexdecoder

#Logging all signals
log {/*}
#Adding wave {/*} to add all items from mux2to1
add wave {/*}

#Test Cases
#0
force {c[3]} 0
force {c[2]} 0
force {c[1]} 0
force {c[0]} 0
run 10ns

#1
force {c[3]} 0
force {c[2]} 0
force {c[1]} 0
force {c[0]} 1
run 10ns

#2
force {c[3]} 0
force {c[2]} 0
force {c[1]} 1
force {c[0]} 0
run 10ns

#3
force {c[3]} 0
force {c[2]} 0
force {c[1]} 1
force {c[0]} 1
run 10ns

#4
force {c[3]} 0
force {c[2]} 1
force {c[1]} 0
force {c[0]} 0
run 10ns

#5
force {c[3]} 0
force {c[2]} 1
force {c[1]} 0
force {c[0]} 1
run 10ns

#6
force {c[3]} 0
force {c[2]} 1
force {c[1]} 1
force {c[0]} 0
run 10ns

#7
force {c[3]} 0
force {c[2]} 1
force {c[1]} 1
force {c[0]} 1
run 10ns

#8
force {c[3]} 1
force {c[2]} 0
force {c[1]} 0
force {c[0]} 0
run 10ns

#9
force {c[3]} 1
force {c[2]} 0
force {c[1]} 0
force {c[0]} 1
run 10ns

#A
force {c[3]} 1
force {c[2]} 0
force {c[1]} 1
force {c[0]} 0
run 10ns

#b
force {c[3]} 1
force {c[2]} 0
force {c[1]} 1
force {c[0]} 1
run 10ns

#C
force {c[3]} 1
force {c[2]} 1
force {c[1]} 0
force {c[0]} 0
run 10ns

#d
force {c[3]} 1
force {c[2]} 1
force {c[1]} 0
force {c[0]} 1
run 10ns

#E
force {c[3]} 1
force {c[2]} 1
force {c[1]} 1
force {c[0]} 0
run 10ns

#F
force {c[3]} 1
force {c[2]} 1
force {c[1]} 1
force {c[0]} 1
run 10ns