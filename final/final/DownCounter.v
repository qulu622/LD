module DownCounter(B,clk,rst);

output reg[7:0] B;
input clk,rst;

always @ (posedge clk or negedge rst)
begin
  if ( !rst )
    B <= 8'd255;
  else
    begin
	if ( B > 8'd0 )
	  B <= B - 8'd1;
	else
	  B <= B;
	end
end


endmodule