`ifdef DATA_PGK_SV
	`define DATA_PGK_SV
package data_pgk;

`ifdef STRUCTURES
	typedef integer 		SEL;
	typedef enum logic [2**SEL-1]{data[]}