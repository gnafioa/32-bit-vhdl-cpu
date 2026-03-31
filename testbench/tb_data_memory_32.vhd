library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_data_memory_32 is
end tb_data_memory_32;

architecture Behavioral of tb_data_memory_32 is
    signal clk             : STD_LOGIC := '0';
    signal mem_access_addr : STD_LOGIC_VECTOR(31 downto 0);
    signal mem_write_data  : STD_LOGIC_VECTOR(31 downto 0);
    signal mem_write_en    : STD_LOGIC;
    signal mem_read        : STD_LOGIC;
    signal mem_read_data   : STD_LOGIC_VECTOR(31 downto 0);

begin
    uut: entity work.data_memory_32
        port map (
            clk => clk,
            mem_access_addr => mem_access_addr,
            mem_write_data => mem_write_data,
            mem_write_en => mem_write_en,
            mem_read => mem_read,
            mem_read_data => mem_read_data
        );

    clk_process: process
    begin
        while true loop
            clk <= '0'; wait for 10 ns;
            clk <= '1'; wait for 10 ns;
        end loop;
    end process;

    stim_proc: process
    begin
        -- Write 1024 to address 2
        mem_access_addr <= std_logic_vector(to_unsigned(2, 32));
        mem_write_data  <= std_logic_vector(to_unsigned(1024, 32));
        mem_write_en    <= '1';
        mem_read        <= '0';
        wait for 20 ns;

        -- Read address 2
        mem_write_en    <= '0';
        mem_read        <= '1';
        wait for 20 ns;

        -- Write 429496 to address 4
        mem_access_addr <= std_logic_vector(to_unsigned(4, 32));
        mem_write_data  <= std_logic_vector(to_unsigned(429496, 32));
        mem_write_en    <= '1';
        mem_read        <= '0';
        wait for 20 ns;

        -- Read address 4
        mem_write_en    <= '0';
        mem_read        <= '1';
        wait for 20 ns;

        wait;
    end process;
end Behavioral;