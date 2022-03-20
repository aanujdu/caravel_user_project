
set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

set script_dir [file dirname [file normalize [info script]]]
# Design
set ::env(DESIGN_NAME) "picorv32a"

# Since hardening a macro, design is not core
set ::env(DESIGN_IS_CORE) 0 

set ::env(VERILOG_FILES) "\
	$script_dir/../../verilog/rtl/picorv32a/picorv32a.v"

set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_NET) $::env(CLOCK_PORT)

#set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) {1}

set ::env(CLOCK_PERIOD) "100"
#set ::env(SYNTH_MAX_FANOUT) 6
set ::env(FP_CORE_UTIL) 35
set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)+5) / 100.0 ]
set ::env(ROUTING_CORES) 8
#set ::env(RT_MAX_LAYER) {met4}

#set ::env(VDD_NETS) [list {vccd1}]
#set ::env(GND_NETS) [list {vssd1}]

#set ::env(DIODE_INSERTION_STRATEGY) 4 
# If you're going to use multiple power domains, then disable cvc run.
#set ::env(RUN_CVC) 1

#set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
#if { [file exists $filename] == 1} {
#	source $filename
#}
