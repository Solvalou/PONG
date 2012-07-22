`include "defines.v"
`include "clk_div.v"
`include "hor_tim.v"
`include "ver_tim.v"
`include "net.v"
`include "ball_h.v"
`include "ball_v.v"

module main(mclk);

	input mclk;

	output vga_hsync, vga_vsync;
	output vga_video;

	wire clk;

	// horizontal signals
	wire hreset, hblank, hsync;

	wire nhreset, nhblank, nhsync;
	assign nhreset = !hreset;
	assign nhblank = !hblank;
	assign nhsync = !hsync;

	wire 256h;

	// vertical signals
	wire vreset, vblank, vsync;

	wire nvreset, nvblank, nvsync;
	assign nvreset = !vreset;
	assign nvblank = !vblank;
	assign nvsync = !vsync;

	wire 4v;

	clk_div clk_div(.mclk(mclk), .clk(clk));
	hor_tim hor_tim(.clk(clk), .hreset(hreset), .hblank(hblank), .hsync(hsync), .256h(256h));
	ver_tim ver_tim(.clk(clk), .vreset(vreset), .vblank(vblank), .vsync(hsync), .4v(4v));
	net net(.clk(clk), .256h(256h), .4v(4v), .v_blank(v_blank));

endmodule
