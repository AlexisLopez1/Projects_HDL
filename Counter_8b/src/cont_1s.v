/*-- Contador de un Segundo para utilizar la señal de reloj
-- de la tarjeta Intel de 50 MHz
-- El circuito es configurable empleando el valor de CUENTA
-- UTILIZA DOS PROCESOS
-- P0: Realiza el conteo hasta llegar a CUENTA y genera un RCO
-- P1: Con RCO se habilita un flip-flop que conmuta de estado (toggle)
-- de manera sincrona. El RCO opera como señal de habilitacion
*/

module cont_1s
	(
		input mclk, reset,
		output reg SEGUNDO
		//output integer conteo,
		//output RCO
  	);

  localparam CUENTA= 25000000; // 32b'00000001011111010111100001000000
  integer conteo;
  wire w1; 
  always@ (negedge reset, posedge mclk)
	begin
	   if (reset == 1'b0 ) conteo <= 0;
	   else
				if (conteo == CUENTA) conteo <=0; //opcion 1
				//if (~|(conteo ^ CUENTA)) conteo <=0; //opcion 2
				else conteo <= conteo + 1;
		end
	assign w1 = (conteo == CUENTA) ? 1'b1 : 1'b0 ; //opcion 1	
	//assign w1 = ~|(conteo ^ CUENTA) ? 1'b1 : 1'b0 ;	//opcion 2
	
	
	always@(negedge reset, posedge mclk)
	begin
		if(reset == 1'b0) SEGUNDO <= 1'b0;
		else 
			if (w1) SEGUNDO <= ~(SEGUNDO);
			else    SEGUNDO <= SEGUNDO;
	end
	
	//assign RCO = w1;  // Ripple Carry Output
	
	endmodule
	