 module ram_logic
 (
 input logic clr,
 input logic count, 
 output logic [13:0] ram_adr,
 output logic adr_limit,
 input logic OE_buffer, 
 input logic [7:0] ram_data_in,
 output logic [7:0] ram_data_out,
 input logic wr_err_reg_clock,
 input logic all_clear,
 output logic [15:0] err_count
 
 );
 
 
assign ram_data_out = ram_adr[7:0];


 ram_adr_counter ram_adr_counter
(
clr, 
count, 
ram_adr[13:0], 
adr_limit
);
 
 
 
 ram_data_check ram_data_check
 (
ram_adr[7:0], 
ram_data_in[7:0],
wr_err_reg_clock,
all_clear,
err_count[15:0]
 );
 
 
 
 endmodule 
 
 
 
 
 
 