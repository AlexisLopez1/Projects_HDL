module FSM (
	input clk, 
	input reset, 
	input w, 
	output [3:0] z
	);
	
	localparam 	A = 4'b0000, 
					B = 4'b0001, 
					C = 4'b0010, 
					D = 4'b0011, 
					E = 4'b0100, 
					F = 4'b0101, 
					G = 4'b0110, 
					H = 4'b0111, 
					I = 4'b1000;
	reg [4:0] 	state, next;
	
	assign z = state;
	
	always @(posedge clk or negedge reset) begin
		if (!reset) state <= A;
		else state <= next;
	end
	
	always @(*) begin
		case (state)
			A: next <= (w) ? F : B;
			B: next <= (w) ? F : C;
			C: next <= (w) ? F : D;
			D: next <= (w) ? F : E;
			E: next <= (w) ? F : E;
			F: next <= (w) ? G : B;
			G: next <= (w) ? H : B;
			H: next <= (w) ? I : B;
			I: next <= (w) ? I : B;
			default: next <= A;			
		endcase
	end
	
/* always @(w) begin
		if(!w)begin
			next <= 	(state == A) ? B :
						(state == B) ? C :
						(state == C) ? D :
						(state == D || state == E) ? E : 
						B;
		end
		else begin
			next <= 	(state == A) ? F :
						(state == F) ? G :
						(state == G) ? H :
						(state == H || state == I) ? I : 
						F; 
		end
	end */
	
endmodule 