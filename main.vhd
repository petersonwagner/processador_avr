	----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:01:01 06/06/2017 
-- Design Name: 
-- Module Name:    main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main is
    Port (clk: in std_logic;
			SWITCH7, SWITCH6, SWITCH5, SWITCH4, SWITCH3, SWITCH2, SWITCH1, SWITCH0 : IN STD_LOGIC;
			BUTTON3, BUTTON2, BUTTON1, BUTTON0: in std_logic;
			CA,CB,CC,CD,CE,CF,CG,DP,AN0,AN1,AN2,AN3:	out std_logic;
        	LED7, LED6, LED5, LED4, LED3, LED2, LED1, LED0 : out STD_LOGIC);
end main;

architecture Behavioral of main is

	component divisor_frequencia is
	    port (
	        clk_in:    in  std_logic;
	        clk_out:   out std_logic);
	end component divisor_frequencia;
	
	component REGISTERS is
    port (clk         : in  std_logic;
          wr_en       : in  std_logic;
          r_a,r_b,r_c : in  std_logic_vector (4 downto 0);
          A,B         : out std_logic_vector (7 downto 0);
          C           : in  std_logic_vector (7 downto 0));
	end component REGISTERS;

	component mem_prog is
  		port (address : in STD_LOGIC_vector(7 downto 0);
    	instr : out std_logic_vector(22 downto 0));
	end component mem_prog;

	component ULA is
	  port (fun : in  std_logic_vector(4 downto 0);
	        alfa,beta : in  std_logic_vector(7 downto 0);
	        gama      : out std_logic_vector(7 downto 0);
	        zero	  : out std_logic);
	end component ULA;

	component registrador8 is
	  port(rel, rst, ld: in  std_logic;
	        D:           in  std_logic_vector(7 downto 0);
	        Q:           out std_logic_vector(7 downto 0));
	end component registrador8;

	component adder8 is
	  port(inpA, inpB : in std_logic_vector(7 downto 0);
	       outC : out std_logic_vector(7 downto 0);
	       vem  : in std_logic;
	       vai  : out std_logic);
	end component adder8;

	component ram_memory is
	port (clk : in std_logic;
	        address : in std_logic_vector(7 downto 0);
	        wr : in std_logic;
	        data_i : in std_logic_vector(7 downto 0);
	        data_o : out std_logic_vector(7 downto 0));
	end component ram_memory;

	component control_unit is
	port (	instruction: in std_logic_vector (4 downto 0);
			pc_en, beq, jump, sel_wr_reg_addr, wr_reg_en, sel_beta, wr_ram_en, sel_wr_reg_data, en_display: out std_logic);
	end component control_unit;

	component display_handler is
	    port (
	        bin:    in  std_logic_vector (7 downto 0);
	        clk, enable:	in std_logic;
	        a,b,c,d,e,f,g,an0,an1,an2,an3: out std_logic);
	end component display_handler;

	signal clk1: std_logic;
	signal LEDS, SWITCHS: std_logic_VECTOR (7 downto 0);
	signal new_ip, ip, nxtip: std_logic_VECTOR (7 downto 0);
	signal instr: std_logic_vector (22 downto 0);
	
	signal pc_en, beq, jump, sel_wr_reg_addr, wr_reg_en, sel_beta, wr_ram_en, sel_wr_reg_data, en_display, zero: std_logic;
	signal wr_reg_addr: std_logic_vector (4 downto 0);
	signal wr_reg_data: std_logic_vector (7 downto 0);

	signal ALFA, B, BETA, ULA_OUT, RAM_OUT: std_logic_vector (7 downto 0);
begin

	SWITCHS(7) <= SWITCH7;
	SWITCHS(6) <= SWITCH6;
	SWITCHS(5) <= SWITCH5;
	SWITCHS(4) <= SWITCH4;
	SWITCHS(3) <= SWITCH3;
	SWITCHS(2) <= SWITCH2;
	SWITCHS(1) <= SWITCH1;
	SWITCHS(0) <= SWITCH0;


	Ufreqdiv: divisor_frequencia port map (clk, clk1);


	program_counter: registrador8 port map (clk1, '1', pc_en, new_ip, ip);
	next_ip: adder8 port map (ip, "00000001", nxtip, '0', open);
	new_ip <=	instr(7 downto 0) when ((zero = '1' and beq = '1') or jump = '1') else nxtip;

	instr_reg: mem_prog port map (ip, instr);

	Ucontrol: control_unit port map (instr(22 downto 18), pc_en, beq, jump, sel_wr_reg_addr, wr_reg_en, sel_beta, wr_ram_en, sel_wr_reg_data, en_display);

	wr_reg_addr <=	instr(17 downto 13) when sel_wr_reg_addr = '0' else
					instr(12 downto 8) when sel_wr_reg_addr = '1';
	regs: REGISTERS port map (clk1, wr_reg_en, instr(17 downto 13), instr(12 downto 8), wr_reg_addr, ALFA, B, wr_reg_data);

	BETA <= B when sel_beta = '0' else instr(7 downto 0) when sel_beta = '1';

	Uula: ULA port map (instr(22 downto 18), ALFA, BETA, ULA_OUT, zero);

	URAM: ram_memory port map (clk1, ULA_OUT, wr_ram_en, B, RAM_OUT);

	wr_reg_data <= RAM_OUT when sel_wr_reg_data = '0' else ULA_OUT when sel_wr_reg_data = '1';

	LEDS <= ip;
	DP <= '0';
	Udisplay: display_handler port map (ALFA, clk, en_display, CA,CB,CC,CD,CE,CF,CG,AN0,AN1,AN2,AN3);


	LED7 <= LEDS(7);
	LED6 <= LEDS(6);
	LED5 <= LEDS(5);
	LED4 <= LEDS(4);
	LED3 <= LEDS(3);
	LED2 <= LEDS(2);
	LED1 <= LEDS(1);
	LED0 <= LEDS(0);


end Behavioral;


-------------