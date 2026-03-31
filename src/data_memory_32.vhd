library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity data_memory_32 is
    Port (
        clk             : in  STD_LOGIC;
        mem_access_addr : in  STD_LOGIC_VECTOR(31 downto 0);
        mem_write_data  : in  STD_LOGIC_VECTOR(31 downto 0);
        mem_write_en    : in  STD_LOGIC;
        mem_read        : in  STD_LOGIC;
        mem_read_data   : out STD_LOGIC_VECTOR(31 downto 0)
    );
end data_memory_32;

architecture Behavioral of data_memory_32 is
    type data_mem_type is array (0 to 255) of STD_LOGIC_VECTOR(31 downto 0);
    signal RAM : data_mem_type := (others => (others => '0'));
    signal ram_addr : integer range 0 to 255;
begin
    ram_addr <= to_integer(unsigned(mem_access_addr(7 downto 0)));

    process(clk)
    begin
        if rising_edge(clk) then
            if mem_write_en = '1' then
                RAM(ram_addr) <= mem_write_data;
            end if;

            if mem_read = '1' then
                mem_read_data <= RAM(ram_addr);
            else
                mem_read_data <= (others => '0');
            end if;
        end if;
    end process;
end Behavioral;