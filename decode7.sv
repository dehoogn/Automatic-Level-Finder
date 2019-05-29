// FIle Name:	decode7.sv
// Description:	Module for BCIT ELEX 7660, Lab 2.
//				Converts a 4-bit input into 7 active low
//				outputs. These outputs are used to 
//				power LEDs on a 7 segment display.
// Author:		Neil deHoog
// Date:		2018-01-19

module decode7	(input logic [3:0] num_const,
				output logic [7:0] leds);

	always_comb begin
		unique case (num_const) // Segments are active low 
			0: leds = 8'b1100_0000; // Segments for a 0
			1: leds = 8'b1111_1001; // Segments for a 1
			2: leds = 8'b1010_0100; // Segments for a 2
			3: leds = 8'b1011_0000; // Segments for a 3
			4: leds = 8'b1001_1001; // Segments for a 4
			5: leds = 8'b1001_0010; // Segments for a 5
			6: leds = 8'b1000_0010; // Segments for a 6
			7: leds = 8'b1111_1000; // Segments for a 7
			8: leds = 8'b1000_0000; // Segments for a 8
			9: leds = 8'b1001_0000; // Segments for a 9
			10: leds = 8'b1000_1000; // Segments for a A
			11: leds = 8'b1000_0011; // Segments for a B
			12: leds = 8'b1100_0110; // Segments for a C
			13: leds = 8'b1010_0001; // Segments for a D
			14: leds = 8'b1000_0110; // Segments for an E
			15: leds = 8'b1000_1110; // Segments for a F
			default: leds = 8'b1100_0000; // Defaut is 0
		endcase
	end
   
endmodule

