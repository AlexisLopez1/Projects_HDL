/* Multiplexor 4x1 with behavioral architecture */

module mux4to1(I0, I1, I2, I3, Sel, Data_out);

   input [3:0] I0, I1, I2, I3;
   input [1:0] Sel;
   output [3:0] Data_out;
   reg [3:0] Data_out;

   // constant declaration
   parameter S0 = 2'b00;
   parameter S1 = 2'b01;
   parameter S2 = 2'b10;
   parameter S3 = 2'b11;

   always @ (*)
   begin
      case(Sel)
         S0: begin
            Data_out = I0;
         end
         S1: begin
            Data_out = I1;
         end
         S2: begin
            Data_out = I2;
         end
         S3: begin
            Data_out = I3;
         end
       endcase
   end
endmodule