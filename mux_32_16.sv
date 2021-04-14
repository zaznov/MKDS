module mux_32_16(	

input logic [15:0]data_0,
input logic [15:0]data_1,
input logic mux_sel,

output logic [15:0]data_out
);


always_comb
	case(mux_sel)
	0: data_out = data_0;
	1: data_out = data_1;
	endcase

endmodule 