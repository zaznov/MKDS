 module tristate_inout_buffer
(
inout tri [7:0]D_in,
input logic OE_in,
input logic DIR_in_from_in_to_out,
input logic sel,

inout tri [7:0] D_out,
output tri OE_out,
output tri DIR_out
);

logic DIR_in_from_out_to_in;
assign DIR_in_from_out_to_in = !DIR_in_from_in_to_out;

tristate_buffer buffer_in_to_out
(
D_in[7:0],
DIR_in_from_in_to_out,
D_out[7:0],
);
tristate_buffer buffer_out_to_in
(
D_out[7:0],
DIR_in_from_out_to_in,
D_in[7:0],
);



assign OE_out 	= sel ? OE_in : 1'bz;
assign DIR_out 	= sel ? DIR_in_from_in_to_out : 1'bz;

endmodule 




 module tristate_buffer
(
input logic [7:0]D,
input logic dir,
output tri [7:0] Q
);
assign Q 	= dir ? D : 8'bz;

endmodule 


