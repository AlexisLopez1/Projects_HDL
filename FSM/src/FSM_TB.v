`timescale 10ps/1ps
module FSM_TB();
	
	reg clk;
	reg reset; 
	reg jump;
	wire [3:0] state;
	integer i;
	
	FSM fsm(.clk(clk), .reset(reset), .w(jump), .z(state));
	
	initial begin
		clk = 1;
		reset = 0;
		
		for(i = 0; i <= 4; i = i+1) begin
			#1 clk = ~clk;
				reset = 1;
				jump = 0;		
			
			$display("w = %b	z = %b", jump, state);		
		end	
		
		for(i = 0; i <= 4; i = i+1) begin
			#1 clk = ~clk;
				reset = 1;
				jump = 1;	
	
			$display("w = %b	z = %b", jump, state);	
		end	
		
		for(i = 0; i <= 4; i = i+1) begin
			#1 clk = ~clk;
				reset = 1;
				jump = ~jump;	
	
			$display("w = %b	z = %b", jump, state);	
		end
	
	end

endmodule 