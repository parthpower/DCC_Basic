####################################################
# Name: dc_script.tcl
# A standard script synthesize design in standard 
# (non-ultra) DC Compiler flow
####################################################

# Setup Libraries
source -verbose script/setup_lib.tcl

# Read VHDL File
read_file -format vhdl {RTL/seq_detect.vhd }

# Link Desing and the Libraries
link

# Applying Constraints
####################################################
source -verbose script/constraint.con

# TODO: Add/Compile Scan Chain
####################################################
####################################################

# TODO: Add/Compile Power Constraints
####################################################
####################################################

# Compile Design, Export netlist, and write reports.
####################################################
# Compile Design
compile

# Write netlist to ddc file and verilog file.
write -f ddc -o design_data/scanned.ddc
write -f verilog -o design_data/scanned.v

# Reports
report_timing > reports/seq_detect.rpt
report_constraint -verbose > reports/seq_detect.cons
####################################################
