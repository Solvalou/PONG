`ifndef _net_v_
`define _net_v_

`include "defines.v"

module net(clk, 256h, 4v, v_blank);
	input clk;
	input 256h, 4v;
	input v_blank;
	output net;

	reg net;

	always begin
		@(posedge 256h)
			net <= `TRUE;
		@((posedge clk) || 4v || v_blank)
			net <= `FALSE;
	end

endmodule

`endif
