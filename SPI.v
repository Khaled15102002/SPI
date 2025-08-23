module SPI (MISO, MOSI, SS_n, clk, rst_n, rx_data, rx_valid, tx_data, tx_valid);
parameter IDLE = 0, CHK_CMD = 1, WRITE = 2, READ_ADD = 3, READ_DATA = 4;
input [7:0] tx_data;
input SS_n, clk, rst_n, tx_valid, MOSI;
output reg [9:0] rx_data;
output reg rx_valid, MISO;
(* fsm_encoding = "one_hot" *)
reg [2:0] ns, cs;
reg check,in_MOSI;
reg [3:0]counter;
always @(*) begin
    case(cs)
    IDLE: 
    if(~SS_n)
    ns=CHK_CMD;
    else
    ns=IDLE;

    CHK_CMD: 
    if(SS_n==0 && in_MOSI==0)
    ns=WRITE;
    else if(SS_n==0 && in_MOSI==1 && check==0)
    ns=READ_ADD;
    else if(SS_n==0 && in_MOSI==1 && check==1)
    ns=READ_DATA;
    else 
    ns=IDLE;

    WRITE:
    if(SS_n)
    ns=IDLE;
    else
    ns=WRITE;

    READ_ADD:
    if(SS_n)
    ns=IDLE;
    else
    ns=READ_ADD;

    READ_DATA:
    if(SS_n)
    ns=IDLE;
    else
    ns=READ_DATA;

    default:ns=IDLE;

    endcase
    
end
always @(posedge clk) begin
    if(~rst_n)
    cs<=IDLE;
    else
    cs<=ns;
end
always @(*) begin
  if (~rst_n)
    in_MOSI<=0;
  else if (SS_n==0 && cs==CHK_CMD)
    in_MOSI<=MOSI;
end
always @(posedge clk)begin
    if(~rst_n) begin
        rx_data<=0;
        rx_valid<=0;
        MISO<=0;
        counter<=0;
        check<=0;
    end
    else if(SS_n==0 && cs==WRITE)begin
        if(counter==10)begin
        counter<=0;
    end
        else begin
        rx_data<={rx_data[8:0],MOSI};
        counter<=counter+1;
        if(counter==9)
         rx_valid<=1;
    end
    end
     else if(SS_n==0 && cs==READ_ADD)begin
        if(counter==10)begin
        counter<=0;
        check<=1;
    end
        else begin
        rx_data<={rx_data[8:0],MOSI};
        counter<=counter+1;
        if(counter==9)
         rx_valid<=1;
    end
    end
    else if(SS_n==0 && cs==READ_DATA && tx_valid==0)begin
        if(counter==10)begin
        counter<=0;
        check<=0;
    end
        else begin
        rx_data<={rx_data[8:0],MOSI};
        counter<=counter+1;
        if(counter==9)
         rx_valid<=1;

    end
    end
    else if(SS_n==0 && cs==READ_DATA && tx_valid==1)begin
        if(counter==8)begin
        counter<=0;
        check<=0;
    end
        else begin
        MISO<=tx_data[7-counter];
        counter<=counter+1;
    end
    end
    else if(cs==IDLE || cs==CHK_CMD)begin
    rx_valid<=0;
    end
end
endmodule