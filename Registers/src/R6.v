module R6(d, data, clk, load, q);
	input d, data, clk, load;
	output reg q;
	
	always @ (posedge clk or posedge load)
	begin
		if (load)
		begin
			q <= data;
		end
		else
		begin
			q <= d;
		end
	end
endmodule
