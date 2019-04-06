`timescale 1ns/1ns
module FA(a, b, c, cout, sum);

    input a, b, c;
    output cout, sum;

    wire tmp;


    assign tmp = a^b;
    assign sum = tmp^c;
    assign cout = (tmp&c)|(a&b);

endmodule

