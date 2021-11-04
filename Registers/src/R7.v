module R7(d, clk, clr, pre, q);
	input d, clk, clr, pre;
	output reg q;
	
	   always @ (posedge clk or posedge clr or posedge pre) begin
      if (clr)
		begin
			q <= 0;
		end
      else if (pre)
		begin
			q <= 1;
		end
      else
		begin
			q <= d;
		end
   end
endmodule
