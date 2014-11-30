--WALLACE MULTIPLIER
--FOURTH_LAYER
--PROJECT

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity fourth_layer is
    port (PC0, PC1, PC2, PC3, PC15: in std_logic;                          --eisodoi sthles PC
            PC4, PC5, PC6, PC14: in std_logic_vector(1 downto 0);
            PC7, PC8, PC9, PC10, PC11, PC12, PC13: in std_logic_vector(2 downto 0);
            PH0, PH1, PH2, PH4, PH3: out std_logic;                        --eksodoi sth;es PH
            PH5, PH6, PH7, PH8, PH9, PH10, PH11, PH12, PH13, PH14, PH15: out std_logic_vector(1 downto 0));
      end fourth_layer;
       
architecture fourth_layer_arch of fourth_layer is
    
    component fa
       port (A, B, C: in std_logic;
            SUM, CARRY: out std_logic);
       end component;
       
    
    component ha
        port (A, B: in std_logic;
            SUM, CARRY: out std_logic);
    end component;
        
    begin
        
        
        PH0 <= PC0;
        PH1 <= PC1;
        PH2 <= PC2;
        PH3 <= PC3;
        PH15(1) <= PC15;
        
        fa_0: fa port map(PC7(0), PC7(1), PC7(2), PH7(1), PH8(0));
        fa_1: fa port map(PC8(0), PC8(1), PC8(2), PH8(1), PH9(0));
        fa_2: fa port map(PC9(0), PC9(1), PC9(2), PH9(1), PH10(0));
        fa_3: fa port map(PC10(0), PC10(1), PC10(2), PH10(1), PH11(0));
        fa_4: fa port map(PC11(0), PC11(1), PC11(2), PH11(1), PH12(0));
        fa_5: fa port map(PC12(0), PC12(1), PC12(2), PH12(1), PH13(0));
        fa_6: fa port map(PC13(0), PC13(1), PC13(2), PH13(1), PH14(0));
        
        ha_0: ha port map(PC4(0), PC4(1), PH4, PH5(0));
        ha_1: ha port map(PC5(0), PC5(1), PH5(1), PH6(0));
        ha_2: ha port map(PC6(0), PC6(1), PH6(1), PH7(0));
        ha_3: ha port map(PC14(0), PC14(1), PH14(1), PH15(0));
        
               
    end fourth_layer_arch;
     
        

