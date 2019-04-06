module mid_10227115_II(clk,rst,cout,s);
  input clk,rst;
  wire [7:0] A,B;
  wire [7:0] tmpA,tmpB;
  wire sel;
  output cout;
  output [7:0] s;

  UpCounter up(A,clk,rst);
  DownCounter down(B,clk,rst);
  Add_Sub_10227115 ad(tmpA,tmpB,sel,s,cout,clk);
  
  assign sel = A[7];
  assign tmpA = ( A < 8'd128 )? A:B;
  assign tmpB = ( A < 8'd128 )? B:A;
  
endmodule