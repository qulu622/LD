module UpCounter(A,clk,rst);

output reg[7:0] A;
input clk,rst;

always @ (posedge clk or negedge rst)
begin
  if ( !rst )
    A <= 8'd0;
  else
    begin
	if ( A < 8'd255)
	  A <= A + 8'd1;
	else
	  A <= A;
	end
end


endmodule