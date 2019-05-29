//ELEX 7660 Team 1 
//Generates clocks at varius speeds for hardware requirements
//Motor - 20kHz 

module clk_generator(output logic clk_m);
	
	always begin
	
		#25us clk_m = ~clk_m; // 20kHz clock for the motor
		
	end
			
endmodule