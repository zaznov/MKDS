 module ram_main_unit
 (
input logic sys_clk,
input logic all_clear,
input logic wr_rd_OE_buff,
input logic set_start,
input logic [7:0] ram_data_in,

output logic ram_ce,
output logic ready_to_SPI,
output logic [13:0] ram_adr,
output logic [7:0] ram_data_out,
output logic [15:0] err_count,
output logic DIR_RAM
 );
 
logic Q_start_strob;
logic adr_limit;
logic CLR;
logic done;
logic inc_ram_adr;
logic wr_err_reg_clock;
 
 
assign DIR_RAM = ~wr_rd_OE_buff;

ram_control_unit ram_control_unit
(
Q_start_strob,
wr_rd_OE_buff,
adr_limit,
all_clear,
sys_clk,

ram_ce,
done,
inc_ram_adr,
wr_err_reg_clock
);
 
 
start_trigger start_trigger
(
set_start, 
CLR, 
Q_start_strob, 
ready_to_SPI
);
 
 
 
 
 
ram_logic ram_logic
 (
ready_to_SPI,
inc_ram_adr, 
ram_adr[13:0],
adr_limit,
wr_rd_OE_buff, 
ram_data_in[7:0],
ram_data_out[7:0],
wr_err_reg_clock,
all_clear,
err_count[15:0]
 );
 
 
united_CLR united_CLR
(
done,
all_clear,
CLR
);



endmodule 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  module united_CLR
(
input logic done,
input logic all_clear,
output logic CLR
);

	assign CLR = all_clear | done;
	
endmodule
 
 
 