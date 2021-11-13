`timescale 10ps/1ps
module FSM_TB();
	
	reg clk;
	reg reset; 
	reg w;
	wire [3:0] z;
	integer i;
	
	FSM fsm(.clk(clk), .reset(reset), .w(w), .z(z));
	
	initial begin
		clk = 0;
		reset = 1;
		
			
		for(i = 0; i <= 15; i = i+1) begin
			#1 clk = ~clk;
			w = 0;	
			if (clk == 1) 			
			$display("w = %b	z = %b", w, z);		
		end	
		
		
		for(i = 0; i <= 15; i = i+1) begin
			#1 clk = ~clk;
			w = 1;
			if (clk == 1)	
			$display("w = %b	z = %b", w, z);	
		end		
	end

endmodule 