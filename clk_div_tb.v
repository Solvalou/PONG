`include "clk_div.v"

module ckl_div_tb();
	reg mclk;
	wire clk;

	clk_div clk_div(.mclk(mclk), .clk(clk));

	initial 
	begin
		mclk = 0;

     	$dumpfile("clk_div_tb.vcd");
     	$dumpvars;
     	#10000 $finish;
    end

    always 
    	#1 mclk = !mclk;
endmodule