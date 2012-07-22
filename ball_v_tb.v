`include "ball_v.v"

module ball_v_tb();
	reg nhsync, nvblank;
	reg [3:0] v_velocity;
	wire v_vid;

	ball_v ball_v(nhsync, nvblank, v_velocity, v_vid);

	initial 
	begin
		nhsync = 0;
		nvblank = 1;
		v_velocity = 15;

     	$dumpfile("ball_v_tb.vcd");
     	$dumpvars;
     	#10000 $finish;
    end

    always 
    	#1 nhsync = !nhsync;
endmodule