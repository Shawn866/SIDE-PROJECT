transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {c:/quarters_ii_13_0/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {c:/quarters_ii_13_0/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {c:/quarters_ii_13_0/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {c:/quarters_ii_13_0/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {c:/quarters_ii_13_0/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cycloneive_ver
vmap cycloneive_ver ./verilog_libs/cycloneive_ver
vlog -vlog01compat -work cycloneive_ver {c:/quarters_ii_13_0/quartus/eda/sim_lib/cycloneive_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/FPGA_CODE/sobelll/quartus_prj/ip_core/ram_pic {E:/FPGA_CODE/sobelll/quartus_prj/ip_core/ram_pic/ram_pic.v}
vlog -vlog01compat -work work +incdir+E:/FPGA_CODE/sobelll/quartus_prj/ip_core/clk_gen {E:/FPGA_CODE/sobelll/quartus_prj/ip_core/clk_gen/clk_gen.v}
vlog -vlog01compat -work work +incdir+E:/FPGA_CODE/sobelll/rtl {E:/FPGA_CODE/sobelll/rtl/vga_pic.v}
vlog -vlog01compat -work work +incdir+E:/FPGA_CODE/sobelll/rtl {E:/FPGA_CODE/sobelll/rtl/vga_ctrl.v}
vlog -vlog01compat -work work +incdir+E:/FPGA_CODE/sobelll/rtl {E:/FPGA_CODE/sobelll/rtl/vga.v}
vlog -vlog01compat -work work +incdir+E:/FPGA_CODE/sobelll/rtl {E:/FPGA_CODE/sobelll/rtl/uart_tx.v}
vlog -vlog01compat -work work +incdir+E:/FPGA_CODE/sobelll/rtl {E:/FPGA_CODE/sobelll/rtl/uart_rx.v}
vlog -vlog01compat -work work +incdir+E:/FPGA_CODE/sobelll/rtl {E:/FPGA_CODE/sobelll/rtl/sobel.v}
vlog -vlog01compat -work work +incdir+E:/FPGA_CODE/sobelll/quartus_prj/ip_core/fifo {E:/FPGA_CODE/sobelll/quartus_prj/ip_core/fifo/fifo.v}
vlog -vlog01compat -work work +incdir+E:/FPGA_CODE/sobelll/rtl {E:/FPGA_CODE/sobelll/rtl/sobel_ctrl.v}
vlog -vlog01compat -work work +incdir+E:/FPGA_CODE/sobelll/quartus_prj/db {E:/FPGA_CODE/sobelll/quartus_prj/db/clk_gen_altpll.v}

vlog -vlog01compat -work work +incdir+E:/FPGA_CODE/sobelll/quartus_prj/../sim {E:/FPGA_CODE/sobelll/quartus_prj/../sim/tb_sobel.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_sobel

add wave *
view structure
view signals
run 1 us
