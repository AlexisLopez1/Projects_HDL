module Counter_8b(T, clk, clr, Q);

	input T, clk, clr;
	output reg [4:0] Q;
	
	always @(posedge clk) begin
		run (T, clk, clr, Q);
	end
	
	task run;
		input T_in, clk_in, clr_in;
		output reg [3:0] Q_out;
		begin
			ToggleFF Q3(T_in, clk_in, clr_in, Q_out[3]);
			ToggleFF Q2((Q_out[3]&T_in), clk_in, clr_in, Q_out[2]);
			ToggleFF Q1((Q_out[2]&Q_out[3]), clk_in, clr_in, Q_out[1]);
			ToggleFF Q0((Q_out[1]&Q_out[2]), clk_in, clr_in, Q_out[0]);
		end
	endtask
		
//		ToggleFF Q7(T, clk, clr, Q[7]);
//		ToggleFF Q6((Q[7]&T), clk, clr, Q[6]);
//		ToggleFF Q5((Q[6]&Q[7]), clk, clr, Q[5]);
//		ToggleFF Q4((Q[5]&Q[6]), clk, clr, Q[4]);
//		ToggleFF Q3((Q[4]&Q[5]), clk, clr, Q[3]);
//		ToggleFF Q2((Q[3]&Q[4]), clk, clr, Q[2]);
//		ToggleFF Q1((Q[2]&Q[3]), clk, clr, Q[1]);
//		ToggleFF Q0((Q[1]&Q[2]), clk, clr, Q[0]);
	
	//always begin
		//clk = 1'b0;
		//#1;
		//clk = 1'b1;
		//#1
	//end
endmodule
