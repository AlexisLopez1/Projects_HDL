module FSM_wrapper(
	input [1:0] SW,
	input [1:0] KEY,
	output [3:0] LEDR
);

	FSM(	.clk(KEY[0]), 
			.reset(SW[0]), 
			.w(SW[1]), 
			.z(LEDR[3:0])
		);

endmodule 