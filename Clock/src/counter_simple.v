//Simple Counter

module counter_simple
#(parameter WIDTH =8)
(
	Enable,
	Clk,
	Clr,
	Q,
	Q1,
	Q2,
	Q3,
	Q4,
	Q5
);

	input Enable  ;
	input Clk, Clr ;
	output reg [WIDTH-1:0] Q, Q1, Q2, Q3, Q4, Q5;
	reg [WIDTH-1:0] i;

	always @(negedge Clr, posedge Clk)
	begin
		if (Clr == 1'b0) begin
			Q <= 0;	
		end
//		else if (Q == 4'b1010) begin
//			Q <= 0;
//		end
		else if (Enable) begin
			Q <= Q + 1;
			if(Q == 4'b1001) begin
				Q <= 0;
				Q1 <= Q1 + 1;
				
				if(Q1 == 4'b0101) begin
					Q1 <= 0;
					Q2 <= Q2 + 1;
					
					if(Q2 == 4'b1001) begin
						Q2 <= 0;
						Q3 <= Q3 + 1;
						
						if(Q3 == 4'b0101) begin
							Q3 <= 0;
							Q4 <= Q4 + 1;
							
							if(Q4 == 4'b1001) begin
								Q4 <= 0;
								Q5 <= Q5 + 1;
								
								if(Q5 == 4'b0101) begin
									Q5 <= 0;
								end
							end
						end
					end
				end
					
			end
		end
	end
	
//		always @(negedge Clr, Q, posedge Clk)
//	begin
//		if (Clr == 1'b0) begin
//			Q1 <= 0;	
//		end
//		else if (Q == 3'b101) begin
//			Q1 <= 0;
//		end
//		else if (Enable) begin
//			Q1 <= Q1 + 1;
//		end
//	end
endmodule		
