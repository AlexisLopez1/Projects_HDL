module ToggleFF(T, clk, clr, Q);

	input T, clk, clr;
	output reg Q;
	
	always @(posedge clk) begin
		
		if(!clr) begin
			Q <= 1'b0;
		end
		else if (T) begin
			Q <= ~T;
		end
	end
	
endmodule
