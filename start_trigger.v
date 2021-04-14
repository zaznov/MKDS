module start_trigger 
	(
input CLK, 
input CLR, 
output reg Q, 
output Q_not
);

	always @ (posedge CLK or posedge CLR) begin
			if (CLR) Q <= 1'b0;
			else if (CLK)  Q <= 1'b1;

	end
	
	assign Q_not = !Q;
endmodule 