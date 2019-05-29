//ELEX 7660 Team 1 
//stepper motor control 
// Direction 10 = reel in
// Direction 11 = reel out


module motor(input logic clk,
				input logic reset_n,
				input logic [1:0] dir,
				output logic [3:0] signal);
				
				
	localparam pos_stop = 0;
	localparam pos_1 = 1;
	localparam pos_2 = 2;
	localparam pos_3 = 4;
	localparam pos_4 = 8;
	
	logic[3:0] pos_next;
	logic [8:0] count;
	
	always_comb begin 
	
		if(!reset_n) begin
			
			pos_next = pos_stop;
			
		end
		
		else begin 
		
			if (dir[1]) begin
			
				if (dir [0]) begin
					unique case (signal)
						pos_stop: pos_next = pos_1;
						pos_1: pos_next = pos_2;
						pos_2: pos_next = pos_3;
						pos_3: pos_next = pos_4;
						pos_4: pos_next = pos_1;
						default: pos_next = '0;
					endcase
				end 
				
				else begin
				
					unique case (signal)
						pos_stop: pos_next = pos_4;
						pos_1:	pos_next = pos_4;
						pos_2: pos_next = pos_1;
						pos_3: pos_next = pos_2;
						pos_4: pos_next = pos_3;
						default: pos_next = '0;
					endcase
					
				end
				
			end
			
			else begin
			
					pos_next = pos_stop;
					
			end
			
		end
		
	end 
	
	
	always_ff @(posedge clk) begin
	
		if (count == 511)
			signal <= pos_next;
		else
			signal <= signal;
			
		count <= count + 1;
		
	end
	
endmodule