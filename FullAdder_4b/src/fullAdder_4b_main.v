module fullAdder_4b_main(SW, HEX0, HEX1, HEX2);

	input [9:0] SW;
	output [6:0] HEX0, HEX1, HEX2;
	wire [3:0] a, b, sum, disp0;
	wire [4:0] result;
	wire cin, cout, mode;
	reg [4:0] dec, disp1, sub, final_result;
	reg [3:0]sign;
	assign a = SW[7:4];
	assign b = SW[3:0];
	assign cin = SW[8];
	assign mode = SW[9];
	
	fullAdder_4b(mode, cin, a, b, cout, sum);
	
	assign result = (mode == 0) ? sum : {cout, sum};
	
	always @(mode) begin
		if (mode == 0 && a<b) begin
				sub = (result == 15) ? 1:
							(result == 14) ? 2:
							(result == 13) ? 3:
							(result == 12) ? 4:
							(result == 11) ? 5:
							(result == 10) ? 6:
							(result == 9) ?  7:
							(result == 8) ?  8:
							(result == 7) ?  9:
							(result == 6) ? 10:
							(result == 5) ? 11:
							(result == 4) ? 12:
							(result == 3) ? 13:
							(result == 2) ? 14:
							(result == 1) ? 15: 0;
				final_result = sub;
				sign = 4'b1111;
		end
		else begin
				final_result = result;
				sign = 4'b1110;
		end
	end
	
	
	always @(final_result) begin
		if(result > 29)
			begin
				dec = 5'b11110;
				disp1 = 2'b11;
			end
		else if (final_result > 19)
			begin
				dec = 5'b10100;
				disp1 = 2'b10;
			end
		else if (final_result > 9)
			begin
				dec = 5'b01010;
				disp1 = 2'b01;
			end
		else
			begin
				dec = 5'b00000;
				disp1 = 2'b00;
			end
	end
	
	assign disp0 = final_result - dec;
	
	BCD_7seg(disp0, HEX0);
	BCD_7seg(disp1, HEX1);
	BCD_7seg(sign, HEX2);
	
endmodule
