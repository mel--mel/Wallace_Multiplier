--WALLACE MULTIPLIER
--AND 8x1
--PROJECT

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity and8x1 is
    port (A: in std_logic_vector(7 downto 0);
        Bbit:in std_logic;
        PP: out std_logic_vector(7 downto 0));
end and8x1;

architecture and8x1_arch of and8x1 is
   begin
       PP(0) <= A(0) and Bbit;            
       PP(1) <= A(1) and Bbit;
       PP(2) <= A(2) and Bbit;
       PP(3) <= A(3) and Bbit;
       PP(4) <= A(4) and Bbit;
       PP(5) <= A(5) and Bbit;
       PP(6) <= A(6) and Bbit;
       PP(7) <= A(7) and Bbit;
       
end and8x1_arch;



