`ifndef _ball_h_
`define _ball_h_

`include "defines.v"

module ball_h(clk, nblank, h_velocity, h_vid);
	input clk, nhblank;
	input [1:0] h_velocity;
	output h_vid;

	reg h_vid;
	reg [8:0] cnt;

	always@((posedge clk) && bhblank) begin
		cnt = cnt + 1;
		case(cnt)
			508: h_vid = `TRUE;
			512: h_vid = `FALSE;
			0: cnt = {7'b0, h_velocity};
		endcase
	end
	
endmodule

`endif
