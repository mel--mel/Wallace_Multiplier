--WALLACE MULTIPLIER
--THIRD_LAYER
--PROJECT

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity third_layer is
    port (PM0, PM1, PM2, PM15: in std_logic;                       --eisodoi sthles PM
            PM3, PM4, PM13, PM14: in std_logic_vector(1 downto 0);
            PM5, PM6, PM11, PM12: in std_logic_vector(2 downto 0);
            PM7, PM8, PM9, PM10: in std_logic_vector(3 downto 0);
            PC0, PC1, PC2, PC3, PC15: out std_logic;                --eksodoi sthles PC
            PC4, PC5, PC6, PC14: out std_logic_vector(1 downto 0);
            PC7, PC8, PC9, PC10, PC11, PC12, PC13: out std_logic_vector(2 downto 0));
       end third_layer;
       
architecture third_layer_arch of third_layer is
   
   component fa
       port (A, B, C: in std_logic;
            SUM, CARRY: out std_logic);
    end component;
    
    
    component ha
        port (A, B: in std_logic;
            SUM, CARRY: out std_logic);
    end component;
    
    begin
        
        
        PC0 <= PM0;
        PC1 <= PM1;
        PC2 <= PM2;
        PC15 <= PM15;
        PC14 <= PM14;
        PC13(2 downto 1) <= PM13(1 downto 0);
        PC12(2) <= PM12(2);
        PC11(2) <= PM11(2);
        PC7(2) <= PM7(3);
        PC8(2) <= PM8(3);
        PC9(2) <= PM9(3);
        PC10(2) <= PM10(3);
        
        fa_0: fa port map(PM5(0), PM5(1), PM5(2), PC5(1), PC6(0));
        fa_1: fa port map(PM6(0), PM6(1), PM6(2), PC6(1), PC7(0));
        fa_2: fa port map(PM7(0), PM7(1), PM7(2), PC7(1), PC8(0));
        fa_3: fa port map(PM8(0), PM8(1), PM8(2), PC8(1), PC9(0));
        fa_4: fa port map(PM9(0), PM9(1), PM9(2), PC9(1), PC10(0));
        fa_5: fa port map(PM10(0), PM10(1), PM10(2), PC10(1), PC11(0));
        
        ha_0: ha port map(PM3(0), PM3(1), PC3, PC4(0));
        ha_1: ha port map(PM4(0), PM4(1), PC4(1), PC5(0));
        ha_2: ha port map(PM11(0), PM11(1), PC11(1), PC12(0));
        ha_3: ha port map(PM12(0), PM12(1), PC12(1), PC13(0));
               
    end third_layer_arch;
     
        
