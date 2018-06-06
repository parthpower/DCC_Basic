####################################################
# Name: dc_script.tcl
# Date: 06/05/2018
# A standard script synthesize design in standard 
# (non-ultra) DC Compiler flow
####################################################

# Setup the libraries
####################################################
# Set Search Path
set search_path "$search_path ../ref/models/"
# Set Target Library and Link Library
set target_library "saed90nm_typ.db"
set link_library "* saed90nm_typ.db"
####################################################

# Read VHDL File
read_file -format vhdl {RTL/seq_detect.vhd }

# Link Desing and the Libraries
link

# Applying Constraints
####################################################
# Create Clock
create_clock -period 10 -name my_clk [get_ports clk]

# Set Input Dealy for All Inputs but the Clock
# You can write command in multiple lines using '\' character
# [remove_from_collection [all_inputs] [get_ports clk]] means all inputs except the clock

set_input_delay 2 -max -clock my_clk \
   [remove_from_collection [all_inputs] [get_ports clk]]

# Set Output Delay to All Outputs
set_output_delay 2 -max -clock my_clk [all_outputs]

# saed90nm_typ has the operating condition TYPICAL
set_operating_conditions  TYPICAL

# Set driving cells.
# Register all inputs except the clock.
#FIXIT: Gives error that no pins found for "Q"
set_driving_cell -lib_cell NBUFFX2  -pin Q \
    [remove_from_collection [all_inputs] [get_ports clk]]

# Set maximum capacitance of all inputs.
set_max_capacitance [expr [load_of saed90nm_typ/AND2X1/IN1] * 5] \
    [remove_from_collection [all_inputs] [get_ports clk]]

set_load [expr 3 * [expr [load_of saed90nm_typ/AND2X1/IN1] * 5]] [all_outputs]
####################################################

#TODO: Add/Compile Scan Chain
####################################################
####################################################

#TODO: Add/Compile Power Constraints
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
