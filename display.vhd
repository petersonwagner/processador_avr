LIBRARY ieee;
use ieee.std_logic_1164.all;
---
ENTITY bcd_to_7seg is
    port(bcd: in std_logic_vector(3 downto 0);
        disp: out std_logic_vector (6 DOWNTO 0));
END entity;
---
ARCHITECTURE oi of bcd_to_7seg is
begin

    disp <= "0000001" when bcd = "0000" else
            "1001111" when bcd = "0001" else
            "0010010" when bcd = "0010" else
            "0000110" when bcd = "0011" else
            "1001100" when bcd = "0100" else
            "0100100" when bcd = "0101" else
            "0100000" when bcd = "0110" else
            "0001101" when bcd = "0111" else
            "0000000" when bcd = "1000" else
            "0000100" when bcd = "1001";

END architecture;


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display_handler is
    port (
        bin:    in  std_logic_vector (7 downto 0);
        clk, enable:    in std_logic;
        a,b,c,d,e,f,g,an0,an1,an2,an3: out std_logic);
end entity;

architecture struct of display_handler is

component bcd_to_7seg is
    port(bcd: in std_logic_vector(3 downto 0);
        disp: out std_logic_vector (6 DOWNTO 0));
END component bcd_to_7seg;

component bin8bcd is
    port (
        bin:    in  std_logic_vector (7 downto 0);
        bcd:    out std_logic_vector (11 downto 0));
end component bin8bcd;

signal anodes:  std_logic_vector (3 downto 0);
signal bcd_all: std_logic_vector (11 downto 0);
signal digitM, digitC, digitD, digitU: std_logic_vector (6 downto 0);
signal clk1: std_logic;

begin
    process(clk)
    variable count: integer := 1;
    begin
        if clk='1' and clk'event then
            count := count+1;
            if(count = 25000) then
                clk1 <= not clk1;
                count := 1;
            end if;
        end if;
    end process;

    process(clk1)
    begin
        if clk1 = '1' and clk1'event then
            if enable = '0' then
                anodes <= "1111";
                a <= '0';
                b <= '0';
                c <= '0';
                d <= '0';
                e <= '0';
                f <= '0';
                g <= '0';
            else
                if anodes = "0111" then
                    anodes <= "1011";
                    a <= digitC(6);
                    b <= digitC(5);
                    c <= digitC(4);
                    d <= digitC(3);
                    e <= digitC(2);
                    f <= digitC(1);
                    g <= digitC(0);
                elsif anodes = "1011" then
                    anodes <= "1101";
                    a <= digitD(6);
                    b <= digitD(5);
                    c <= digitD(4);
                    d <= digitD(3);
                    e <= digitD(2);
                    f <= digitD(1);
                    g <= digitD(0);
                elsif anodes = "1101" then
                    anodes <= "1110";
                    a <= digitU(6);
                    b <= digitU(5);
                    c <= digitU(4);
                    d <= digitU(3);
                    e <= digitU(2);
                    f <= digitU(1);
                    g <= digitU(0);
                else
                    anodes <= "0111";
                    a <= digitM(6);
                    b <= digitM(5);
                    c <= digitM(4);
                    d <= digitM(3);
                    e <= digitM(2);
                    f <= digitM(1);
                    g <= digitM(0);
                end if;
            end if ;
        end if ;
    end process;

    Uconv: bin8bcd port map (bin, bcd_all);

    UbcdM: bcd_to_7seg port map ("0000",               digitM);
    UbcdC: bcd_to_7seg port map (bcd_all(11 downto 8), digitC);
    UbcdD: bcd_to_7seg port map (bcd_all(7  downto 4), digitD);
    UbcdU: bcd_to_7seg port map (bcd_all(3  downto 0), digitU);

    an0 <= anodes(0);
    an1 <= anodes(1);
    an2 <= anodes(2);
    an3 <= anodes(3);
    
end architecture;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin8bcd is
    port (
        bin:    in  std_logic_vector (7 downto 0);
        bcd:    out std_logic_vector (11 downto 0));
end entity;

architecture struct of bin8bcd is
    procedure add3 (signal bin: in  std_logic_vector (3 downto 0); 
                    signal bcd: out std_logic_vector (3 downto 0)) is
    variable is_gt_4:  std_logic;
    begin
        is_gt_4 := bin(3) or (bin(2) and (bin(1) or bin(0)));

        if is_gt_4 = '1' then         -- if to_integer(unsigned (bin)) > 4 then
            bcd <= std_logic_vector(unsigned(bin) + "0011");
        else
            bcd <= bin;
        end if;
    end procedure;

    signal U0bin,U1bin,U2bin,U3bin,U4bin,U5bin,U6bin:
                std_logic_vector (3 downto 0);

    signal U0bcd,U1bcd,U2bcd,U3bcd,U4bcd,U5bcd,U6bcd:
                std_logic_vector (3 downto 0);       
begin
    U0bin <= '0' & bin (7 downto 5);
    U1bin <= U0bcd(2 downto 0) & bin(4);
    U2bin <= U1bcd(2 downto 0) & bin(3);
    U3bin <= U2bcd(2 downto 0) & bin(2);
    U4bin <= U3bcd(2 downto 0) & bin(1);

    U5bin <= '0' & U0bcd(3) & U1bcd(3) & U2bcd(3);
    U6bin <= U5bcd(2 downto 0) & U3bcd(3);

U0: add3(U0bin,U0bcd);

U1: add3(U1bin,U1bcd);

U2: add3(U2bin,U2bcd);

U3: add3(U3bin,U3bcd);

U4: add3(U4bin,U4bcd);

U5: add3(U5bin,U5bcd);

U6: add3(U6bin,U6bcd);

OUTP:
    bcd <= '0' & '0' & U5bcd(3) & U6bcd & U4bcd & bin(0);

end architecture;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++