--WALLACE MULTIPLIER
--PROJECT

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    
entity wallace_mult is
    port (A: in std_logic_vector(7 downto 0);        --eisodos A twn 8-bit
        B: in std_logic_vector(7 downto 0);          --eisodos B twn 8-bit
        RESULT: out std_logic_vector(15 downto 0));  --teliko apotelesma pol/smoy 16-bit 
end wallace_mult;

architecture wallace_mult_arch of wallace_mult is
   component and8x8                                   --xrhsh and8x8 gia na bgaloyme
       port (A,B: in std_logic_vector(7 downto 0);    --ta 64 merika ginomena
           PP1, PP2, PP3, PP4, PP5, PP6: out std_logic_vector(7 downto 0);
           PP0, PP7: out std_logic_vector(8 downto 0));
    end component;
    
    component first_layer                                                    --xrhsh fa kai ha gia na  
        port (PP1, PP2, PP3, PP4, PP5, PP6: in std_logic_vector(7 downto 0); --meiw8oun ta PP ews otou 
            PP0, PP7: in std_logic_vector(8 downto 0);                       --sto fourth_layer
            PT0, PT1, PT14, PT15: out std_logic;                             --ftasoyme tis 2 grammes
            PT2, PT13: out std_logic_vector(1 downto 0);
            PT3, PT4: out std_logic_vector(2 downto 0);
            PT5, PT10, PT11, PT12: out std_logic_vector(3 downto 0);
            PT6: out std_logic_vector(4 downto 0);
            PT7, PT8, PT9: out std_logic_vector(5 downto 0));
        end component;
    
    component second_layer
        port (PT0, PT1, PT14, PT15: in std_logic;
            PT2, PT13: in std_logic_vector(1 downto 0);
            PT3, PT4: in std_logic_vector(2 downto 0);
            PT5, PT10, PT11, PT12: in std_logic_vector(3 downto 0);
            PT6: in std_logic_vector(4 downto 0);
            PT7, PT8, PT9: in std_logic_vector(5 downto 0);
            PM0, PM1, PM2, PM15: out std_logic;
            PM3, PM4, PM13, PM14: out std_logic_vector(1 downto 0);
            PM5, PM6, PM11, PM12: out std_logic_vector(2 downto 0);
            PM7, PM8, PM9, PM10: out std_logic_vector(3 downto 0));
        end component;
        
    component third_layer
        port (PM0, PM1, PM2, PM15: in std_logic;
            PM3, PM4, PM13, PM14: in std_logic_vector(1 downto 0);
            PM5, PM6, PM11, PM12: in std_logic_vector(2 downto 0);
            PM7, PM8, PM9, PM10: in std_logic_vector(3 downto 0);
            PC0, PC1, PC2, PC3, PC15: out std_logic;
            PC4, PC5, PC6, PC14: out std_logic_vector(1 downto 0);
            PC7, PC8, PC9, PC10, PC11, PC12, PC13: out std_logic_vector(2 downto 0));        
        end component;
        
    component fourth_layer
        port (PC0, PC1, PC2, PC3, PC15: in std_logic;
            PC4, PC5, PC6, PC14: in std_logic_vector(1 downto 0);
            PC7, PC8, PC9, PC10, PC11, PC12, PC13: in std_logic_vector(2 downto 0);
            PH0, PH1, PH2, PH4, PH3: out std_logic;
            PH5, PH6, PH7, PH8, PH9, PH10, PH11, PH12, PH13, PH14, PH15: out std_logic_vector(1 downto 0));
        end component;
        
   component CSA                                             --xrhsh Carry Select Adder
        port (PH0, PH1, PH2, PH4, PH3: in std_logic;         --wste na pros8esoyme ta PH5-PH15
            PH5, PH6, PH7, PH8, PH9, PH10, PH11, PH12, PH13, PH14, PH15: in std_logic_vector(1 downto 0);
            RESULT: out std_logic_vector(15 downto 0));
        end component; 
    
    signal pp_0: std_logic_vector(8 downto 0);
    signal pp_1: std_logic_vector(7 downto 0);
    signal pp_2: std_logic_vector(7 downto 0);
    signal pp_3: std_logic_vector(7 downto 0);
    signal pp_4: std_logic_vector(7 downto 0);
    signal pp_5: std_logic_vector(7 downto 0);
    signal pp_6: std_logic_vector(7 downto 0);
    signal pp_7: std_logic_vector(8 downto 0);
   
    signal PT_0, PT_1, PT_14, PT_15: std_logic;
    signal PT_2, PT_13: std_logic_vector(1 downto 0);
    signal PT_3, PT_4: std_logic_vector(2 downto 0);
    signal PT_5, PT_10, PT_11, PT_12: std_logic_vector(3 downto 0);
    signal PT_6: std_logic_vector(4 downto 0);
    signal PT_7, PT_8, PT_9: std_logic_vector(5 downto 0);
    
    signal PM_0, PM_1, PM_2, PM_15: std_logic;
    signal PM_3, PM_4, PM_13, PM_14: std_logic_vector(1 downto 0);
    signal PM_5, PM_6, PM_11, PM_12: std_logic_vector(2 downto 0);
    signal PM_7, PM_8, PM_9, PM_10: std_logic_vector(3 downto 0);
    
    signal PC_0, PC_1, PC_2, PC_3, PC_15: std_logic;
    signal PC_4, PC_5, PC_6, PC_14: std_logic_vector(1 downto 0);
    signal PC_7, PC_8, PC_9, PC_10, PC_11, PC_12, PC_13: std_logic_vector(2 downto 0);
    
    signal PH_0, PH_1, PH_2, PH_4, PH_3: std_logic;
    signal PH_5, PH_6, PH_7, PH_8, PH_9, PH_10, PH_11, PH_12, PH_13, PH_14, PH_15: std_logic_vector(1 downto 0);


    
    begin
        and8x8_map: and8x8 port map (A, B, PP_1, pp_2, pp_3, pp_4, pp_5, pp_6, pp_0, pp_7);
        first_layer_map: first_layer port map (PP_1, PP_2, PP_3, PP_4, PP_5, PP_6, PP_0, PP_7,
                                        PT_0, PT_1, PT_14, PT_15, PT_2, PT_13, 
                                        PT_3, PT_4, PT_5, PT_10, PT_11, PT_12,PT_6,
                                        PT_7, PT_8, PT_9);
        second_layer_map: second_layer port map (PT_0, PT_1, PT_14, PT_15, PT_2, PT_13, PT_3, 
                                         PT_4, PT_5, PT_10, PT_11, PT_12,PT_6, 
                                         PT_7, PT_8, PT_9, PM_0, PM_1, PM_2, PM_15, PM_3,
                                         PM_4, PM_13, PM_14, PM_5, PM_6, PM_11, PM_12, 
                                         PM_7, PM_8, PM_9, PM_10);
        third_layer_map: third_layer port map (PM_0, PM_1, PM_2, PM_15, PM_3,PM_4, PM_13, 
                                       PM_14, PM_5, PM_6, PM_11, PM_12, PM_7, PM_8, PM_9, 
                                       PM_10, PC_0, PC_1, PC_2,PC_3, PC_15,
                                       PC_4, PC_5, PC_6, PC_14, 
                                       PC_7, PC_8, PC_9, PC_10, PC_11, PC_12, PC_13);
        fourth_layer_map: fourth_layer port map (PC_0, PC_1, PC_2, PC_3, PC_15, PC_4, PC_5, PC_6, 
                                       PC_14, PC_7, PC_8, PC_9, PC_10, PC_11, PC_12, PC_13, 
                                       PH_0, PH_1, PH_2, PH_4, PH_3, PH_5, PH_6, PH_7, PH_8, 
                                       PH_9, PH_10, PH_11, PH_12, PH_13, PH_14, PH_15);
        CSA_map: CSA port map (PH_0, PH_1, PH_2, PH_4, PH_3, PH_5, PH_6, PH_7, PH_8, 
                        PH_9, PH_10, PH_11, PH_12, PH_13, PH_14, PH_15, RESULT);

    
end wallace_mult_arch;