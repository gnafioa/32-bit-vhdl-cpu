library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_instruction_memory_32 is
end tb_instruction_memory_32;

architecture Behavioral of tb_instruction_memory_32 is
    signal pc          : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal instruction : STD_LOGIC_VECTOR(31 downto 0);
begin

    uut: entity work.instruction_memory_32
        port map (
            pc => pc,
            instruction => instruction
        );

    stim_proc: process
    begin
        -- Address 0
        pc <= std_logic_vector(to_unsigned(0, 32));
        wait for 20 ns;

        -- Address 2
        pc <= std_logic_vector(to_unsigned(2, 32));
        wait for 20 ns;

        -- Address 4
        pc <= std_logic_vector(to_unsigned(4, 32));
        wait for 20 ns;

        -- Address 6
        pc <= std_logic_vector(to_unsigned(6, 32));
        wait for 20 ns;

        wait;
    end process;

end Behavioral;