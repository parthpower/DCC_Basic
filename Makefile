all: dc pt

dc:
	mkdir -p design_data
	mkdir -p reports
	dc_shell -f script/dc_script.tcl |tee dc.log

pt: dc 
	pt_shell -f script/pt_script.tcl |tee pt.log

clean:
	rm -rf reports/ design_data/
	