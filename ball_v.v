`ifndef _ball_v_
`define _ball_v_

`include "defines.v"

module ball_v(nhsync, nvblank, v_velocity, v_vid);
	input [3:0] v_velocity;
	input nhsync, nvblank;
	output v_vid;

	reg v_vid = 0;
	reg [7:0] cnt = 0;

	always@((posedge nhsync) && nvblank) begin
		cnt = cnt + 1;
		case(cnt)
			252: v_vid = `TRUE;
			256: v_vid = `FALSE;
			0: cnt = {4'b0, v_velocity};
		endcase
	end

endmodule

`endif
