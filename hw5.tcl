restart
add_force clk {0 0ns} {1 10ns} -repeat_every 20ns

add_force LOAD {1 0ns}
add_force A {0000 0ns}
add_force UpD {0 0ns}
add_force ENT {1 0ns}
run 100ns

add_force LOAD {0 0ns}
add_force A {1101 0ns}
add_force UpD {1 0ns}
add_force ENT {0 0ns}
add_force ENP {0 0ns}
run 20ns

add_force LOAD {1 0ns}
run 92ns

add_force ENT {1 0ns}
run 23ns

add_force UpD {0 0ns}
run 23ns

add_force ENT {0 0ns}
run 122ns