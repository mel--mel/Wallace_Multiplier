--WALLACE MULTIPLIER
--AND 8x8
--PROJECT

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity and8x8 is
    port (A,B: in std_logic_vector(7 downto 0);
           PP1, PP2, PP3, PP4, PP5, PP6: out std_logic_vector(7 downto 0);
           PP0, PP7: out std_logic_vector(8 downto 0));
end and8x8;

architecture and8x8_arch of and8x8 is
   component and8x1                              --xreiazomaste and8x1 wste na bgaloyme 
       port (A: in std_logic_vector(7 downto 0); --tis grammes merikwn ginomenwn PP
           Bbit: in std_logic;
           PP: out std_logic_vector(7 downto 0));
    end component;
    
    signal x: std_logic_vector(7 downto 0);
    signal pp_0: std_logic_vector(7 downto 0);
    signal pp_1: std_logic_vector(7 downto 0);
    signal pp_2: std_logic_vector(7 downto 0);
    signal pp_3: std_logic_vector(7 downto 0);
    signal pp_4: std_logic_vector(7 downto 0);
    signal pp_5: std_logic_vector(7 downto 0);
    signal pp_6: std_logic_vector(7 downto 0);
    signal pp_7: std_logic_vector(7 downto 0);
    
    begin
        and8x1_0: and8x1 port map(A, B(0), pp_0);
        and8x1_1: and8x1 port map(A, B(1), pp_1);
        and8x1_2: and8x1 port map(A, B(2), pp_2);
        and8x1_3: and8x1 port map(A, B(3), pp_3);
        and8x1_4: and8x1 port map(A, B(4), pp_4);
        and8x1_5: and8x1 port map(A, B(5), pp_5);
        and8x1_6: and8x1 port map(A, B(6), pp_6);
        and8x1_7: and8x1 port map(A, B(7), pp_7);
        
        PP0(8) <= '1';                         --algori8mos Baugh-Wooley
        PP7(8) <= '1';                         --gia ton pollaplasiasmo proshmasmenwn 
        PP0(6 downto 0) <= pp_0(6 downto 0);   --2's complement
        PP1(6 downto 0) <= pp_1(6 downto 0);
        PP2(6 downto 0) <= pp_2(6 downto 0);
        PP3(6 downto 0) <= pp_3(6 downto 0);
        PP4(6 downto 0) <= pp_4(6 downto 0);
        PP5(6 downto 0) <= pp_5(6 downto 0);
        PP6(6 downto 0) <= pp_6(6 downto 0);
        PP7(7) <= pp_7(7);
        
        x <= not(pp_7);
        PP7(0) <= not(pp_0(7));
        PP0(7) <= x(0);
        PP7(1) <= not(pp_1(7));
        PP1(7) <= x(1);
        PP7(2) <= not(pp_2(7));
        PP2(7) <= x(2);
        PP7(3) <= not(pp_3(7));
        PP3(7) <= x(3);
        PP7(4) <= not(pp_4(7));
        PP4(7) <= x(4);
        PP7(5) <= not(pp_5(7));
        PP5(7) <= x(5);
        PP7(6) <= not(pp_6(7));
        PP6(7) <= x(6);
        
end and8x8_arch;
        
        
        
