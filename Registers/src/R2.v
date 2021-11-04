module R2 (d, clk, q);
	input d, clk;
	output reg q;
	
	always @ (negedge clk)
	begin
		q <= d;
	end
	
endmodule
