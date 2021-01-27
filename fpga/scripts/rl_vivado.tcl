set project $::env(DESIGN_NAME)
set DESIGN_NAME $::env(DESIGN_NAME)
set RTL ..
set CONSTRS scripts


# detect board
if [info exists ::env(BOARD)] {
    set BOARD $::env(BOARD)
} else {
    puts "Please execute 'source ../sourceme.sh first before you start vivado in order to setup necessary environment variables."
    exit
}
if [info exists ::env(XILINX_BOARD)] {
    set XILINX_BOARD $::env(XILINX_BOARD)
}

# create project
create_project $project . -force -part $::env(XILINX_PART)
set_property board_part $XILINX_BOARD [current_project]

# set up meaningfull errors
source scripts/messages.tcl


# Add toplevel wrapper
add_files -norecurse $RTL/${DESIGN_NAME}.v

# set pulpissimo as top
set_property top ${DESIGN_NAME} [current_fileset]; #

# needed only if used in batch mode
update_compile_order -fileset sources_1

# Add constraints
add_files -fileset constrs_1 -norecurse $CONSTRS/${DESIGN_NAME}.xdc

# Elaborate design
synth_design -rtl -name rtl_1 -sfcu;# sfcu -> run synthesis in single file compilation unit mode



# launch synthesis
set_property STEPS.SYNTH_DESIGN.ARGS.FLATTEN_HIERARCHY none [get_runs synth_1]
set_property -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS} -value -sfcu -objects [get_runs synth_1] ;# Use single file compilation unit mode to prevent issues with import pkg::* statements in the codebase
launch_runs synth_1 -jobs 8
wait_on_run synth_1
open_run synth_1 -name netlist_1
set_property needs_refresh false [get_runs synth_1]


# Launch Implementation

# set for RuntimeOptimized implementation
set_property "steps.opt_design.args.directive" "RuntimeOptimized" [get_runs impl_1]
set_property "steps.place_design.args.directive" "RuntimeOptimized" [get_runs impl_1]
set_property "steps.route_design.args.directive" "RuntimeOptimized" [get_runs impl_1]

set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
#set_property config_mode SPIx4 [current_design]

launch_runs impl_1 -jobs 8
wait_on_run impl_1
#launch_runs impl_1 -to_step route_design
#launch_runs impl_1 -to_step write_bitstream
#wait_on_run impl_1

open_run impl_1

# Generate reports
exec mkdir -p reports/
exec rm -rf reports/*
check_timing                                                              -file reports/${project}.check_timing.rpt
report_timing -max_paths 100 -nworst 100 -delay_type max -sort_by slack   -file reports/${project}.timing_WORST_100.rpt
report_timing -nworst 1 -delay_type max -sort_by group                    -file reports/${project}.timing.rpt
report_utilization -hierarchical -file reports/${project}.utilization.rpt
exit
