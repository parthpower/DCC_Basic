all:
	mkdir design_data
	mkdir reports
	dc_shell -f script/dc_script.tcl
clean:
	rm -rf reports/ design_data/
	