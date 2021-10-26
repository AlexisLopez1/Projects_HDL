//====== OPTION 2 =============================
module FullAdder_4b_TB(); 
reg [3:0] a,b;
reg cin, mode;
wire [4:0] sum;
wire cout;

// DUT instance
fullAdder_4b UUT (.mode(mode), .cin(cin), .a(a), .b(b), .cout(cout), .sum(sum));

task check_sum;
input i,j,k,cout,sum,m; 					
integer i,j,k;
reg [4:0] sum_gold;
reg cout;
reg [4:0] sum;

begin
	sum_gold = (m == 1) ? i+j+k : i-j+k;

	if ({cout,sum} != sum_gold) begin
		$display($time,"Error: i=%d, j=%d, esperado %d (%5b), obtenido %d (%5b)",
		i, j, sum_gold, sum_gold, sum, sum); $stop(1); 
	end
end
endtask


// ========== Start simulation ======================================
initial begin : TB 						
	integer i, j, k, m; 					
	k=0; 
	for (m=0; m<=1; m=m+1) 										
		for (i=0; i<=15; i=i+1)
			for (j=0; j<=15; j=j+1)
				begin
					a = i; b = j; cin= k; mode = m;
					#10;
					check_sum (i,j,k,cout,sum,m);
				end
							
end
endmodule


//====== OPTION 1 ================================
//module FullAdder_4b_TB(); 
//reg [3:0] a,b;
//reg cin, mode;
//wire [4:0] sum;
//wire cout;
//
//// DUT instance
//fullAdder_4b UUT (.mode(mode), .cin(cin), .a(a), .b(b), .cout(cout), .sum(sum));
//
//// ============ Task for SUM ===========================================
//task check_sum;
//input i,j,k,cout,sum,m; 					
//integer i,j,k,sum_gold;
//reg cout;
//reg [4:0] sum;
//
//begin
//	sum_gold = i+j+k;
//	if ({cout,sum} != sum_gold) begin
//		$display($time,"Error: i=%d, j=%d, esperado %d (%5b), obtenido %d (%5b)",
//		i, j, sum_gold, sum_gold, sum, sum); $stop(1); 
//	end
//end
//endtask
//
//// ============ Task for SUB ===========================================
//task check_sub;
//input i,j,k,cout,sum,m; 					
//integer i,j,k,sum_gold;
//reg cout;
//reg [4:0] sum;
//
//begin
//	sum_gold = i-j+k;
//	if ({cout,sum} != sum_gold) begin
//		$display($time,"Error: i=%d, j=%d, esperado %d (%5b), obtenido %d (%5b)",
//		i, j, sum_gold, sum_gold, sum, sum); $stop(1); 
//	end
//end
//endtask
//// ========== Start simulation ======================================
//initial begin : TB 						
//	integer i, j, k, m; 	
//	k = 0; 
//	
//	//SUM
//	m = 1; 										
//		for (i=0; i<=15; i=i+1)
//			for (j=0; j<=15; j=j+1)
//				begin
//					a = i; b = j; cin= k; mode = m;
//					#10;
//					check_sum (i,j,k,cout,sum,m);
//				end
//	//SUB
//	m = 0;
//		for (i=0; i<=15; i=i+1)
//			for (j=0; j<=15; j=j+1)
//				begin
//					a = i; b = j; cin= k; mode = m;
//					#10;
//					check_sub (i,j,k,cout,sum,m);
//				end
//							
//end
//endmodule



