module ToggleFF(T, clk, clr, Q);

	input T, clk, clr;
	output reg Q;
	
	always @(posedge clk) begin
		
		if(clr == 1'b0) begin
			Q <= 1'b0;
		end
		else begin
			case(T)
				1'b0: begin
					Q <= Q;
				end
				1'b1: begin
					Q <= ~Q;
				end
			endcase
		end
	end
	
endmodule
