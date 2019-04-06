`timescale 1ns/1ns

module TM;

parameter	WIDTH = 8;
parameter	bit_width = 256;


reg		clk, rst;
wire	[WIDTH-1:0] s;
wire 	cout;


mid_10227115 mid(clk,rst,cout,s);


//*********************************
//      control signal
//*********************************
parameter   t   = 25;
parameter   th  = t*0.5;
always #th clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
	#th rst = 0;
	#th rst = 1;
    #(t*300)
    $stop;
end

endmodule
