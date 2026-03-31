library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_32 is
    Port (
        a           : in  STD_LOGIC_VECTOR(31 downto 0);
        b           : in  STD_LOGIC_VECTOR(31 downto 0);
        alu_control : in  STD_LOGIC_VECTOR(2 downto 0);
        alu_result  : out STD_LOGIC_VECTOR(31 downto 0);
        zero        : out STD_LOGIC
    );
end alu_32;

architecture Behavioral of alu_32 is
    signal result : STD_LOGIC_VECTOR(31 downto 0);
begin
    process(a, b, alu_control)
    begin
        case alu_control is
            when "000" => -- ADD
                result <= STD_LOGIC_VECTOR(unsigned(a) + unsigned(b));

            when "001" => -- SUB
                result <= STD_LOGIC_VECTOR(unsigned(a) - unsigned(b));

            when "010" => -- AND
                result <= a and b;

            when "011" => -- OR
                result <= a or b;

            when "100" => -- SLT
                if signed(a) < signed(b) then
                    result <= x"00000001";
                else
                    result <= x"00000000";
                end if;

            when others =>
                result <= (others => '0');
        end case;
    end process;

    alu_result <= result;
    zero <= '1' when result = x"00000000" else '0';
end Behavioral;