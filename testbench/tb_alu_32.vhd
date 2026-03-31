library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_alu_32 is
end tb_alu_32;

architecture Behavioral of tb_alu_32 is --behavior of the test bench
    signal a           : STD_LOGIC_VECTOR(31 downto 0);
    signal b           : STD_LOGIC_VECTOR(31 downto 0);
    signal alu_control : STD_LOGIC_VECTOR(2 downto 0);
    signal alu_result  : STD_LOGIC_VECTOR(31 downto 0);
    signal zero        : STD_LOGIC;

begin
    uut: entity work.alu_32
        port map (
            a => a,
            b => b,
            alu_control => alu_control,
            alu_result => alu_result,
            zero => zero
        );

    stim_proc: process
    begin
        -- i. Add 2500 + 25000
        a <= std_logic_vector(to_unsigned(2500, 32));
        b <= std_logic_vector(to_unsigned(25000, 32));
        alu_control <= "000";
        wait for 20 ns;

        -- ii. Subtract 540250 - 37800
        a <= std_logic_vector(to_unsigned(540250, 32));
        b <= std_logic_vector(to_unsigned(37800, 32));
        alu_control <= "001";
        wait for 20 ns;

        -- iii. AND 53957 and 30000
        a <= std_logic_vector(to_unsigned(53957, 32));
        b <= std_logic_vector(to_unsigned(30000, 32));
        alu_control <= "010";
        wait for 20 ns;

        -- iv. OR 746353 and 846465
        a <= std_logic_vector(to_unsigned(746353, 32));
        b <= std_logic_vector(to_unsigned(846465, 32));
        alu_control <= "011";
        wait for 20 ns;

        -- v. Compare 58847537 and 72464383
        a <= std_logic_vector(to_unsigned(58847537, 32));
        b <= std_logic_vector(to_unsigned(72464383, 32));
        alu_control <= "100";
        wait for 20 ns;

        wait;
    end process;
end Behavioral;