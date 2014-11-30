--WALLACE MULTIPLIER
--FIRST LAYER
--PROJECT

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity first_layer is
    port (PP1, PP2, PP3, PP4, PP5, PP6: in std_logic_vector(7 downto 0); --eisodoi oi grammes PP
        PP0, PP7: in std_logic_vector(8 downto 0);
        PT0, PT1, PT14, PT15: out std_logic;               --eksodoi sthles PT me diaforetiko varos
        PT2, PT13: out std_logic_vector(1 downto 0);
        PT3, PT4: out std_logic_vector(2 downto 0);
        PT5, PT10, PT11, PT12: out std_logic_vector(3 downto 0);
        PT6: out std_logic_vector(4 downto 0);
        PT7, PT8, PT9: out std_logic_vector(5 downto 0));
end first_layer;

architecture first_layer_arch of first_layer is
   component fa
       port (A, B, C: in std_logic;
           SUM, CARRY: out std_logic);
    end component;
    
    component ha
       port (A, B: in std_logic;
           SUM, CARRY: out std_logic);
    end component;
    
    begin
        PT0 <= PP0(0);                                                --opoio einai mono tou, metaferetai aytoysio sto epomeno layer
        ha_0: ha port map (PP0(1), PP1(0), PT1, PT2(0));              --2 eisodoi poy den prokeitai na ginoyn 3 se epomeno layer,a8roizontai me ha
        fa_0: fa port map (PP0(2), PP1(1), PP2(0), PT2(1), PT3(0));   --3 eisodoi a8roizontai me fa
        fa_1: fa port map (PP0(3), PP1(2), PP2(1), PT3(1), PT4(0));
        PT3(2) <= PP3(0);
        fa_2: fa port map (PP0(4), PP1(3), PP2(2), PT4(1), PT5(0));
        ha_1: ha port map (PP3(1), PP4(0), PT4(2), PT5(1));
        fa_3: fa port map (PP0(5), PP1(4), PP2(3), PT5(2), PT6(0));
        fa_4: fa port map (PP3(2), PP4(1), PP5(0), PT5(3), PT6(1));
        fa_5: fa port map (PP0(6), PP1(5), PP2(4), PT6(2), PT7(0));
        fa_6: fa port map (PP3(3), PP4(2), PP5(1), PT6(3), PT7(1));
        PT6(4) <= PP6(0);
        fa_7: fa port map (PP0(7), PP1(6), PP2(5), PT7(2), PT8(0));
        fa_8: fa port map (PP3(4), PP4(3), PP5(2), PT7(3), PT8(1));
        PT7(4) <= PP6(1);
        PT7(5) <= PP7(0);
        fa_9: fa port map (PP0(8), PP1(7), PP2(6), PT8(2), PT9(0));
        fa_10: fa port map (PP3(5), PP4(4), PP5(3), PT8(3), PT9(1));
        PT8(4) <= PP6(2);
        PT8(5) <= PP7(1); 
        PT9(2) <= PP2(7);
        fa_11: fa port map (PP3(6), PP4(5), PP5(4), PT9(3), PT10(0));
        PT9(4) <= PP6(3); 
        PT9(5) <= PP7(2);
        fa_12: fa port map (PP3(7), PP4(6), PP5(5), PT10(1), PT11(0));
        PT10(2) <= PP6(4); 
        PT10(3) <= PP7(3);
        ha_2: ha port map (PP4(7), PP5(6), PT11(1), PT12(0));
        PT11(2) <= PP6(5); 
        PT11(3) <= PP7(4);
        PT12(1) <= PP5(7); 
        PT12(2) <= PP6(6);
        PT12(3) <= PP7(5); 
        PT13(0) <= PP6(7);
        PT13(1) <= PP7(6); 
        PT14 <= PP7(7);
        PT15 <= PP7(8);
        
end first_layer_arch;