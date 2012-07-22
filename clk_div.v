`ifndef _clk_div_v_
`define _clk_div_v_

`include "defines.v"

module clk_div(mclk, clk);
	input mclk;
	output clk;

	reg clk = `FALSE;
	reg [1:0] cnt = 0;

	always@(posedge mclk) begin
		cnt = cnt + 1;
		if(!cnt)
			clk <= !clk;
	end

endmodule

`endif
