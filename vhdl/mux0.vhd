--WALLACE MULTIPLIER
--mux4
--PROJECT

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity mux4 is
    port (A0, A1, B0, B1, C0, C1, D0, D1: in std_logic;
        Slct: in std_logic;
        A, B, C, D: out std_logic);
        end mux4;
       
architecture mux4_arch of mux4 is
    component mux                            --ka8e mux4 periexei mesa 4 mux
        port (A, B: in std_logic;
            Slct: in std_logic;
            RESULT: out std_logic);
    end component;

begin
    mux_0: mux port map (A0, A1, Slct, A);
    mux_1: mux port map (B0, B1, Slct, B);
    mux_2: mux port map (C0, C1, Slct, C);
    mux_3: mux port map (D0, D1, Slct, D);
    
end mux4_arch;
    

