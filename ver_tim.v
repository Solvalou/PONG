`ifndef _ver_tim_v_
`define _ver_tim_v_

module ver_tim(clk, vreset, vblank, vsync,
		4v);

	input clk, reset;
	output vreset, vblank, vsync;

	reg [8:0] cnt = 0;
	reg vreset, vblank, vsync;

	wire 4v;
	assign 4v = cnt[2];

	always@(negedge clk) begin
		cnt <= cnt + 1;

		if(cnt == 261) begin
			cnt <= 9'b0;
			vreset <= 1'b1;
			vblank <= 1'b1;
		end

		else
			vreset <= 1'b0;
	end

	always@(cnt == 16)
		vblank <= 1'b0;

	always@(vblank && (cnt == 4))
		vsync <= 1'b1;
	always@(vblank && (cnt == 8))
		vsync <= 1'b0;

endmodule

`endif
