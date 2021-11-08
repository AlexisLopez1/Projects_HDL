/*Think Before You Code

We are going to extend the sequential counter to implement 
a Gray code sequence rather than a simple linear increment.
The sequence we will implement is as follows:
  	
Nth Step after Reset (in binary) 	Gray Code
000 	000
001 	001
010 	011
011 	010
100 	110
101 	111
110 	101
111 	100

which yields the following always block for a Gray code counter, derived directly from the above truth table:
*/
module gray_counter( clk, reset,UD, qgray );
input        clk;
input        reset;
input			 UD;
output [2:0] qgray;
reg    [2:0] q;

// FINITE STATE MACHINE DESCRIPTION

always @(negedge reset or posedge clk)
  if (~reset)
    q <= 0;
  else
	if (UD==1)
	begin
    case (q)
      3'b000:  q <= 3'b001;
      3'b001:  q <= 3'b011;
      3'b011:  q <= 3'b010;
      3'b010:  q <= 3'b110;
      3'b110:  q <= 3'b111;
      3'b111:  q <= 3'b101;
      3'b101:  q <= 3'b100;
      3'b100:  q <= 3'b000;
      default: q <= 3'bx;
    endcase
	 end
	 else
	 begin
		 case (q)
      3'b000:  q <= 3'b100;
      3'b001:  q <= 3'b000;
      3'b011:  q <= 3'b001;
      3'b010:  q <= 3'b011;
      3'b110:  q <= 3'b010;
      3'b111:  q <= 3'b110;
      3'b101:  q <= 3'b111;
      3'b100:  q <= 3'b101;
      default: q <= 3'bx;
		endcase
	  end
	 
	 assign qgray = q;
	 endmodule
/*

// BEHAVIORAL DESCRIPTION
always @(negedge reset or posedge clk)
  if (~reset)
    q <= 0;
  else
  if (UD==1)
    q <= q + 1;
	 else
	 q <= q - 1;

assign qgray = {q[3], ^q[3:2], ^q[2:1], ^q[1:0]};

endmodule
*/