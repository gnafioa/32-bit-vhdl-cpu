library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity instruction_memory_32 is
    Port (
        pc          : in  STD_LOGIC_VECTOR(31 downto 0);
        instruction : out STD_LOGIC_VECTOR(31 downto 0)
    );
end instruction_memory_32;

architecture Behavioral of instruction_memory_32 is
    type rom_type is array (0 to 255) of STD_LOGIC_VECTOR(31 downto 0);
    constant ROM : rom_type := (
        0 => x"00650820", -- add $t0, $t1, $t2
        2 => x"00A72822", -- sub $t2, $t2, $t3
        4 => x"00A11824", -- and $t1, $t2, $t0
        6 => x"00E32825", -- or  $t2, $t3, $t1
        others => x"00000000"
    );
begin
    instruction <= ROM(to_integer(unsigned(pc(7 downto 0))));
end Behavioral;