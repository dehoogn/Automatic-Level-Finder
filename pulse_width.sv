//ELEX 7660 Team 1 
//module for pulse width modulation
//distance measurements
//time scale for is 147us per inch using the pw pin 
//2k Hz clock 500us resolution 
//distance output in cm

module pulse_width (input logic clk,
						input logic PW,
						output logic [31:0] distance,
						output logic [31:0] dis_avg);
				
	logic [31:0] count_delay = '0;
	logic [2:0] count_avg = '0;
	logic [40:0] dis_avg_1, dis_avg_2, dis_avg_3, dis_avg_4, dis_avg_5, dis_avg_6, dis_avg_7, dis_avg_8;	
	
	always_ff @(posedge clk) begin 
		
		if(PW) begin 
			count_delay <= count_delay + 1;
		end
		else begin
			count_delay <= '0;
		end
		
	end 
	
	always_ff @(negedge PW) begin
		distance <= count_delay * (500000/147000);//*254;
		
		count_avg <= count_avg + 1;
		
		dis_avg <= (dis_avg_1 + dis_avg_2 + dis_avg_3 + dis_avg_4 + dis_avg_5 + dis_avg_6 + dis_avg_7 + dis_avg_8)/8;
		
	end
	
	always_ff @(negedge PW) begin
	
	if (count_avg == 1) 
		dis_avg_1 <= distance;
	else if (count_avg == 2)
		dis_avg_2 <= distance;
	else if (count_avg == 3)
		dis_avg_3 <= distance;
	else if (count_avg == 4)
		dis_avg_4 <= distance;
	else if (count_avg == 5)
		dis_avg_5 <= distance;
	else if (count_avg == 6)
		dis_avg_6 <= distance;
	else if (count_avg == 7)
		dis_avg_7 <= distance;
	else if (count_avg == 0)
		dis_avg_8 <= distance;
	end
	
endmodule
