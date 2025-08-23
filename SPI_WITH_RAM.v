module SPI_With_SPR(MOSI,MISO,SS_n,clk,rst_n);
input MOSI,SS_n,clk,rst_n;
output MISO;
wire [9:0] rx_data;
wire [7:0] tx_data;
wire tx_valid,rx_valid;
RAM M(rx_data, rx_valid, clk, rst_n, tx_data, tx_valid);
SPI S(MISO, MOSI, SS_n, clk, rst_n, rx_data, rx_valid, tx_data, tx_valid);
endmodule