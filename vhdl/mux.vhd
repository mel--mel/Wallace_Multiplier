--WALLACE MULTIPLIER
--mux
--PROJECT

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity mux is
    port (A, B: in std_logic;
        Slct: in std_logic;
        RESULT: out std_logic);
        end mux;
       
architecture mux_arch of mux is
    

begin
    
    RESULT <= ((A and (not(Slct))) or (B and Slct));
    
    
end mux_arch;
    


