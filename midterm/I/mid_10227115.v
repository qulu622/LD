module mid_10227115(clk,rst,cout,s);
  input clk,rst;
  wire [7:0] A,B;
  wire [7:0] tmpA,tmpB;
  wire sel;
  output cout;
  output [7:0] s;

  UpCounter up(A,clk,rst);
  DownCounter down(B,clk,rst);
  Add_Sub_10227115 ad(A,B,sel,s,cout,clk);
  
  assign sel = A[7];
  
endmodule