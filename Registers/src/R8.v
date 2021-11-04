module R8(d, clk, clr, clk_enable, q);
	input d, clk, clr, clk_enable;
	output reg q;

	always @ (negedge clr or posedge clk)
	begin
		// Reset whenever the reset signal goes low, regardless of the clock
		// or the clock enable
		if (!clr)
		begin
			q <= 1'b0;
		end
		// If not resetting, and the clock signal is enabled on this register,
		// update the register output on the clock's rising edge
		else
		begin
			if (clk_enable)
			begin
				q <= d;
			end
		end
	end
endmodule
