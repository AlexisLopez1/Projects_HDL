//
// inputs:
// KEY0: manual clock
// SW0: active low reset
// SW1: enable signal for the counter
//
// outputs:
//	HEX0: hex segment display
module counter_wrapper (SW, KEY, HEX1, HEX0, LEDR);
	input [1:0] SW ;
	input [0:0] KEY ;
	output [0:6] HEX1, HEX0;
	//////////// LED //////////
	output		     [9:0]		LEDR;
	
	parameter WIDTH = 8;
	wire Clock = KEY[0];
	wire Resetn = SW[0];
	wire Enable = SW[1];
	// 4-bit counter based on T-flip flops
	wire [WIDTH-1:0] Count;

	// Counter Instantiation
	counter_FFT # (.WIDTH(WIDTH)) counter (.Enable(Enable), .Clk(Clock), .Clr(Resetn), .Q(Count));
	// counter_simple # (.WIDTH(WIDTH)) counter (.Enable(Enable), .Clk(Clock), .Clr(Resetn), .Q(Count)); // Option 2
	
	// drive the displays
	hex7seg digit1 (Count[3:0], HEX0);
	hex7seg digit0 (Count[7:4], HEX1);
	// drive the LEDs
	assign LEDR ={Count,SW};
endmodule

