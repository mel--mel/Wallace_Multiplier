--WALLACE MULTIPLIER
--FULL ADDER
--PROJECT

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity fa is
    port (A, B, C: in std_logic;
        SUM, CARRY: out std_logic);
       end fa;
       
architecture full_adder_arch of fa is
    begin
        SUM <= (A xor B xor C);
        CARRY <= (A and B)or (C and (A xor B));
    end full_adder_arch;

--WALLACE MULTIPLIER
--HALF ADDER
--PROJECT

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity ha is
    port (A, B: in std_logic;
        SUM, CARRY: out std_logic);
       end ha;
       
architecture half_adder_arch of ha is
    begin
        SUM <= (A xor B);
        CARRY <= (A and B);
    end half_adder_arch;
