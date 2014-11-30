--WALLACE MULTIPLIER
--CSA
--PROJECT

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity CSA is
    port (PH0, PH1, PH2, PH4, PH3: in std_logic;          --eisodoi oi sthles PH
        PH5, PH6, PH7, PH8, PH9, PH10, PH11, PH12, PH13, PH14, PH15: in std_logic_vector(1 downto 0);
        RESULT: out std_logic_vector(15 downto 0));       --eksodos to teliko apotelesma se 16-bit
        
       end CSA;
       
architecture CSA_arch of CSA is
    
    component adder4                                       --xrhsh adder twn 4 bit
       port (A, B, C, D: in std_logic_vector(1 downto 0);
           Cin: in std_logic;
           RESULT_A, RESULT_B, RESULT_C, RESULT_D, Cout: out std_logic);
       end component;

       
    component mux4                                          --xrhsh mux wste na dialeksei to
        port (A0, A1, B0, B1, C0, C1, D0, D1: in std_logic; --swsto apotelesma analoga me to 
            Slct: in std_logic;                             --swsto Cin
            A, B, C, D: out std_logic);
        end component;
     
    component mux                                      --gia na dialeksei to swsto Cin
       port (A, B: in std_logic;
            Slct: in std_logic;
            RESULT: out std_logic);
        end component;    
        
        
    signal Cout0, CoutA, CoutB, CoutC, CoutD, Cout1, x: std_logic;
    signal A_RESULT, B_RESULT, C_RESULT, D_RESULT: std_logic_vector(3 downto 0);  
    
    
    begin
        
        RESULT(0) <= PH0;                    --pairnane aytoysia afoy einai toy 1 bit
        RESULT(1) <= PH1;
        RESULT(2) <= PH2;
        RESULT(3) <= PH3;
        RESULT(4) <= PH4;
        adder4_0: adder4 port map(PH5, PH6, PH7, PH8, '0', RESULT(5), RESULT(6), RESULT(7), RESULT(8), Cout0);
        adder4_A: adder4 port map(PH9, PH10, PH11, PH12, '0', A_RESULT(0), A_RESULT(1), A_RESULT(2), A_RESULT(3), CoutA);
        adder4_B: adder4 port map(PH9, PH10, PH11, PH12, '1', B_RESULT(0), B_RESULT(1), B_RESULT(2), B_RESULT(3), CoutB);
        adder4_C: adder4 port map(PH13, PH14, PH15, PH15 , '0', C_RESULT(0), C_RESULT(1), C_RESULT(2), C_RESULT(3), CoutC);
        adder4_D: adder4 port map(PH13, PH14, PH15, PH15 , '1', D_RESULT(0), D_RESULT(1), D_RESULT(2), D_RESULT(3), CoutD);
        mux0_0: mux4 port map(A_RESULT(0), B_RESULT(0), A_RESULT(1), B_RESULT(1), A_RESULT(2), B_RESULT(2), A_RESULT(3), B_RESULT(3), Cout0, RESULT(9), RESULT(10), RESULT(11), RESULT(12));
        mux_0: mux port map(CoutA, CoutB, Cout0, Cout1);
        mux0_1: mux4 port map(C_RESULT(0), D_RESULT(0), C_RESULT(1), D_RESULT(1), C_RESULT(2), D_RESULT(2), C_RESULT(3), D_RESULT(3), Cout1, RESULT(13), RESULT(14), RESULT(15), x);
        
        
     end CSA_arch;        
            
       
    
