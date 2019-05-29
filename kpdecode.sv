// FIle Name:	kpdecode.sv
// Description:	Module for BCIT ELEX 7660, Lab 2.
//				This module inputs kpc and kpr
//				and ouputs kphit which is high
//				only when a key is pressed on
//				the matrix keypad. 
//				kphit drives the ct[0] output to
//				turn on the least significant bit
//				of the LED display.
//				Will not function correctly if more
//				than one key is pressed at a time.
// Author:		Neil deHoog
// Date:		2018-01-19

module kpdecode	(input logic [3:0] kpc,
				input logic [3:0] kpr,
				input logic clk, reset_n,
				output logic kphit,
				output logic [3:0] num,
				output logic [3:0] num_const);

	always_comb begin
		// Selects the correct LED output
		// for a given row and column input
		unique case (kpr) // Active low
			4'b1110:	unique case (kpc) // Active low
							4'b1110: num = 13;
							4'b1101: num = 15;
							4'b1011: num = 0;
							4'b0111: num = 14;
							default: num = 99;
						endcase
						
			4'b1101:	unique case (kpc) // Active low
							4'b1110: num = 12;
							4'b1101: num = 9;
							4'b1011: num = 8;
							4'b0111: num = 7;
							default: num = 99;
						endcase
						
			4'b1011:	unique case (kpc) // Active low
							4'b1110: num = 11;
							4'b1101: num = 6;
							4'b1011: num = 5;
							4'b0111: num = 4;
							default: num = 99;
						endcase
						
			4'b0111:	unique case (kpc) // Active low
							4'b1110: num = 10;
							4'b1101: num = 3;
							4'b1011: num = 2;
							4'b0111: num = 1;
							default: num = 99;
						endcase
			
			default:	num = 99;
		endcase
		
		// Modifies kbhit based on if a key is 
		// being pressed or not
		if (kpr == 4'b1111)
			kphit = 0;
		else
			kphit = 1;
			
	end
	
	always_ff @(posedge clk) begin
		if (kphit)
			num_const <= num;
		else if (!reset_n)
			num_const <= 0;
		else
			num_const <= num_const;
	end
	
endmodule