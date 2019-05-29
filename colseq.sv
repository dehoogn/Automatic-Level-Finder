// FIle Name:	colseq.sv
// Description:	Module for BCIT ELEX 7660, Lab 2.
//				This module has a 4-bit output that
//				drives a matrix keypads columns 
//				and has a 4-bit input which takes
//				the input from the matrix keypads
//				rows 
// Author:		Neil deHoog
// Date:		2018-01-19

module colseq	(input logic [3:0] kpr,
				input logic clk, 
				input logic reset_n,
				output logic [3:0] kpc);
				
	logic [3:0] kpc_next;
	
	always_comb begin
		
		// Check for a reset press
		if(!reset_n)
			kpc_next = 4'b0111;
		
		// Hold the current column if any rows are low
		else if (kpr != 4'b1111)
			kpc_next = kpc;
			
		// Change the low column to the next in sequence
		else 
			case(kpc)
				4'b0111: kpc_next = 4'b1011;
				4'b1011: kpc_next = 4'b1101;
				4'b1101: kpc_next = 4'b1110;
				4'b1110: kpc_next = 4'b0111;
				default: kpc_next = 4'b0111;
			endcase
	end 
	
	always @(posedge clk) begin
		kpc <= kpc_next;
	end

endmodule