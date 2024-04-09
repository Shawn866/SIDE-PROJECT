#2011-6-8
#Makefile
# run the testcase
make run TCC=reg_cfg_00


# RTL =../rtl/DW_ahb/DW_ahb_wrapper.sv\
      ../rtl/DW_ahb/DW_ahb.v\
      ../rtl/sramc/sramc_wrapper.sv\
      ../rtl/sramc/sramc_top.v\
      ../rtl/sramc/sramc.v\
      ../rtl/sramc/sram_bank_top.v\
      ../rtl/sramc/sram_bank.v\
      ../rtl/sramc/sramc_cs.v\
      ../rtl/sramc/sramc_fsm.v\
      ../rtl/sramc/SRAM_DP_4KX8.v

RTL =-f rtl.f
TB  = ../tb/tb.sv
IF  = ../if/AHB_if.sv
#TC = ../tc/tcn_random_test.sv     
TC  = ../tc/tcn_reg_cfg.sv     
TCC =
#TC = ../tc/tcn_reg_test.sv     

#CMP_OP = -y /usr/synopsys/dc/2009-6/packages/gtech/src_ver \

# Need to modify 
CMP_OP = -y /eda_software/synopsys/syn/2012.06/packages/gtech/src_ver \
         +libext+.v \
	       -sverilog \
	       -debug_all \
	       -R -M \
				 +notimingcheck \
				 +nospecify \
	       -l sim.log
	 
SEED = 1

cov:	 
	 urg -dir ./simv.vdb\
	 urg -dir simv.vdb -format text

compile:
	vcs \
	$(TB) \
	$(IF) \
	$(RTL) \
	$(TC) \
	$(CMP_OP)

cp:
	cp ../tc/$(TCC).sv tcc.sv

run: cp compile

clean: 
	rm\
	 -rf csrc simv* vcdplus.vpd vcs.key urg* DVE* *.log ucli.key
