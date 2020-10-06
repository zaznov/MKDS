//** my_one_shot **************************!
//* Схема выделения положительного фронта *!
//*                                       *!
//* Выдает импульс по каждому             *!
//* положительному входному фронту        *!
//*---------------------------------------*!
//*      версия от 2020-10-05             *!
//*****************************************!
module my_one_shot  (clk_in, clr_in, d_in, q_out);

    // Входы
    input clk_in;   // тактовая сетка
    input clr_in;   // начальный сброс
    input d_in;     // вход
    // Выходы
    output q_out;   // выход импульса

    // Регистр сдвига
    parameter   reg_length = 3; // разрядность сдвигового регистра,
                                // определяющаяя задержку между d_in и q_out
    reg [reg_length - 1:0]shift_reg; // сдвиговый регистр
    always @ (posedge clk_in or posedge clr_in)
begin
    if (clr_in)
    begin
    shift_reg <= 0;       // начальный асинхронный сброс
    end
    else
    begin
    shift_reg[reg_length - 1:1] <= shift_reg[reg_length - 2:0];
    shift_reg[0] <= d_in;    
    end
end

    // Выходной сигнал
    assign q_out = shift_reg[reg_length - 2] & ~shift_reg[reg_length - 1];

endmodule









