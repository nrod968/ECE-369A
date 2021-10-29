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
set_param chipscope.maxJobs 1
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.cache/wt} [current_project]
set_property parent.project_path {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {c:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_mem {
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/instruction_memory.mem}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/data_memory.mem}
}
read_verilog -library xil_defaultlib {
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/Datapath.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/ALU32Bit.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/ALUControl.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/Adder.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/Control.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/DataMemory.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/EXMEMReg.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/HiLoRegisters.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/IDEXReg.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/IFIDReg.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/MEMWBReg.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/Mux32Bit2To1.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/Mux32Bit4To1.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/ProgramCounter.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/RegisterFile.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/Shifter.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/SignExtension.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/InstructionMemory.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/CombLogicForBranching.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/PCAdder.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/SevenSegment.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/ClkDiv.v}
  {C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/ECE-369A/lab9-15/lab9-15.srcs/sources_1/new/Two4DigitDisplay.v}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/project_1/Resources/5-Two4DigitDisplay/Two4DigitDisplay.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/hayes/Desktop/Programming Projects/ECE 369A Projects/project_1/Resources/5-Two4DigitDisplay/Two4DigitDisplay.xdc}}]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top Datapath -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Datapath.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Datapath_utilization_synth.rpt -pb Datapath_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
