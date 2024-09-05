onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+fifo_generator_1 -L xilinx_vip -L xpm -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.fifo_generator_1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {fifo_generator_1.udo}

run -all

endsim

quit -force
