// FIle Name:	decode7.sv
// Description: Module for Fish
//					Takes the output from the toggle switch and assigns
//					it to a stored variable
//					Toggle = 1 is Manual mode
//					Toggle = 0 is automatic mode
// Author:		Neil deHoog
// Date:		2018-03-25

module mode	(input logic toggle_out,
				input logic clk,
				output logic LED1,
				output logic toggle);
	
	always_ff @(posedge clk) begin
		
		toggle <= toggle_out;
		LED1 <= toggle;
		
	end
	
endmodule