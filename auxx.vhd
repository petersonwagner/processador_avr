
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divisor_frequencia is
    port (
        clk_in:    in  std_logic;
        clk_out:   out std_logic);
end entity;

architecture struct of divisor_frequencia is
	signal clk1: std_logic;
begin
    process(clk_in)
    variable count: integer := 1;
    begin
        if clk_in='1' and clk_in'event then
            count := count+1;
            if(count = 5000000) then
                clk1 <= not clk1;
                count := 1;
            end if;
        end if;
    end process;
	 
	 clk_out <= clk1;

    
end architecture;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



library ieee;
use ieee.std_logic_1164.all;

entity mux32 is
  port(e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,
       e17,e18,e19,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32 : in  std_logic;
       S   : in  std_logic_vector(4 downto 0);
       Z   : out std_logic);
end mux32;


architecture estrut of mux32 is 
begin

	Z <=	e1  when S = "00000" else
			e2  when S = "00001" else
			e3  when S = "00010" else
			e4  when S = "00011" else
			e5  when S = "00100" else
			e6  when S = "00101" else
			e7  when S = "00110" else
			e8  when S = "00111" else
			e9  when S = "01000" else
			e10 when S = "01001" else
			e11 when S = "01010" else
			e12 when S = "01011" else
			e13 when S = "01100" else
			e14 when S = "01101" else
			e15 when S = "01110" else
			e16 when S = "01111" else
			e17 when S = "10000" else
			e18 when S = "10001" else
			e19 when S = "10010" else
			e20 when S = "10011" else
			e21 when S = "10100" else
			e22 when S = "10101" else
			e23 when S = "10110" else
			e24 when S = "10111" else
			e25 when S = "11000" else
			e26 when S = "11001" else
			e27 when S = "11010" else
			e28 when S = "11011" else
			e29 when S = "11100" else
			e30 when S = "11101" else
			e31 when S = "11110" else
			e32 when S = "11111";

end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee;
use ieee.std_logic_1164.all;

entity mux32vet8 is
  port(e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12,e13,e14,e15,e16,
       e17,e18,e19,e20,e21,e22,e23,e24,e25,e26,e27,e28,e29,e30,e31,e32 : in  std_logic_vector(7 downto 0);
       S   : in  std_logic_vector(4 downto 0);
       Z   : out std_logic_vector(7 downto 0));
end mux32vet8;


architecture estrut of mux32vet8 is 
begin

	Z <=	e1  when S = "00000" else
			e2  when S = "00001" else
			e3  when S = "00010" else
			e4  when S = "00011" else
			e5  when S = "00100" else
			e6  when S = "00101" else
			e7  when S = "00110" else
			e8  when S = "00111" else
			e9  when S = "01000" else
			e10 when S = "01001" else
			e11 when S = "01010" else
			e12 when S = "01011" else
			e13 when S = "01100" else
			e14 when S = "01101" else
			e15 when S = "01110" else
			e16 when S = "01111" else
			e17 when S = "10000" else
			e18 when S = "10001" else
			e19 when S = "10010" else
			e20 when S = "10011" else
			e21 when S = "10100" else
			e22 when S = "10101" else
			e23 when S = "10110" else
			e24 when S = "10111" else
			e25 when S = "11000" else
			e26 when S = "11001" else
			e27 when S = "11010" else
			e28 when S = "11011" else
			e29 when S = "11100" else
			e30 when S = "11101" else
			e31 when S = "11110" else
			e32 when S = "11111";
    
end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee;
use ieee.std_logic_1164.all;

entity demux32vet8 is
  port(entrada: in  std_logic_vector(7 downto 0);
       sel  : in  std_logic_vector(4 downto 0);
       z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,z16,
       z17,z18,z19,z20,z21,z22,z23,z24,z25,z26,z27,z28,z29,z30,z31,z32: out std_logic_vector(7 downto 0));
end demux32vet8;

architecture estrut of demux32vet8 is 
begin

	process(entrada, sel)
	begin
		case sel is
			when "00000" => z1 <= entrada;
			when "00001" => z2 <= entrada;
			when "00010" => z3 <= entrada;
			when "00011" => z4 <= entrada;
			when "00100" => z5 <= entrada;
			when "00101" => z6 <= entrada;
			when "00110" => z7 <= entrada;
			when "00111" => z8 <= entrada;
			when "01000" => z9 <= entrada;
			when "01001" => z10<= entrada;
			when "01010" => z11<= entrada;
			when "01011" => z12<= entrada;
			when "01100" => z13<= entrada;
			when "01101" => z14<= entrada;
			when "01110" => z15<= entrada;
			when "01111" => z16<= entrada;
			when "10000" => z17<= entrada;
			when "10001" => z18<= entrada;
			when "10010" => z19<= entrada;
			when "10011" => z20<= entrada;
			when "10100" => z21<= entrada;
			when "10101" => z22<= entrada;
			when "10110" => z23<= entrada;
			when "10111" => z24<= entrada;
			when "11000" => z25<= entrada;
			when "11001" => z26<= entrada;
			when "11010" => z27<= entrada;
			when "11011" => z28<= entrada;
			when "11100" => z29<= entrada;
			when "11101" => z30<= entrada;
			when "11110" => z31<= entrada;
			when others => z32<= entrada;

		end case;
	end process;

end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee;
use ieee.std_logic_1164.all;

entity demux32 is
  port(entrada: in  std_logic;
       sel  : in  std_logic_vector(4 downto 0);
       z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,z16,
       z17,z18,z19,z20,z21,z22,z23,z24,z25,z26,z27,z28,z29,z30,z31,z32 : out std_logic);
end demux32;

architecture estrut of demux32 is 
begin

	process(entrada, sel)
	begin
		case sel is
			when "00000" => z1 <= entrada;
			when "00001" => z2 <= entrada;
			when "00010" => z3 <= entrada;
			when "00011" => z4 <= entrada;
			when "00100" => z5 <= entrada;
			when "00101" => z6 <= entrada;
			when "00110" => z7 <= entrada;
			when "00111" => z8 <= entrada;
			when "01000" => z9 <= entrada;
			when "01001" => z10<= entrada;
			when "01010" => z11<= entrada;
			when "01011" => z12<= entrada;
			when "01100" => z13<= entrada;
			when "01101" => z14<= entrada;
			when "01110" => z15<= entrada;
			when "01111" => z16<= entrada;
			when "10000" => z17<= entrada;
			when "10001" => z18<= entrada;
			when "10010" => z19<= entrada;
			when "10011" => z20<= entrada;
			when "10100" => z21<= entrada;
			when "10101" => z22<= entrada;
			when "10110" => z23<= entrada;
			when "10111" => z24<= entrada;
			when "11000" => z25<= entrada;
			when "11001" => z26<= entrada;
			when "11010" => z27<= entrada;
			when "11011" => z28<= entrada;
			when "11100" => z29<= entrada;
			when "11101" => z30<= entrada;
			when "11110" => z31<= entrada;
			when others => z32<= entrada;

		end case;
	end process;

end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- registrador de 8 bits, reset=0 assincrono, load=1 sincrono
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee;
use ieee.std_logic_1164.all;

entity registrador8 is
  port(rel, rst, ld: in  std_logic;
        D:           in  std_logic_vector(7 downto 0);
        Q:           out std_logic_vector(7 downto 0));
end registrador8;

architecture funcional of registrador8 is
  signal value: std_logic_vector(7 downto 0);
begin

  process(rel, rst, ld)
  begin
    if rst = '0' then
      value <= (others => '0');
    elsif (ld = '1' and rel'EVENT and rel = '1') then
      value <= D;
    end if;
  end process;

  Q <= value;
end funcional;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- registrador de 23 bits, reset=0 assincrono, load=1 sincrono
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee;
use ieee.std_logic_1164.all;

entity registrador23 is
  port(rel, rst, ld: in  std_logic;
        D:           in  std_logic_vector(22 downto 0);
        Q:           out std_logic_vector(22 downto 0));
end registrador23;

architecture funcional of registrador23 is
  signal value: std_logic_vector(22 downto 0);
begin

  process(rel, rst, ld)
  begin
    if rst = '0' then
      value <= (others => '0');
    elsif (ld = '1' and rel'EVENT and rel = '1') then
      value <= D;
    end if;
  end process;

  Q <= value;
end funcional;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.std_logic_1164.all;

entity and2vet8 is
  port(entr1, entr2: in std_logic_vector (7 downto 0);
       z    : out std_logic_vector (7 downto 0));
end and2vet8;

architecture estrut of and2vet8 is  
begin

	z(7) <= entr1(7) and entr2(7);
	z(6) <= entr1(6) and entr2(6);
	z(5) <= entr1(5) and entr2(5);
	z(4) <= entr1(4) and entr2(4);
	z(3) <= entr1(3) and entr2(3);
	z(2) <= entr1(2) and entr2(2);
	z(1) <= entr1(1) and entr2(1);
	z(0) <= entr1(0) and entr2(0);

end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.std_logic_1164.all;

entity or2vet8 is
  port(entr1, entr2: in std_logic_vector (7 downto 0);
       z    : out std_logic_vector (7 downto 0));
end or2vet8;

architecture estrut of or2vet8 is  
begin

	z(7) <= entr1(7) or entr2(7);
	z(6) <= entr1(6) or entr2(6);
	z(5) <= entr1(5) or entr2(5);
	z(4) <= entr1(4) or entr2(4);
	z(3) <= entr1(3) or entr2(3);
	z(2) <= entr1(2) or entr2(2);
	z(1) <= entr1(1) or entr2(1);
	z(0) <= entr1(0) or entr2(0);

end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.std_logic_1164.all;

entity xor2vet8 is
  port(entr1, entr2: in std_logic_vector (7 downto 0);
       z    : out std_logic_vector (7 downto 0));
end xor2vet8;

architecture estrut of xor2vet8 is  
begin

	z(7) <= entr1(7) xor entr2(7);
	z(6) <= entr1(6) xor entr2(6);
	z(5) <= entr1(5) xor entr2(5);
	z(4) <= entr1(4) xor entr2(4);
	z(3) <= entr1(3) xor entr2(3);
	z(2) <= entr1(2) xor entr2(2);
	z(1) <= entr1(1) xor entr2(1);
	z(0) <= entr1(0) xor entr2(0);

end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.std_logic_1164.all;

entity notvet8 is
  port(entr1: in std_logic_vector (7 downto 0);
       z    : out std_logic_vector (7 downto 0));
end notvet8;

architecture estrut of notvet8 is  
begin

	z(7) <= not entr1(7);
	z(6) <= not entr1(6);
	z(5) <= not entr1(5);
	z(4) <= not entr1(4);
	z(3) <= not entr1(3);
	z(2) <= not entr1(2);
	z(1) <= not entr1(1);
	z(0) <= not entr1(0);

end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- somador completo de um bit
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.std_logic_1164.all;

entity addstd_logic is port(std_logicA, std_logicB, vem : in std_logic;    -- entradas A,B,vem-um
       soma, vai       : out std_logic);  -- saida C,vai-um
end addstd_logic;

architecture estrutural of addstd_logic is 
  signal a1,a2,a3: std_logic;
begin
  
  soma <= std_logicA xor std_logicB xor vem;
  a1 <= std_logicA and std_logicB;
  a2 <= std_logicA and vem;
  a3 <= vem and std_logicB;
  vai <= a1 or a2 or a3;

end estrutural;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- somador de 8 std_logics, sem adiantamento de vai-um
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.std_logic_1164.all;

entity adder8 is
  port(inpA, inpB : in std_logic_vector(7 downto 0);
       outC : out std_logic_vector(7 downto 0);
       vem  : in std_logic;
       vai  : out std_logic
       );
end adder8;

architecture adder8 of adder8 is 
  component addstd_logic port(std_logicA, std_logicB, vem : in std_logic;
                        soma, vai       : out std_logic);       
  end component addstd_logic;

  signal v : std_logic_vector(7 downto 0);                     -- cadeia de vai-um
  signal r : std_logic_vector(7 downto 0);                     -- resultado parcial
begin

  -- entrada vem deve estar ligada em '0' para somar, em '1' para subtrair
  U_b0: addstd_logic port map ( inpA(0), inpB(0), vem,  r(0), v(0) );
  U_b1: addstd_logic port map ( inpA(1), inpB(1), v(0), r(1), v(1) );
  U_b2: addstd_logic port map ( inpA(2), inpB(2), v(1), r(2), v(2) );
  U_b3: addstd_logic port map ( inpA(3), inpB(3), v(2), r(3), v(3) );
  U_b4: addstd_logic port map ( inpA(4), inpB(4), v(3), r(4), v(4) );
  U_b5: addstd_logic port map ( inpA(5), inpB(5), v(4), r(5), v(5) );
  U_b6: addstd_logic port map ( inpA(6), inpB(6), v(5), r(6), v(6) );
  U_b7: addstd_logic port map ( inpA(7), inpB(7), v(6), r(7), v(7) );

  vai <= v(7);
  outC <= r;
  
end adder8;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- subtrator 8 std_logics
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee;
use ieee.std_logic_1164.all;

entity sub8 is
  port(entr1, entr2: in  std_logic_vector (7 downto 0);
       z    : out std_logic_vector (7 downto 0));
end sub8;

architecture estrut of sub8 is 
  
  component adder8 is
    port(inpA, inpB : in std_logic_vector (7 downto 0);
       outC : out std_logic_vector (7 downto 0);
       vem  : in std_logic;
       vai  : out std_logic);
  end component adder8;

  component notvet8 is
    port(entr1: in  std_logic_vector (7 downto 0);
         z    : out std_logic_vector (7 downto 0));
  end component notvet8;

  signal a : std_logic_vector (7 downto 0);

begin

  Ui1: notvet8 port map (entr2, a);
  Ua1: adder8 port map (entr1, a, z, '1', open);
  
end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- multiplica por 1
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE; use IEEE.std_logic_1164.all;

entity m_p_1 is
  port(A,B : in  std_logic_vector (7 downto 0);                 -- entradas A,B
       S : in std_logic;                      -- std_logic por multiplicar
       R : out std_logic_vector (8 downto 0));                  -- produto parcial
end m_p_1;

architecture funcional of m_p_1 is 

  component adder8 is port(inpA, inpB : in std_logic_vector (7 downto 0);
                          outC : out std_logic_vector (7 downto 0);
                          vem  : in  std_logic;
                          vai  : out std_logic);
  end component adder8;

  signal somaAB : std_logic_vector (8 downto 0);

begin

  U_soma: adder8 port map(A, B , somaAB(7 downto 0), '0', somaAB(8)); 

  R <= somaAB when S = '1' else ('0' & B);

end funcional;
-- -------------------------------------------------------------------

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- multiplicador combinacional
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE; use IEEE.std_logic_1164.all; use IEEE.numeric_std.all;


entity mult8x8 is
  port(A, B : in  std_logic_vector(7 downto 0);   -- entradas A,B
       prod : out std_logic_vector(7 downto 0));  -- produto
end mult8x8;

architecture estrutural of mult8x8 is 
 
   component m_p_1 is port(A,B : in  std_logic_vector(7 downto 0);
                           S   : in  std_logic;
                           R   : out std_logic_vector(8 downto 0));
   end component m_p_1;
 
   signal p01,p02,p03,p04,p05,p06,p07,p08: std_logic_vector(8 downto 0);
   signal p09,p10,p11,p12,p13,p14,p15,p16,p17: std_logic_vector(8 downto 0);
   signal p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30,p31,p32: std_logic_vector(8 downto 0);
 
  begin
    
    U_00: m_p_1 port map (A, "00000000", B(0), p01);
        prod(0) <= p01(0);
    U_01: m_p_1 port map (A, p01(8 downto 1), B(1), p02);
        prod(1) <= p02(0);
    U_02: m_p_1 port map (A, p02(8 downto 1), B(2), p03);
        prod(2) <= p03(0);
    U_03: m_p_1 port map (A, p03(8 downto 1), B(3), p04);
        prod(3) <= p04(0);
    U_04: m_p_1 port map (A, p04(8 downto 1), B(4), p05);
        prod(4) <= p05(0);
    U_05: m_p_1 port map (A, p05(8 downto 1), B(5), p06);
        prod(5) <= p06(0);
    U_06: m_p_1 port map (A, p06(8 downto 1), B(6), p07);
        prod(6) <= p07(0);
    U_07: m_p_1 port map (A, p07(8 downto 1), B(7), p08);
        prod(7) <= p08(0);
   
 end estrutural;
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
