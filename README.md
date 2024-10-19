# HOW TO RUN
1. Detect the board you have plugged into your computer
    1. quartus_pgm -l
    2. quartus_pgm --auto

2. Create and compile the project which outputs a .sof file
    1. quartus_sh -t prj.tcl

3. FPGA programing which downloads a binary *.sof file
    1. quartus_pgm -m JTAG -o "p;cntled.sof@1"
