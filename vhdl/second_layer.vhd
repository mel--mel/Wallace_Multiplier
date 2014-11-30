--WALLACE MULTIPLIER
--SECOND_LAYER
--PROJECT

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity second_layer is
    port (PT0, PT1, PT14, PT15: in std_logic;                 --eisodoi oi sthles PT
        PT2, PT13: in std_logic_vector(1 downto 0);
        PT3, PT4: in std_logic_vector(2 downto 0);
        PT5, PT10, PT11, PT12: in std_logic_vector(3 downto 0);
        PT6: in std_logic_vector(4 downto 0);
        PT7, PT8, PT9: in std_logic_vector(5 downto 0);
        PM0, PM1, PM2, PM15: out std_logic;                    --eksodoi oi sthles PM 
        PM3, PM4, PM13, PM14: out std_logic_vector(1 downto 0);
        PM5, PM6, PM11, PM12: out std_logic_vector(2 downto 0);
        PM7, PM8, PM9, PM10: out std_logic_vector(3 downto 0));
       end second_layer;
       
architecture second_layer_arch of second_layer is
   
   component fa
       port (A, B, C: in std_logic;
            SUM, CARRY: out std_logic);
    end component;
    
    
    component ha
        port (A, B: in std_logic;
            SUM, CARRY: out std_logic);
    end component;
    
    begin
        
        PM0 <= PT0;
        PM1 <= PT1;
        ha_0: ha port map(PT2(0), PT2(1), PM2, PM3(0));
        fa_0: fa port map(PT3(0), PT3(1), PT3(2), PM3(1), PM4(0));
        fa_1: fa port map(PT4(0), PT4(1), PT4(2), PM4(1), PM5(0));
        fa_2: fa port map(PT5(0), PT5(1), PT5(2), PM5(1), PM6(0));
        PM5(2) <= PT5(3);
        fa_3: fa port map(PT6(0), PT6(1), PT6(2), PM6(1), PM7(0));
        ha_1: ha port map(PT6(3), PT6(4), PM6(2), PM7(1));
        fa_4: fa port map(PT7(0), PT7(1), PT7(2), PM7(2), PM8(0));
        fa_5: fa port map(PT7(3), PT7(4), PT7(5), PM7(3), PM8(1));
        fa_6: fa port map(PT8(0), PT8(1), PT8(2), PM8(2), PM9(0));
        fa_7: fa port map(PT8(3), PT8(4), PT8(5), PM8(3), PM9(1));
        fa_8: fa port map(PT9(0), PT9(1), PT9(2), PM9(2), PM10(0));
        fa_9: fa port map(PT9(3), PT9(4), PT9(5), PM9(3), PM10(1));
        fa_10: fa port map(PT10(0), PT10(1), PT10(2), PM10(2), PM11(0));
        PM10(3) <= PT10(3);
        fa_11: fa port map(PT11(0), PT11(1), PT11(2), PM11(1), PM12(0));
        PM11(2) <= PT11(3);
        fa_12: fa port map(PT12(0), PT12(1), PT12(2), PM12(1), PM13(0));
        PM12(2) <= PT12(3);
        ha_2: ha port map(PT13(0), PT13(1), PM13(1), PM14(0));
        PM14(1) <= PT14;
        PM15 <= PT15;
               
    end second_layer_arch;
