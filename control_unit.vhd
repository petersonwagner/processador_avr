-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee;
use ieee.std_logic_1164.all;

entity control_unit is
port (  instruction: in std_logic_vector (4 downto 0);
        pc_en, beq, jump, sel_wr_reg_addr, wr_reg_en, sel_beta, wr_ram_en, sel_wr_reg_data, en_display: out std_logic);
end control_unit;

architecture behavioral of control_unit is
    signal control_vector: std_logic_vector (8 downto 0);
begin


    control_vector <=   "100000000" when instruction = "00000" else  --nop
                        "100010010" when instruction = "00001" else  --add
                        "100011010" when instruction = "00010" else  --addi
                        "100010010" when instruction = "00011" else  --sub
                        "100011010" when instruction = "00100" else  --subi
                        "100010010" when instruction = "00101" else  --mul
                        "100011010" when instruction = "00110" else  --muli
                        "100010010" when instruction = "00111" else  --and
                        "100011010" when instruction = "01000" else  --andi
                        "100010010" when instruction = "01001" else  --or
                        "100011010" when instruction = "01010" else  --ori
                        "100010010" when instruction = "01011" else  --xor
                        "100011010" when instruction = "01100" else  --xori
                        "100010010" when instruction = "01101" else  --not
                        "101000000" when instruction = "01110" else  --jump
                        "110000000" when instruction = "01111" else  --beq
                        "100111000" when instruction = "10000" else  --lw
                        "100001100" when instruction = "10001" else  --sw
                        "100010010" when instruction = "10010" else  --mov
                        "100011010" when instruction = "10011" else  --movi
                        "100000000" when instruction = "10100" else 
                        "100000000" when instruction = "10101" else
                        "100000000" when instruction = "10110" else
                        "100000000" when instruction = "10111" else
                        "100000000" when instruction = "11000" else
                        "100000000" when instruction = "11001" else
                        "100000000" when instruction = "11010" else
                        "100000000" when instruction = "11011" else
                        "100000000" when instruction = "11100" else
                        "100000000" when instruction = "11101" else
                        "100000001" when instruction = "11110" else --11110. display A
                        "000000000" when instruction = "11111";    --11111. halt

    pc_en           <= control_vector (8);
    beq             <= control_vector (7);
    jump            <= control_vector (6);
    sel_wr_reg_addr <= control_vector (5);
    wr_reg_en       <= control_vector (4);
    sel_beta        <= control_vector (3);
    wr_ram_en       <= control_vector (2);
    sel_wr_reg_data <= control_vector (1);
    en_display      <= control_vector (0);

end behavioral;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
