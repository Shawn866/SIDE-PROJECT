all: clean compile simulate

compile:
	vcs \
	-sverilog \
	-debug_all \
	-l com.log \
	-f file.lst 

simulate:
	./simv -l sim.log 

clean:
	@rm -rf csrc DVEfiles simv simv.daidir ucli.key VCS*
	@rm -rf *.log *.vpd *.ddc *.svf *.SDF *Synth *Netlist* work vsim* transcript
