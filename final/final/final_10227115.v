module final_10227115(cout,s,clk_src,rst_clk,rst,wren,rden,clk1,clk2,locked,mem_dout);
  wire [7:0] A,B;
  wire sel;
  // pipeline use
  wire cout_tmp;	
  wire [7:0] s_tmp;
  output reg cout;
  output reg [7:0] s;
  
  output [7:0] mem_dout;
  input clk_src,rst_clk,rst,wren,rden;
  output clk1,clk2;
  output locked;
  wire clk_40MHz,clk_80MHz;
  wire locked;
  wire [7:0] dout;

  //Counter U_Counter(.dout(dout),.clk(clk_40MHz),.rst(rst),.en(en),.up(up));
  pll U_pll(.areset(~rst_clk),.inclk0(clk_src),.c0(clk_40MHz),.c1(clk_80MHz),.locked(locked));

  assign clk1 = clk_40MHz;
  assign clk2 = clk_80MHz;

  mem U_mem(.clock(clk_40MHz),.data(dout),.rdaddress(dout),.rden(rden),.wraddress(dout),.wren(wren),.q(mem_dout));

  always @(posedge clk_40MHz)
  begin
	s <= s_tmp;
	cout <= cout_tmp;
  end	

  UpCounter up(A,clk_40MHz,rst);
  DownCounter down(B,clk_40MHz,rst);
  Add_Sub_10227115 ad(A,B,sel,s_tmp,cout_tmp,clk_40MHz);
  
  assign sel = A[7];
  assign dout = s;
  
endmodule