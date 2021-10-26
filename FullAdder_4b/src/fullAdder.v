module fullAdder(cin, a, b, cout, sum);

	input cin, a, b;
	output cout, sum;
	
	assign sum = a^b^cin;
	assign cout = (a&b)|(a&cin)|(b&cin);

endmodule
