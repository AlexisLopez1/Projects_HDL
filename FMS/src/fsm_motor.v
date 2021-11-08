module fsm_motor
#(parameter N=4)
(red_led, green_led, signal_main_motor,signal_motor,button, clk, rst_n,selected_motor);

output reg red_led, green_led, signal_main_motor;
output reg [N-1:0] signal_motor;
input button, clk, rst_n;
input [1:0] selected_motor;

localparam [1:0] SLEEP    = 2'b00,
					 DECISION = 2'b01,
					 DELAY1   = 2'b10,
					 DELAY2   = 2'b11;
localparam [1:0] option1  = 2'b01,
                option2  = 2'b10,
					 option3  = 2'b11;
reg [1:0] state, next;
reg dly_finished;

always @(posedge clk or negedge rst_n)
if (!rst_n) state <= SLEEP;
else state <= next;
always @(state) begin
next = 2'bx; signal_main_motor = 1'b0; signal_motor = 4'b0;
case (state)
SLEEP : if (button) next = DECISION;
else next = SLEEP;
DECISION:
	begin
		next = DELAY1;
		signal_main_motor = 1'b1; signal_motor = 4'b0; //signal_motor(selected_motor) = 1'b1;
		case (selected_motor)
			option1 : signal_motor = 4'b0001;
			option2 : signal_motor = 4'b0010;
			option3 : signal_motor = 4'b0100;
		endcase
	end
DELAY1:
if (dly_finished)
	begin
		next = DELAY2;
		signal_main_motor = 1'b0;
	end
else next = DELAY1;
DELAY2:
if (dly_finished)
	begin
		next = SLEEP;
		case (selected_motor)
			option1 : signal_motor = ! (4'b0001);
			option2 : signal_motor = ! (4'b0010);
			option3 : signal_motor = ! (4'b0100);
		endcase
	end
else next = DELAY2;
endcase
end
endmodule