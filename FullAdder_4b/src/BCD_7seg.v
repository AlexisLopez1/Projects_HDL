module BCD_7seg(sw, hex);

	input  [3:0] sw;
	output [6:0] hex;

	wire [3:0] BCD;
	reg  [6:0] SEG;

	assign BCD = sw;
	assign hex = SEG;

	always @(BCD)
	begin
	case (BCD)
		 4'b0001 : SEG = 7'b1111001;   //1
		 4'b0010 : SEG = 7'b0100100;   //2
		 4'b0011 : SEG = 7'b0110000;   //3
		 4'b0100 : SEG = 7'b0011001;   //4
		 4'b0101 : SEG = 7'b0010010;   //5
		 4'b0110 : SEG = 7'b0000010;   //6
		 4'b0111 : SEG = 7'b1111000;   //7
		 4'b1000 : SEG = 7'b0000000;   //8
		 4'b1001 : SEG = 7'b0010000;   //9
		 4'b1111 : SEG = 7'b0111111;	 //-
		 4'b1110 : SEG = 7'b1111111;	 //-
		 default : SEG = 7'b1000000;   //0
	 endcase
	end
 
endmodule
