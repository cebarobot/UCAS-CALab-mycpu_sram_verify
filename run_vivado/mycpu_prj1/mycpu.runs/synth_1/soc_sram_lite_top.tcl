# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a200tfbg676-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/run_vivado/mycpu_prj1/mycpu.cache/wt [current_project]
set_property parent.project_path C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/run_vivado/mycpu_prj1/mycpu.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions disable [current_project]
add_files C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/soft/func_lab9/obj/inst_ram.coe
read_verilog C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/myCPU/mycpu.h
set_property file_type "Verilog Header" [get_files C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/myCPU/mycpu.h]
read_verilog -library xil_defaultlib {
  C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/myCPU/EXE_stage.v
  C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/myCPU/ID_stage.v
  C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/myCPU/IF_stage.v
  C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/myCPU/MEM_stage.v
  C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/myCPU/WB_stage.v
  C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/myCPU/alu.v
  C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/BRIDGE/bridge_1x2.v
  C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/CONFREG/confreg.v
  C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/myCPU/cp0.v
  C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/myCPU/mycpu_top.v
  C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/myCPU/pre_IF_stage.v
  C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/myCPU/regfile.v
  C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/ram_wrap/sram_wrap.v
  C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/myCPU/tools.v
  C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/soc_sram_lite_top.v
}
read_ip -quiet C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/xilinx_ip/signed_divider/signed_divider.xci
set_property used_in_implementation false [get_files -all c:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/xilinx_ip/signed_divider/signed_divider_ooc.xdc]

read_ip -quiet C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/xilinx_ip/unsigned_divider/unsigned_divider.xci
set_property used_in_implementation false [get_files -all c:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/xilinx_ip/unsigned_divider/unsigned_divider_ooc.xdc]

read_ip -quiet C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/xilinx_ip/clk_pll/clk_pll.xci
set_property used_in_implementation false [get_files -all c:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/xilinx_ip/clk_pll/clk_pll_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/xilinx_ip/clk_pll/clk_pll.xdc]
set_property used_in_implementation false [get_files -all c:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/xilinx_ip/clk_pll/clk_pll_ooc.xdc]

read_ip -quiet C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/xilinx_ip/data_ram/data_ram.xci
set_property used_in_implementation false [get_files -all c:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/xilinx_ip/data_ram/data_ram_ooc.xdc]

read_ip -quiet C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/xilinx_ip/inst_ram/inst_ram.xci
set_property used_in_implementation false [get_files -all c:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/rtl/xilinx_ip/inst_ram/inst_ram_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/run_vivado/soc_lite.xdc
set_property used_in_implementation false [get_files C:/Users/ceba_/Documents/working/verilog/CPU_CDE_SRAM/mycpu_sram_verify/run_vivado/soc_lite.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top soc_sram_lite_top -part xc7a200tfbg676-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef soc_sram_lite_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file soc_sram_lite_top_utilization_synth.rpt -pb soc_sram_lite_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
