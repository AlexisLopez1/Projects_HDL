module R4(d, clk, clr, q);
	input d, clk, clr;
	output reg q;
	
	always @ (negedge clr or negedge clk)
	begin
		if (!clr)
		begin
			q <= 1'b0;
		end
		else
		begin
			q <= d;
		end
	end
endmodule
