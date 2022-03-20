
############################################################
# A good configuration to start with based on documentation
# and some perusing configs of some available designs 
# References: user_proj_example, picorv32a, Matt Venn's repo
############################################################

# Not sure is the following two options are compulsory
# Just copied them from the user_proj_example to be safe
set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"
######################################################

#Setting script_dir to be path where config.tcl resides
set script_dir [file dirname [file normalize [info script]]]
######################################################


# Compulsory options (not including these will mostly result in a trivial config error)
set ::env(DESIGN_NAME) "picorv32a"
set ::env(VERILOG_FILES) "$script_dir/../../verilog/rtl/picorv32a/picorv32a.v"
set ::env(CLOCK_PERIOD) "100"
set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_NET) $::env(CLOCK_PORT)
######################################################

#Good to have options--speeds up the run
set ::env(ROUTING_CORES) 12
set ::env(RUN_KLAYOUT_XOR) 0
set ::env(RUN_KLAYOUT_DRC) 0
######################################################

# Since hardening a macro, 
# Design is not core, no core ring, cant use met5
# Compulsory options for a macro
#set ::env(DESIGN_IS_CORE) 0
#set ::env(FP_PDN_CORE_RING) 0
#set ::env(RT_MAX_LAYER) "met4"
######################################################

#### The rest of the options are mostly determined by trial and error ####

# Since picorv32a is already available in OpenLane repository
# I have simply copied the config options from there
#set ::env(SYNTH_MAX_FANOUT) 6
#set ::env(FP_CORE_UTIL) 35
#set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)+5) / 100.0 ]
#set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) {1}
# Some justification on the FP flags. picorv32a is not really a tiny design
#https://github.com/The-OpenROAD-Project/OpenLane/blob/master/docs/source/hardening_macros.md#global-placement
# Above URL states "if your design is not a tiny design, 
#then PL_TARGET_DENSITY should have a value that is FP_CORE_UTIL + 1~5%
######################################################

# Adding the following since I have specified the power pins
# in the RTL under USE_POWER_PINS define
# Helps in GLSIMs as well I guess
# And of course in routing the power rails
#set ::env(VDD_NETS) [list {vccd1}]
#set ::env(GND_NETS) [list {vssd1}]
######################################################



#set ::env(DIODE_INSERTION_STRATEGY) 4 
# If you're going to use multiple power domains, then disable cvc run.
#set ::env(RUN_CVC) 1

#set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
#if { [file exists $filename] == 1} {
#	source $filename
#}
