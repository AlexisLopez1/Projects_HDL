`timescale 10ps/1ps
module R9_TB();
	parameter LEN = 2;
	reg [LEN-1:0] d, data;
	reg clk, clr, clr_s, load, load_s, clk_enable;
	wire [LEN-1:0] q;
	
	R9 register (d, data, clk, clr, clr_s, load, load_s, clk_enable, q);
	
	initial begin
	
		clr = 0;
		clr_s = 0;
		load = 0;
		load_s = 0;
		clk_enable = 0;
		data = 0;
		d = 0;
		
		fork
		//Default: q = 0 ? clr == 0
		// Case 2 Async: q = data ? clr != 0 && load == 1
		#5 clr = 1;
		#5 load = 1;
		#5 data = 2'b01;
		
		//Case 3 Sync: q = q-1 ? clk_enable == 0
		#10 load = 0;
		
		//Case 4 Sync: q = 0 ? ckl_enable == 1 && clr_s == 0
		#15 clk_enable = 1;
		
		//Case 5 Sync: q = data ? ckl_enable == 1 && clr_s == 1 && load_s == 1
		#20 clr_s = 1;
		#20 load_s = 1;
		#20 data = 2'b10;
		
		//Case 6 Sync: q = d ? ckl_enable == 1 && clr_s == 1 && load_s == 0
		#25 load_s = 0;
		#25 d = 2'b11;
		join
		
	end
	

		
	always begin
		clk = 1'b0;
		#1;
		clk = 1'b1;
		#1;
	end
	
endmodule
