connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Nexys4DDR 210292645531A" && level==0} -index 0
fpga -file /afs/athena.mit.edu/user/n/k/nkk/fpga_6115/HFT/ethernet/ethernet.sdk/design_1_wrapper_hw_platform_0/design_1_wrapper.bit
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys4DDR 210292645531A"} -index 0
rst -system
after 3000
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys4DDR 210292645531A"} -index 0
dow /afs/athena.mit.edu/user/n/k/nkk/fpga_6115/HFT/ethernet/ethernet.sdk/axi_stream/Debug/axi_stream.elf
bpadd -addr &main
