// FIle Name:	optics.sv
// Description:	Module for Fish
//				Takes the output of the infrared proximity sensor 
//				and assigns it to a stored variable
// Author:	Neil deHoog
// Date:		2018-03-

module optics	(input logic proximity_out,
					input logic clk,
					output logic proximity,
					output logic LED2);

					
	always_ff @(posedge clk) begin
		
		proximity <= proximity_out;
		LED2 <= proximity;
		
	end
	
endmodule