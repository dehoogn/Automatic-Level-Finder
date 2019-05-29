module pulse (input logic clk,
						output logic trig,
						input logic echo,
						output logic [39:0] distance);
				
	logic [13:0] count= '0;
	logic [31:0] pulsewidth = '0;
	
	always_ff @(posedge clk) begin 
		
		if (count == 0 || count == 1)
			trig <= '1;
		else
			trig <= '0;
			
		count <= count + 1;
		
		if (echo)
			pulsewidth <= pulsewidth + 1;
			
		else if (~echo)
			pulsewidth <= 0;
		
	end 

	
	always_ff @(negedge echo) begin
		distance <= pulsewidth * 5 / 58 * 10000000; 
	end
	
endmodule