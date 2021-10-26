module TB_RA8();  // Testbench aplicado al sumador de 8 bits
reg [7:0] a,b;
reg c_in;
wire [7:0] sum;
wire c_out;

// Instanciacion del DUT
RA8 UUT (.sum(sum), .c_out(c_out), .a(a), .b(b), .c_in(c_in));

task check_sum;
input i,j,k,c_out,sum; // i,j,k operandos para la suma
integer i,j,k,sum_gold;
reg c_out;
reg [7:0] sum;

begin
	sum_gold = i+j + k; // Obtener el valor de referencia
	if ({c_out,sum} != sum_gold) begin
		$display($time,"Error: i=%d, j=%d, esperado %d (%8b), obtenido %d (%8b)",
		i, j, sum_gold, sum_gold, sum, sum); $stop(1); 
	end
end
endtask

initial begin : TB // Comienza la prueba
	integer i, j, k; // i y j representan los operandos
	k=1; //k representa el carry_in
	for (i=0; i<=255; i=i+1)
		for (j=0; j<=255; j=j+1)
			begin
// Configuracion de parametros para el DUT
				a = i; b = j; c_in= k; // ojo c_in= 1'b0;  
				#10;// Esperar 10 ns, luego checar el resultado
				check_sum (i,j,k,c_out,sum);
			end
	//$stop(1);	// Termina la prueba
end
endmodule
