module SPI_tb();
reg MOSI,SS_n,clk,rst_n;
wire MISO;
SPI_With_SPR SWS(MOSI,MISO,SS_n,clk,rst_n);
initial begin
    clk=0;
    forever 
    #1 clk=~clk;
end
initial begin
    $readmemh("mem.dat",SWS.M.mem);
    rst_n=0;
    MOSI=1;
    @(negedge clk);
    rst_n=1;
    SS_n=0;
    @(negedge clk);
    //Test write address 
    MOSI=0;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=0;
    @(negedge clk); 
    MOSI=1;
    @(negedge clk);  
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=1;
    @(negedge clk); 
    @(negedge clk);     
    
    SS_n=1;
    @(negedge clk);
    //Test write data 
    SS_n=0;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=1;
    @(negedge clk); 
    MOSI=1;
    @(negedge clk);  
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);  
    @(negedge clk);

    SS_n=1;
    @(negedge clk);
    SS_n=0;
    @(negedge clk);
    //Test write address 
    MOSI=0;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=0;
    @(negedge clk); 
    MOSI=1;
    @(negedge clk);  
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=1;
    @(negedge clk); 
    @(negedge clk);     
    
    SS_n=1;
    @(negedge clk);
    //Test write data 
    SS_n=0;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=1;
    @(negedge clk); 
    MOSI=1;
    @(negedge clk);  
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);  
    @(negedge clk);

    SS_n=1;
    @(negedge clk);
    //Test read address
    SS_n=0;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=0;
    @(negedge clk); 
    MOSI=1;
    @(negedge clk);  
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);  
    @(negedge clk);

    SS_n=1;
    @(negedge clk);
    //Test read data
    SS_n=0;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk); 
    MOSI=1;
    @(negedge clk);  
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=1;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=0;
    @(negedge clk);
    MOSI=1;
    @(negedge clk); 
    @(negedge clk); 
    
    repeat(9)@(negedge clk);
    SS_n=1;
    @(negedge clk); 
    @(negedge clk); 
    $stop;

end
endmodule
