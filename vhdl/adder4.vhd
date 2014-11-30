--WALLACE MULTIPLIER
--adder4
--PROJECT

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity adder4 is
    port (A, B, C, D: in std_logic_vector(1 downto 0);
        Cin: in std_logic;
        RESULT_A, RESULT_B, RESULT_C, RESULT_D, Cout: out std_logic);
       end adder4;
       
architecture adder4_arch of adder4 is
    component fa                           --ka8e adder4 periexei mesa toy 4 fa
        port (A, B, C: in std_logic;
            SUM, CARRY: out std_logic);
    end component;

signal C0, C1, C2: std_logic;

begin
    fa_0: fa port map (A(0), A(1), Cin, RESULT_A, C0);
    fa_1: fa port map (B(0), B(1), C0, RESULT_B, C1);
    fa_2: fa port map (C(0), C(1), C1, RESULT_C, C2);
    fa_3: fa port map (D(0), D(1), C2, RESULT_D, Cout);
    
end adder4_arch;
    
