`timescale 10ps/1ps
module Counter_8b_TB();	

	reg T, clk, clr;
	wire [7:0] Q;
	integer i, errors;
	
	Counter_8b Counter(T, clk, clr, Q);
	
	initial errors = 0;
	initial begin
		clk = 1;
		clr = 0;
		T = 0;
		
		for(i = 0; i <= 15; i = i+1) begin
			#1 clk = ~clk;
			
			if (Q != i) begin
				errors = errors + 1;
				$display("*Error*		Expected: %8b		Obtained: %b", i, Q);
			end
		end
		
	end

endmodule 