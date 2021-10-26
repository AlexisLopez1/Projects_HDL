module comp_4b (SW, LEDR);
	input [7:0] SW;
	output [1:0] LEDR;
	wire [1:0] result;
	
	comparator(SW[7:4], SW[3:0], result);
	show_result(result, LEDR);
	
endmodule


module comparator(A, B, out);

	input [3:0] A, B;
	output [1:0] out;
	
	assign out = (A == B) ? 2'b11 : (A > B) ? 2'b10 : (A < B) ? 2'b01 : 2'b00;//comp(A, B);
	
//	function comp;
//		input [3:0] A, B;
//		begin
//			comp = (A == B) ? 2'b11 : (A > B) ? 2'b10 : (A < B) ? 2'b01 : 2'b00;
//		end
//	endfunction

endmodule


module show_result(result, led);
	
	input [1:0] result;
	output [1:0] led;
	
	assign led = result;

endmodule
