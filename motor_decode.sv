// ELEX 7660 Team 1 
// motor decode

module motor_decode(input logic [3:0] signal,
					input logic clk,
					output logic line_a,
					output logic line_b,
					output logic line_c,
					output logic line_d);
					
					
	always_ff @(posedge clk) begin
		line_a <= signal[0];
		line_b <= signal[2];
		line_c <= signal[1];
		line_d <= signal[3];
	end
		
endmodule