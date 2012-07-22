`ifndef _hor_tim_v_
`define _hor_tim_v_

module hor_tim(clk, hreset, hblank, hsync,
		256h);

	input clk;
	output hreset, hblank, hsync;

	reg hreset, hblank, hsync;
	reg [8:0] cnt = 0;

	wire 256h;
	assign 256h = cnt[7];

	always@(negedge clk) begin
		if (!hreset)
			cnt = cnt + 1;
		hsync = (hblank && cnt[5]);
	end

	always@(posedge clk)
	begin
		if(cnt == 454) begin
			cnt <= 9'b0;
			hreset <= 1'b1;
			hblank <= 1'b1;
		end
		else
			hreset <= 1'b0;

		if(cnt == 80)
			hblank <= 1'b0;
	end

endmodule
`endif
