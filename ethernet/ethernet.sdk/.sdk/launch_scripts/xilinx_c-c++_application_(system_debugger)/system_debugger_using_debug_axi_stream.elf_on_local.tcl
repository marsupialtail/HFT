connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Nexys4DDR 210292645636A" && level==0} -index 0
fpga -file /afs/athena.mit.edu/user/n/k/nkk/fpga_6115/HFT/ethernet/ethernet.sdk/design_1_wrapper_hw_platform_1/design_1_wrapper.bit
configparams mdm-detect-bscan-mask 2
bpadd -addr &main
