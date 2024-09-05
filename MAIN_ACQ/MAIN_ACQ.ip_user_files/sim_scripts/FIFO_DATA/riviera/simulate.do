onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+FIFO_DATA -L xilinx_vip -L xpm -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.FIFO_DATA xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {FIFO_DATA.udo}

run -all

endsim

quit -force
