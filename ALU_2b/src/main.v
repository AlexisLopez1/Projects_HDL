module main (SW, LEDR);
	input [8:0]SW;
	output [9:0] LEDR;
	assign LEDR[9:4] = 1'b0;
	ALU(LEDR[3:0], SW[3:2], SW[1:0], SW[8], SW[7:4]);

endmodule
