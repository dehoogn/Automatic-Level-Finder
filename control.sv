//ELEX 7660 Team 1 
//control code 


module control (input logic clk,
				input logic toggle,
				input logic proximity_out,
				input logic reset_n,
				input logic [3:0] num,
				input logic [3:0] num_const,
				input logic [39:0] distance,
				output logic [1:0] dir,
				output logic [31:0] dist_test,
				output logic [31:0] leng_test);
		
		logic reset = 1;					// Required to reel the wire all the way in on reset
		logic [31:0] max_length = 50;	// Max length of the wire
		logic [1:0] dir_next;			// Next motor direction
		logic [31:0] test = 0;			// Test clock
		logic [31:0] length; 			// Length of the wire currently out
		logic [31:0] length_next = 0;
		
		

	always_comb begin 
		
		dir_next = dir;
		length_next = length;
		
		dist_test = distance/10000000;
		leng_test = length/10000000;
		
		// Manual mode
		if (toggle) begin
		
			unique case(num)
				10: dir_next = 2'b10;
				11: dir_next = 2'b11;
				default: dir_next = 2'b00;
			endcase
			
		end
		
		
		// Automatic mode
		if (!toggle) begin
		
			if ((length/10000000) < (distance/10000000))
				dir_next = 2'b11;
				
			if ((length/10000000) > (distance/10000000))
				dir_next = 2'b10;
				
			if ((length/10000000) == (distance/10000000))
				dir_next = 2'b00;
			
		end
		
		
		// Length Adjustments
		unique case(dir)
			2'b00: length_next = length_next;
			2'b10: length_next = length_next - 500;
			2'b11: length_next = length_next + 500;
		endcase
		
		if (!proximity_out)
			length_next = 0;
			
		if (length_next[31])
			length_next = 0;
			
	end
	
	
	always_ff @(posedge clk) begin
	
		if (!proximity_out && dir_next == 2'b10)
			dir <= 2'b00;
		else if ((length/10000000 > max_length) && (dir_next == 2'b11))
			dir <= 2'b00;
		else 
			dir <= dir_next;
			
		length <= length_next;

		
	end
	
endmodule
