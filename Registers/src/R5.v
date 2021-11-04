module R5(d, clk, pre, q);
	input d, clk, pre;
	output reg q;
	
	always @ (posedge clk or posedge pre)
	begin
		if (pre)
		begin
			q <= 1'b1;
		end
		else
		begin
			q <= d;
		end
	end
endmodule
