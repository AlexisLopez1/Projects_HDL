module R9(d, data, clk, clr, clr_s, load, load_s, clk_enable, q);
   parameter LEN = 2;
	input [LEN-1:0] d, data;
	input clk, clr, clr_s, load, load_s, clk_enable;
	output reg [LEN-1:0] q;
	
	always @ (negedge clr or posedge load or posedge clk)
	begin
		if (!clr)
		begin
			q <= {{LEN}{1'b0}};
		end
		else if (load)
		begin
			q <= data;
		end
		else
		begin
			if (clk_enable)
			begin
				if (!clr_s)
				begin
					q <= {{LEN}{1'b0}};
				end
				else if (load_s)
				begin
					q <= data;
				end
				else
				begin
					q <= d;
				end
			end
		end
	end	
endmodule
