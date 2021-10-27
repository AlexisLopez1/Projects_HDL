module ALU (y, a, b, c_in, select);		 // ARITHMETIC UNIT
	output 	[3: 0] 	y;
	input		[1: 0]	a, b;
	input					c_in;
	input		[3: 0]	select;
	reg		[3: 0]	y;

	always @ (*)
		begin
			y= 4'b0;
			case ({select, c_in})
			5'b0000_0:	y = a;
			5'b0000_1:	y = a + 1'b1;
			5'b0001_0:	y = a + b;
			5'b0001_1:	y = a + b + 1'b1;
			5'b0010_0:	y = a + ~b;
			5'b0010_1:	y = a + (~b) + 1'b1;
			5'b0011_0:	y = a - 1'b1;
			5'b0011_1:	y = b;
			5'b0100_0:	y = a & b;
			5'b0101_0:	y = a | b;
			5'b0101_1: 	y = a ^ b;
			5'b0110_0:	y = ~a;
			5'b0111_0:	y = a << 1;
			5'b0111_1:	y = a >> 1;			// 16
			5'b1000_0:	y = 0;            // 24
			default:		y = 4'b0;
		endcase
	end
endmodule
