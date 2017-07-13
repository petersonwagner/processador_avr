library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;


entity mem_prog is
  port (address : in STD_LOGIC_vector(7 downto 0);
        instr : out STD_LOGIC_vector(22 downto 0));

  type t_prog_mem is array (0 to 63) of STD_LOGIC_vector (22 downto 0);

  -- memoria de programa contem somente 64 palavras
  constant program : t_prog_mem := (
    --r1 = n
    --r2 = result

    --op,       a,        b,       immediate
    "10011" & "00000" & "00000" & "00000000",  --movi 0, r0         | r0 = 0;
    "10011" & "00001" & "00000" & "00000100",  --movi 5, r1         | n = 6;
    "10011" & "00010" & "00000" & "00000001",  --movi 1, r2         | result = 1;
    "01111" & "00001" & "00000" & "00001100",  --beq r1, 0, FIM     | if (n == 0) goto fim;
    
    --INICIO
    "11110" & "00010" & "00000" & "00000000",  --display r2         | display result
    "00101" & "00010" & "00001" & "00000000",  --mul r2, r1         | result = result * n
    "00100" & "00001" & "00000" & "00000001",  --subi r1, 1         | n = n - 1
    "00000" & "00000" & "00000" & "00000000",
    "01111" & "00001" & "00000" & "00001100",  --beq r1, 0, FIM     | if (n == 0) goto fim;
    "00000" & "00000" & "00000" & "00000000",
    "01110" & "00000" & "00000" & "00000100",  --jump INICIO
    "00000" & "00000" & "00000" & "00000000",

    --FIM
    "11110" & "00010" & "00000" & "00000000",  --display r2         | display result
    "01110" & "00000" & "00000" & "00001100",  --jump FIM
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
	 "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000",
    "00000" & "00000" & "00000" & "00000000");

  
end mem_prog;

architecture tabela of mem_prog is
    signal addr_int : integer range 0 to 63; 
begin
  addr_int <= to_integer(unsigned(address));
  instr <= program( addr_int );

end tabela;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity ram_memory is
port (clk : in std_logic;
        address : in std_logic_vector(7 downto 0);
        wr : in std_logic;
        data_i : in std_logic_vector(7 downto 0);
        data_o : out std_logic_vector(7 downto 0)
     );
end ram_memory;

architecture behavioral of ram_memory is

type ram_tipo is array (0 to 255) of std_logic_vector(7 downto 0);
signal memoria : ram_tipo := (others => (others => '0'));
signal addr_int : integer range 0 to 255; 

begin

--process for read and write operation.
process(clk)
begin
    addr_int <= to_integer(unsigned(address));
    if(rising_edge(clk)) then
        if(wr='1') then
            memoria(addr_int) <= data_i;
        end if;
        data_o <= memoria(addr_int);
    end if; 
end process;

end behavioral;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee;
use ieee.std_logic_1164.all;

entity REGISTERS is
  port (clk         : in  std_logic;
        wr_en       : in  std_logic;          -- ativo em 1
        r_a,r_b,r_c : in  std_logic_vector(4 downto 0);
        A,B         : out std_logic_vector(7 downto 0);
        C           : in  std_logic_vector(7 downto 0));
end REGISTERS;

architecture rtl of REGISTERS is

    component registrador8 is
      port(rel, rst, ld: in  std_logic;
            D:           in  std_logic_vector(7 downto 0);
            Q:           out std_logic_vector(7 downto 0));
    end component registrador8;

    component demux32vet8 is
    port(entrada: in  std_logic_vector(7 downto 0);
       sel  : in  std_logic_vector(4 downto 0);
       z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,z16,
       z17,z18,z19,z20,z21,z22,z23,z24,z25,z26,z27,z28,z29,z30,z31,z32: out std_logic_vector(7 downto 0));
    end component demux32vet8;

    component demux32 is
    port(entrada: in  std_logic;
       sel  : in  std_logic_vector(4 downto 0);
       z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,z16,
       z17,z18,z19,z20,z21,z22,z23,z24,z25,z26,z27,z28,z29,z30,z31,z32 : out std_logic);
    end component demux32;


    component mux32 is
    port(e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,
       e17,e18,e19,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32 : in  std_logic;
       S   : in  std_logic_vector(4 downto 0);
       Z   : out std_logic);
    end component mux32;

    component mux32vet8 is
    port(e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,
       e17,e18,e19,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32 : in  std_logic_vector(7 downto 0);
       S   : in  std_logic_vector(4 downto 0);
       Z   : out std_logic_vector(7 downto 0));
    end component mux32vet8;

    signal d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15:           std_logic_vector(7 downto 0);
    signal d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31: std_logic_vector(7 downto 0);
    signal q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15:           std_logic_vector(7 downto 0);
    signal q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31: std_logic_vector(7 downto 0);
    signal en0,en1,en2,en3,en4,en5,en6,en7,en8,en9,en10,en11,en12,en13,en14,en15: std_logic;
    signal en16,en17,en18,en19,en20,en21,en22,en23,en24,en25,en26,en27,en28,en29,en30,en31: std_logic;

begin
    
    Udm1: demux32vet8 port map (C, r_c, d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31);

    Udm2: demux32 port map (wr_en, r_c, en0,en1,en2,en3,en4,en5,en6,en7,en8,en9,en10,en11,en12,en13,en14,en15,en16,en17,en18,en19,en20,en21,en22,en23,en24,en25,en26,en27,en28,en29,en30,en31);

    Ur0:  registrador8 port map (clk, '1', en0,  d0,  q0);
    Ur1:  registrador8 port map (clk, '1', en1,  d1,  q1);
    Ur2:  registrador8 port map (clk, '1', en2,  d2,  q2);
    Ur3:  registrador8 port map (clk, '1', en3,  d3,  q3);
    Ur4:  registrador8 port map (clk, '1', en4,  d4,  q4);
    Ur5:  registrador8 port map (clk, '1', en5,  d5,  q5);
    Ur6:  registrador8 port map (clk, '1', en6,  d6,  q6);
    Ur7:  registrador8 port map (clk, '1', en7,  d7,  q7);
    Ur8:  registrador8 port map (clk, '1', en8,  d8,  q8);
    Ur9:  registrador8 port map (clk, '1', en9,  d9,  q9);
    Ur10: registrador8 port map (clk, '1', en10, d10, q10);
    Ur11: registrador8 port map (clk, '1', en11, d11, q11);
    Ur12: registrador8 port map (clk, '1', en12, d12, q12);
    Ur13: registrador8 port map (clk, '1', en13, d13, q13);
    Ur14: registrador8 port map (clk, '1', en14, d14, q14);
    Ur15: registrador8 port map (clk, '1', en15, d15, q15);
    Ur16: registrador8 port map (clk, '1', en16, d16, q16);
    Ur17: registrador8 port map (clk, '1', en17, d17, q17);
    Ur18: registrador8 port map (clk, '1', en18, d18, q18);
    Ur19: registrador8 port map (clk, '1', en19, d19, q19);
    Ur20: registrador8 port map (clk, '1', en20, d20, q20);
    Ur21: registrador8 port map (clk, '1', en21, d21, q21);
    Ur22: registrador8 port map (clk, '1', en22, d22, q22);
    Ur23: registrador8 port map (clk, '1', en23, d23, q23);
    Ur24: registrador8 port map (clk, '1', en24, d24, q24);
    Ur25: registrador8 port map (clk, '1', en25, d25, q25);
    Ur26: registrador8 port map (clk, '1', en26, d26, q26);
    Ur27: registrador8 port map (clk, '1', en27, d27, q27);
    Ur28: registrador8 port map (clk, '1', en28, d28, q28);
    Ur29: registrador8 port map (clk, '1', en29, d29, q29);
    Ur30: registrador8 port map (clk, '1', en30, d30, q30);
    Ur31: registrador8 port map (clk, '1', en31, d31, q31);


    Um1: mux32vet8 port map (q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31, r_a, A);
    Um2: mux32vet8 port map (q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,q30,q31, r_b, B);
 
end rtl;
-- -----------------------------------------------------------------------