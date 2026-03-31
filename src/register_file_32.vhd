library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity register_file_32 is
    Port (
        clk             : in  STD_LOGIC; --clock signal
        rst             : in  STD_LOGIC; --reset signal
        reg_write_en    : in  STD_LOGIC; --register write enable
        reg_write_dest  : in  STD_LOGIC_VECTOR(2 downto 0); --3-bit destination register address
        reg_write_data  : in  STD_LOGIC_VECTOR(31 downto 0); --32-bit data to write to register
        reg_read_addr_1 : in  STD_LOGIC_VECTOR(2 downto 0); --3-bit first read register address
        reg_read_addr_2 : in  STD_LOGIC_VECTOR(2 downto 0); --3-bit second read register address
        reg_read_data_1 : out STD_LOGIC_VECTOR(31 downto 0); --32-bit first read data
        reg_read_data_2 : out STD_LOGIC_VECTOR(31 downto 0)  --32-bit second read data
    );
end register_file_32;

architecture Behavioral of register_file_32 is
    type reg_array_type is array (0 to 7) of STD_LOGIC_VECTOR(31 downto 0);
    signal reg_array : reg_array_type := (others => (others => '0'));
begin

    -- synchronous reset and write
    process(clk, rst)
    begin
        if rst = '1' then
            reg_array(0) <= (others => '0');
            reg_array(1) <= (others => '0');
            reg_array(2) <= (others => '0');
            reg_array(3) <= (others => '0');
            reg_array(4) <= (others => '0');
            reg_array(5) <= (others => '0');
            reg_array(6) <= (others => '0');
            reg_array(7) <= (others => '0');
        elsif rising_edge(clk) then
            if reg_write_en = '1' then
                reg_array(to_integer(unsigned(reg_write_dest))) <= reg_write_data;
            end if;
        end if;
    end process;

    -- asynchronous read
    reg_read_data_1 <= reg_array(to_integer(unsigned(reg_read_addr_1)));
    reg_read_data_2 <= reg_array(to_integer(unsigned(reg_read_addr_2)));

end Behavioral;