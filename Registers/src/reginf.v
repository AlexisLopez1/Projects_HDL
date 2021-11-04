// The example below shows seven processes to infer registers that are controlled by asynchronous clear, preset, and load signals
module reginf (d, clk, clr, pre, load, data, clock_enable, synch_reset, synch_load,
              q1, q2, q3, q4, q5, q6, q7, q8, q9, q10);
				  
   input      d, clk, clr, pre, load, data, clock_enable, synch_reset, synch_load;
   output     q1, q2, q3, q4, q5, q6, q7, q8, q9, q10;
   reg        q1, q2, q3, q4, q5, q6, q7, q8, q9, q10;
    // Register with active-high clock
   always @ (posedge clk)
      q1 <= d;
    // Register with active-low clock
   always @ (negedge clk)
      q2 <= d;
		
    // Register with active-high clock & asynchronous clear
   always @ (posedge clk or posedge clr) begin
      if (clr)
         q3 <= 0;
      else
         q3 <= d;
   end
    // Register with active-low clock & asynchronous clear
   always @ (negedge clk or negedge clr) begin
      if (!clr)
         q4 <= 0;
      else
         q4 <= d;
   end
    // Register with active-high clock & asynchronous preset
   always @ (posedge clk or posedge pre) begin
      if (pre)
         q5 <= 1;
      else
         q5 <= d;
   end
    // Register with active-high clock & asynchronous load
   always @(posedge clk or posedge load) begin
      if (load)
         q6 <= data;
      else
         q6 <= d;
   end
    // Register with active-high clock & asynchronous clear & preset
   always @ (posedge clk or posedge clr or posedge pre) begin
      if (clr)
         q7 <= 0;
      else if (pre)
         q7 <= 1;
      else
         q7 <= d;
   end
	
//=============================================================
	always @ (negedge clr or posedge clk)
	begin
		// Reset whenever the reset signal goes low, regardless of the clock
		// or the clock enable
		if (!clr)
		begin
			q8 <= 1'b0;
		end
		// If not resetting, and the clock signal is enabled on this register,
		// update the register output on the clock's rising edge
		else
		begin
			if (clock_enable)
			begin
				q8 <= d;
			end
		end
	end

//===========================================================
always @ (negedge clr or posedge load or posedge clk)
begin
	// The asynchronous reset signal has highest priority
	if (!clr)
	begin
		q9 <= 1'b0;
	end
	// Asynchronous load has next priority
	else if (load)
	begin
		q9 <= data;
	end
	else
	begin
		// At a clock edge, if asynchronous signals have not taken priority,
		// respond to the appropriate synchronous signal.
		// Check for synchronous reset, then synchronous load.
		// If none of these takes precedence, update the register output 
		// to be the register input.
		if (clock_enable)
		begin
			if (!synch_reset)
			begin
				q9 <= 1'b0;
			end
			else if (synch_load)
			begin
				q9 <= data;
			end
			else
			begin
				q9 <= d;
			end
		end
	end
end

always @ (negedge clr or posedge load or posedge clk)
begin
	// The asynchronous reset signal has highest priority
	if (!clr)
	begin
		q10 <= 1'b0;
	end
	// Asynchronous load has next priority
	else if (load)
	begin
		q10 <= data;
	end
	else
	begin

		if (!synch_reset)
		begin
			q10 <= 1'b0;
		end
		else if (clock_enable)
			begin
				if (synch_load)
				begin
					q10 <= data;
				end
				else
				begin
					q10 <= d;
				end
			end	
	end
end

endmodule

/* In the previous example, all seven processes are sensitive only to changes on the control signals--i.e., clk, clr, pre, and load.

As defined in the Event Control, the first two Always Constructs detect changes on the clk signal only. Because clk is not used in the rest of the Always Construct, it is used as the clock for the register the Compiler creates. The first process waits for a rising clk edge (i.e., posedge clk) and assigns the value d to the signal q1. The second process waits for a falling clk edge (i.e., negedge clk) and assigns the value d to q2.

The remaining five Always Constructs detect changes on the clk signal and on one or more asynchronous control signals. These Always Constructs also use Conditional ("If-Else") Statements to give the asynchronous controls priority over the clk signal. This prioritization ensures that the asynchronous control signal is implemented as an asynchronous control of the D flipflop, rather than as logic connected to the D input of the flipflop.

The third and fourth Always Constructs detect changes in the clk and clr control signals and give the clr signal the higher priority. The circuit waits for an event on clk or clr, then sets q3 and q4 to 0 if clr is 1 or 0, respectively. Otherwise, the circuit sets either q3 or q4 to the value d, depending on whether a posedge clk activated the third Always Construct, or a negedge clk activated the fourth Always Construct.

The fifth Always Construct is sensitive to clk and pre. The circuit waits for an event on clk or pre, then sets q5 to 1 if pre is 1. Otherwise, the circuit sets q5 to d.

The sixth Always Construct is sensitive to clk or load. The circuit waits for an event on either of these signals, then sets q6 to data if load is 1. Otherwise, the circuit sets q6 to d.

The seventh Always Construct is sensitive to clk, clr, and pre. The circuit waits for an event on any of these signals, then sets q7 to 0 if clr is 1 or to 1 if pre is 1. Otherwise, the circuit sets q7 to d.
*/