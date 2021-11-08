module ToggleFF(T, Clk, Clr, Q);

	input T, Clk, Clr;
	output reg Q;
	
	always @(posedge Clk) begin
		
		if(Clr == 1'b0) begin
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
