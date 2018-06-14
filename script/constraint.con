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
