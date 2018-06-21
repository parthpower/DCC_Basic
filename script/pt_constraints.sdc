# Timing Constraints for PrimeTime
# clk_period must be set before calling this script
####################################################

set timing_all_clocks_propagated true
create_clock -name clk -period $clk_period [get_port clk]
set_clock_uncertainty 0.5 [all_clocks]
set_clock_latency -min 3.5 [get_clocks clk]
set_clock_latency -max 5.5 [get_clocks clk]
set_clock_transition -min 0.25 [get_clocks clk]
set_clock_transition -max 0.30 [get_clocks clk]
