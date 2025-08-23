vlib work
vlog RAM.v SPI.v SPI_WITH_RAM.v SPI_tb.v
vsim -voptargs=+acc work.SPI_tb
add wave *
add wave -position insertpoint  \
sim:/SPI_tb/SWS/M/tx_valid \
sim:/SPI_tb/SWS/M/rx_valid \
sim:/SPI_tb/SWS/M/mem \
sim:/SPI_tb/SWS/M/dout \
sim:/SPI_tb/SWS/M/addr
add wave -position insertpoint  \
sim:/SPI_tb/SWS/S/in_MOSI \
sim:/SPI_tb/SWS/S/cs \
sim:/SPI_tb/SWS/S/counter \
sim:/SPI_tb/SWS/S/check

run -all
#quit -sim