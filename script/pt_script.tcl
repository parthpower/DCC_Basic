# PrimeTime Run Script
####################################################

# Setup the tool
source -verbose script/setup_lib.tcl

# Read Netlist
# Make sure to use './' to refer current path.
# Excluding it will cause file not found error.
read_verilog ./design_data/$usr_design_name.v

# Link Design
link_design

# Setup Constraints
set clk_period 10
source -verbose script/pt_constraints.sdc

# Report Timing
report_timing > reports/pt_report_timing.rpt

# Must exit to make it work with CI
exit