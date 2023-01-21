transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Apparatus/GTU/Year4/CSE331/hw4_bonus/src {C:/Apparatus/GTU/Year4/CSE331/hw4_bonus/src/cypher_detect.v}
vlog -vlog01compat -work work +incdir+C:/Apparatus/GTU/Year4/CSE331/hw4_bonus/src {C:/Apparatus/GTU/Year4/CSE331/hw4_bonus/src/datapath.v}
vlog -vlog01compat -work work +incdir+C:/Apparatus/GTU/Year4/CSE331/hw4_bonus/src {C:/Apparatus/GTU/Year4/CSE331/hw4_bonus/src/control.v}

