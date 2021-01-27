## simple constraint for evaluation

create_clock -period 12.5 -name clk [get_ports clock]
create_clock -period 12.5 -name virtual_clk
set_false_path -from [get_ports reset]

group_path -name INPUT -from [all_inputs] -to [all_clocks]
group_path -name OUTPUT -from [all_outputs] -to [all_clocks]
group_path -name COMBO -from [all_inputs] -to [all_outputs]

set_property CFGBVS GND         [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
