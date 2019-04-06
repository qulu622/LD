`timescale 1ns/1ns


module Add_Sub_10227115(a, b, sel, s, cout,clk);
    input [7:0] a,b;
    input sel,clk;
    
	wire [6:0] c;
    wire [7:0] b_tmp;
// pipeline use
	wire cout_new;	
	wire [7:0] s_new;
// type your design here -- Version I
	output reg cout;
    output reg[7:0] s;
	

    assign b_tmp[0] = b[0]^sel;
    assign b_tmp[1] = b[1]^sel;
    assign b_tmp[2] = b[2]^sel;
    assign b_tmp[3] = b[3]^sel;
	assign b_tmp[4] = b[4]^sel;
	assign b_tmp[5] = b[5]^sel;
	assign b_tmp[6] = b[6]^sel;
	assign b_tmp[7] = b[7]^sel;
	

    FA fa0(a[0], b_tmp[0], sel, c[0], s_new[0]);
    FA fa1(a[1], b_tmp[1], c[0], c[1], s_new[1]);
    FA fa2(a[2], b_tmp[2], c[1], c[2], s_new[2]);
	FA fa3(a[3], b_tmp[3], c[2], c[3], s_new[3]);
	FA fa4(a[4], b_tmp[4], c[3], c[4], s_new[4]);
	FA fa5(a[5], b_tmp[5], c[4], c[5], s_new[5]);
	FA fa6(a[6], b_tmp[6], c[5], c[6], s_new[6]);
    FA fa7(a[7], b_tmp[7], c[6], cout_new, s_new[7]);

	always @(posedge clk)
	begin
		s <= s_new;
		cout <= cout_new;
	end	

endmodule

