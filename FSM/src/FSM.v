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
		if (!reset) begin
			state <= A;
		end
		else state <= next;
	end
	
/*	always @(w) begin
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

	always @(w) begin
		next = 4'bxxxx;
		case (state)
			A: if(w) next <= F;
				else	 next <= B;
				
			B: if(w) next <= F;
				else 	 next <= C;
				
			C: if(w) next <= F;
				else 	 next <= D;
				
			D: if(w) next <= F;
				else 	 next <= E;
				
			E: if(w) next <= F;
				else 	 next <= E;
				
			F: if(w) next <= G;
				else 	next <= B;
				
			G: if(w) next <= H;
				else 	next <= B;
				
			H: if(w) next <= I;
				else 	next <= B;
				
			I:	if(w) next <= I;
				else 	next <= B;
			default: 
				next <= A;
		endcase
	end
	
endmodule 