module RAM (din, rx_valid, clk, rst_n, dout, tx_valid);
parameter MEM_WIDTH = 8, MEM_DEPTH = 256, ADDR_SIZE = 8;
input [9:0]din;
input rx_valid, clk, rst_n;
output reg [7:0]dout;
output reg tx_valid;
reg [MEM_WIDTH-1:0] mem [MEM_DEPTH-1:0];
reg [ADDR_SIZE-1:0] addr;
integer i;
always @(posedge clk) begin
    if(~rst_n)begin
    dout<=0;
    tx_valid<=0;
    addr<=0;
    end
    else begin
        if(rx_valid)begin
        tx_valid<=0;
        case(din[9:8])

        0:addr<=din[7:0];

        1:mem[addr]<=din[7:0];

        2:addr<=din[7:0];
        
        3:begin dout<=mem[addr]; tx_valid<=1;end 
        default:tx_valid<=0;   
        endcase
        end
        end
    end
endmodule

