
`timescale 10ps/1ps //`timescale <reference_time_unit>/<time_precision>
// Testbench del multiplexor 2x16
module TB_mux2x16();
// Inputs
    parameter WIDTH = 4; 
    reg[WIDTH-1:0] I0,I1,I2,I3;
    reg [1:0] Sel;
    integer s_gold, Num_errors;
    integer i, j, k, l, m;
// Outputs
    wire [WIDTH-1:0] s;
// Instanciacion del DUT
    mux4to1 UUT (.I0(I0), .I1(I1), .I2(I2), .I3(I3), .Sel(Sel), .Data_out(s));

// Inicialización de las entradas
    `ifdef auto_init
        initial begin
            i=0; j=0; k=0; l=0; m=0;
	    Sel=i; I0=j; I1=k; I2=l; I3=m;
	    #1;
        end
    `endif
initial #1000 $finish;
initial Num_errors = 0;

initial begin
for (i = 0; i <= 3; i = i + 1) begin
    for (j = 0; j <= 15; j = j + 1)begin
	for (k = 0; k <= 15; k = k + 1)begin
	    for (l = 0; l<= 15; l = l+1) begin
		for (m = 0; m<= 15; m = m+1) begin
	  		Sel=i; I0=j; I1=k; I2=l; I3=m;
	  			   		
			s_gold = (i == 1) ? k :
				 (i == 2) ? l :
				 (i == 3) ? m : j;
				 
			#1 if (s ^ s_gold) begin  // Observe el tiempo de espera
				Num_errors = Num_errors + 1;
				$display ("Error: select = %b", i);
				$display ("Error: I0 = %d   I1 = %d  I2 = %d  I3 = %d  Sel = %b", j, k, l, m, i);
				$display ("Error: Valor Esperado = %h  Valor obtenido = %h", s_gold, s);
			   end
		end
	    end
	end
    end
end
	$display ("Num_errors = %d", Num_errors);
end	  // end el initial begin
endmodule
