//Simple Counter

module counter_simple
#(parameter WIDTH =8)
(
	Enable,
	Clk,
	Clr,
	Q
);

	input Enable  ;
	input Clk, Clr ;
	output reg [WIDTH-1:0] Q;

	always @(negedge Clr, posedge Clk)
	begin
		if (Clr == 1'b0) 
			Q <= 0;		
		else if (Enable) 
			Q <= Q + 1;
	end
endmodule		
