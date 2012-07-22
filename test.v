`include "hsync.v"
`include "vsync.v"

module test;
	reg clk, reset;
	wire hreset, hblank, hsync;
	wire vreset, vblank, vsync;
	hsync h1(reset, clk, hreset, hblank, hsync);
	vsync v1(reset, hreset, vreset, vblank, vsync);

	initial 
	begin
		clk = 0;
		#1 reset = 0;
		#1 reset = 1;
		#1;

     	$dumpfile("test.vcd");
     	$dumpvars(0,test);
    end

	always 
		#1 clk = !clk;

	initial
		#1000000 $finish;

endmodule