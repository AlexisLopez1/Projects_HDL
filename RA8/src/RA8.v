module RA8 (sum, c_out, a, b, c_in);
  output [7:0] 	sum;
  output 		c_out;
  input 	[7:0] 	a, b;
  input  		c_in;
  wire 		c_in4,  c_out;
  //wire c_in8, c_in12;
  FA4 M1 	(sum[3:0], 	c_in4, 	a[3:0], 		b[3:0], 		c_in);
  FA4 M2 	(sum[7:4], 	c_out, 	a[7:4], 		b[7:4], 		c_in4);
//  FA4 M3 	(sum[11:8], 	c_in12, 	a[11:8], 		b[11:8], 		c_in8);
//  FA4 M4	(sum[15:12],	c_out,	a[15:12],		b[15:12], 	c_in12);
endmodule
