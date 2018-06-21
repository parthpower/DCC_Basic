# Setup the libraries and environment variables
####################################################
# Set design name
# Using `usr_` prefix on user variables to avoid 
# conflicts with system variables
set usr_design_name "seq_detect"
# Set Search Path
set search_path "$search_path ref/models/"
# Set Target Library and Link Library
set target_library "saed90nm_typ.db"
set link_library "* saed90nm_typ.db"
####################################################
