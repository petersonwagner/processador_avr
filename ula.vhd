-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee;
use ieee.std_logic_1164.all;

entity ULA is
  port (fun : in  std_logic_vector(4 downto 0);
        alfa,beta : in  std_logic_vector(7 downto 0);
        gama      : out std_logic_vector(7 downto 0);
        zero      : out std_logic);
end ULA;

architecture behaviour of ULA is

    component mult8x8 is
      port(A, B : in  std_logic_vector(7 downto 0);   -- entradas A,B
           prod : out std_logic_vector(7 downto 0));  -- produto
    end component mult8x8;

    component sub8 is
      port(entr1, entr2: in  std_logic_vector (7 downto 0);
           z    : out std_logic_vector (7 downto 0));
    end component sub8;

    component and2vet8 is
      port(entr1, entr2: in std_logic_vector (7 downto 0);
           z    : out std_logic_vector (7 downto 0));
    end component and2vet8;

    component or2vet8 is
      port(entr1, entr2: in std_logic_vector (7 downto 0);
           z    : out std_logic_vector (7 downto 0));
    end component or2vet8;

    component xor2vet8 is
      port(entr1, entr2: in std_logic_vector (7 downto 0);
           z    : out std_logic_vector (7 downto 0));
    end component xor2vet8;

    component notvet8 is
      port(entr1: in std_logic_vector (7 downto 0);
           z    : out std_logic_vector (7 downto 0));
    end component notvet8;

    component adder8 is
      port(inpA, inpB : in std_logic_vector(7 downto 0);
           outC : out std_logic_vector(7 downto 0);
           vem  : in std_logic;
           vai  : out std_logic);
    end component adder8;

    component mux32vet8 is
      port(e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,
           e17,e18,e19,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32 : in  std_logic_vector(7 downto 0);
           S   : in  std_logic_vector(4 downto 0);
           Z   : out std_logic_vector(7 downto 0));
    end component mux32vet8;

    signal r_add, r_sub, r_mult, r_and, r_or, r_xor, r_not: std_logic_vector(7 downto 0);
    signal s0,s1,s2,s3,s4,s5,s6,s7 : std_logic_vector(7 downto 0);
    signal s8,s9,s10,s11,s12,s13,s14,s15 : std_logic_vector(7 downto 0);
    signal s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31 : std_logic_vector(7 downto 0);

begin  -- behaviour

    Uf0:   adder8 port map (alfa, beta, r_add, '0', open);
    Uf1:   sub8 port map (alfa, beta, r_sub);
    Uf2:   mult8x8 port map (alfa, beta, r_mult);
    Uf3:   and2vet8 port map (alfa, beta, r_and);
    Uf4:   or2vet8 port map (alfa, beta, r_or);
    Uf5:   xor2vet8 port map (alfa, beta, r_xor);
    Uf6:   notvet8 port map (alfa, r_not);

    s0  <= "00000000";  --00000. nop
    s1  <= r_add;       --00001. add
    s2  <= r_add;       --00010. addi
    s3  <= r_sub;       --00011. sub
    s4  <= r_sub;       --00100. subi
    s5  <= r_mult;      --00101. mul
    s6  <= r_mult;      --00110. muli
    s7  <= r_and;       --00111. and
    s8  <= r_and;       --01000. andi
    s9  <= r_or;        --01001. or
    s10 <= r_or;        --01010. ori
    s11 <= r_xor;       --01011. xor
    s12 <= r_xor;       --01100. xori
    s13 <= r_not;       --01101. not
    s14 <= "00000000";  --01110. jump
    s15 <= r_sub;       --01111. beq
    s16 <= r_add;       --10000. lw
    s17 <= r_add;       --10001. sw
    s18 <= beta;        --10010. mov
    s19 <= beta;        --10011. movi
    s20 <= "00000000";
    s21 <= "00000000";
    s22 <= "00000000";
    s23 <= "00000000";
    s24 <= "00000000";
    s25 <= "00000000";
    s26 <= "00000000";
    s27 <= "00000000";
    s28 <= "00000000";
    s29 <= "00000000";
    s30 <= "00000000";  --11110. display
    s31 <= "00000000";  --11111. halt

    saida: mux32vet8 port map (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31, fun, gama);

    zero <= '1' when r_sub = "00000000" else '0';


end behaviour;
-- -----------------------------------------------------------------------
