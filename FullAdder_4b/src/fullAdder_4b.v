module fullAdder_4b(mode, cin, a, b, cout, sum);

	input [3:0] a, b;
	input cin, mode;
	output [4:0] sum;
	output cout;
	wire [4:0] _b;
	wire c1, c2, c3;
	
	assign _b = (mode == 0) ? ~b + 4'b0001 : b;
	
	fullAdder S0(cin, a[0], _b[0], c1, sum[0]);
	fullAdder S1(c1, a[1], _b[1], c2, sum[1]);
	fullAdder S2(c2, a[2], _b[2], c3, sum[2]);
	fullAdder S3(c3, a[3], _b[3], cout, sum[3]);

endmodule