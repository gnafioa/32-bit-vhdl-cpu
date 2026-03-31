library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_register_file_32 is
end tb_register_file_32;

architecture Behavioral of tb_register_file_32 is
    signal clk             : STD_LOGIC := '0';
    signal rst             : STD_LOGIC := '0';
    signal reg_write_en    : STD_LOGIC := '0';
    signal reg_write_dest  : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal reg_write_data  : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal reg_read_addr_1 : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal reg_read_addr_2 : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal reg_read_data_1 : STD_LOGIC_VECTOR(31 downto 0);
    signal reg_read_data_2 : STD_LOGIC_VECTOR(31 downto 0);
begin

    uut: entity work.register_file_32
        port map (
            clk             => clk,
            rst             => rst,
            reg_write_en    => reg_write_en,
            reg_write_dest  => reg_write_dest,
            reg_write_data  => reg_write_data,
            reg_read_addr_1 => reg_read_addr_1,
            reg_read_addr_2 => reg_read_addr_2,
            reg_read_data_1 => reg_read_data_1,
            reg_read_data_2 => reg_read_data_2
        );

    -- clock generation
    clk_process: process
    begin
        while true loop
            clk <= '0'; wait for 10 ns;
            clk <= '1'; wait for 10 ns;
        end loop;
    end process;

    stim_proc: process
    begin
        -- reset
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        wait for 20 ns;

        -- Write Register 1 = 1934858
        reg_write_en   <= '1';
        reg_write_dest <= "001";
        reg_write_data <= std_logic_vector(to_unsigned(1934858, 32));
        wait for 20 ns;

        -- Write Register 3 = 8558447
        reg_write_dest <= "011";
        reg_write_data <= std_logic_vector(to_unsigned(8558447, 32));
        wait for 20 ns;

        -- Write Register 5 = 203848544
        reg_write_dest <= "101";
        reg_write_data <= std_logic_vector(to_unsigned(203848544, 32));
        wait for 20 ns;

        -- Write Register 7 = 20670420
        reg_write_dest <= "111";
        reg_write_data <= std_logic_vector(to_unsigned(20670420, 32));
        wait for 20 ns;

        -- disable write before reading
        reg_write_en <= '0';

        -- Read R1 and R3
        reg_read_addr_1 <= "001";
        reg_read_addr_2 <= "011";
        wait for 20 ns;

        -- Read R5 and R7
        reg_read_addr_1 <= "101";
        reg_read_addr_2 <= "111";
        wait for 20 ns;

        wait;
    end process;

end Behavioral;