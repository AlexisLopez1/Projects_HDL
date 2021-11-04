module Counter_8b(T, clk, clr, Q);

	input T, clk, clr;
	output [7:0] Q;
	
	ToggleFF Q7(T, clk, clr, Q[7]);
	ToggleFF Q6((Q[7]&T), clk, clr, Q[6]);
	ToggleFF Q5((Q[6]&Q[7]), clk, clr, Q[5]);
	ToggleFF Q4((Q[5]&Q[6]), clk, clr, Q[4]);
	ToggleFF Q3((Q[4]&Q[5]), clk, clr, Q[3]);
	ToggleFF Q2((Q[3]&Q[4]), clk, clr, Q[2]);
	ToggleFF Q1((Q[2]&Q[3]), clk, clr, Q[1]);
	ToggleFF Q0((Q[1]&Q[2]), clk, clr, Q[0]);
	
endmodule
