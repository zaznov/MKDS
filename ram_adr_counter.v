module ram_adr_counter 
(
input clr, 
input count, 
output reg [13:0] Q, 
output adr_limit
);

	always @(posedge count, posedge clr) begin
		if (clr == 1) Q = 13'd0;
		else Q = Q + 1;
	end

	assign adr_limit = Q[13];

	
endmodule



