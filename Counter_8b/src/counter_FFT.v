module counter_FFT (Enable, Clk, Clr, Q);
   parameter WIDTH =4;
   input Enable  ;
	input Clk, Clr ;
	output [WIDTH-1:0] Q;
	
	

	
	// 4-bit counter based on T-flip flops
	wire [0: WIDTH] En;
   wire [WIDTH-1:0] Count;
	assign En[0]= Enable;
	
	genvar i;

generate
	for(i=0;i<=WIDTH-1; i = i + 1) begin: Counter
      
		ToggleFF
		tff
		(   //T, Clk, Resetn, Q
			// Input Ports
			.T(En[i]),
			.Clk(Clk),
			.Resetn(Clr),
			
			// Output Ports
			.Q(Count[i])

		);
		assign En[i+1] = Count[i] & En[i];
	end
endgenerate
	
	
	assign Q = Count;
	
	
	endmodule
	