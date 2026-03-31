library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit_32 is
    Port (
        opcode        : in  STD_LOGIC_VECTOR(5 downto 0);
        reset         : in  STD_LOGIC;
        reg_dst       : out STD_LOGIC_VECTOR(1 downto 0);
        mem_to_reg    : out STD_LOGIC_VECTOR(1 downto 0);
        alu_op        : out STD_LOGIC_VECTOR(1 downto 0);
        jump          : out STD_LOGIC;
        branch        : out STD_LOGIC;
        mem_read      : out STD_LOGIC;
        mem_write     : out STD_LOGIC;
        alu_src       : out STD_LOGIC;
        reg_write     : out STD_LOGIC;
        sign_or_zero  : out STD_LOGIC
    );
end control_unit_32;

architecture Behavioral of control_unit_32 is
begin
    process(opcode, reset)
    begin
        if reset = '1' then
            reg_dst      <= "00";
            mem_to_reg   <= "00";
            alu_op       <= "00";
            jump         <= '0';
            branch       <= '0';
            mem_read     <= '0';
            mem_write    <= '0';
            alu_src      <= '0';
            reg_write    <= '0';
            sign_or_zero <= '0';
        else
            case opcode is

                when "000000" => -- R-type add
                    reg_dst      <= "01";
                    mem_to_reg   <= "00";
                    alu_op       <= "00";
                    jump         <= '0';
                    branch       <= '0';
                    mem_read     <= '0';
                    mem_write    <= '0';
                    alu_src      <= '0';
                    reg_write    <= '1';
                    sign_or_zero <= '0';

                when "001010" => -- slti
                    reg_dst      <= "00";
                    mem_to_reg   <= "00";
                    alu_op       <= "10";
                    jump         <= '0';
                    branch       <= '0';
                    mem_read     <= '0';
                    mem_write    <= '0';
                    alu_src      <= '1';
                    reg_write    <= '1';
                    sign_or_zero <= '1';

                when "000010" => -- j
                    reg_dst      <= "00";
                    mem_to_reg   <= "00";
                    alu_op       <= "00";
                    jump         <= '1';
                    branch       <= '0';
                    mem_read     <= '0';
                    mem_write    <= '0';
                    alu_src      <= '0';
                    reg_write    <= '0';
                    sign_or_zero <= '0';

                when "000011" => -- jal
                    reg_dst      <= "10";
                    mem_to_reg   <= "10";
                    alu_op       <= "00";
                    jump         <= '1';
                    branch       <= '0';
                    mem_read     <= '0';
                    mem_write    <= '0';
                    alu_src      <= '0';
                    reg_write    <= '1';
                    sign_or_zero <= '0';

                when "100011" => -- lw
                    reg_dst      <= "00";
                    mem_to_reg   <= "01";
                    alu_op       <= "11";
                    jump         <= '0';
                    branch       <= '0';
                    mem_read     <= '1';
                    mem_write    <= '0';
                    alu_src      <= '1';
                    reg_write    <= '1';
                    sign_or_zero <= '1';

                when "101011" => -- sw
                    reg_dst      <= "00";
                    mem_to_reg   <= "00";
                    alu_op       <= "11";
                    jump         <= '0';
                    branch       <= '0';
                    mem_read     <= '0';
                    mem_write    <= '1';
                    alu_src      <= '1';
                    reg_write    <= '0';
                    sign_or_zero <= '1';

                when "000100" => -- beq
                    reg_dst      <= "00";
                    mem_to_reg   <= "00";
                    alu_op       <= "01";
                    jump         <= '0';
                    branch       <= '1';
                    mem_read     <= '0';
                    mem_write    <= '0';
                    alu_src      <= '0';
                    reg_write    <= '0';
                    sign_or_zero <= '1';

                when "001000" => -- addi
                    reg_dst      <= "00";
                    mem_to_reg   <= "00";
                    alu_op       <= "11";
                    jump         <= '0';
                    branch       <= '0';
                    mem_read     <= '0';
                    mem_write    <= '0';
                    alu_src      <= '1';
                    reg_write    <= '1';
                    sign_or_zero <= '1';

                when others =>
                    reg_dst      <= "00";
                    mem_to_reg   <= "00";
                    alu_op       <= "00";
                    jump         <= '0';
                    branch       <= '0';
                    mem_read     <= '0';
                    mem_write    <= '0';
                    alu_src      <= '0';
                    reg_write    <= '0';
                    sign_or_zero <= '0';
            end case;
        end if;
    end process;
end Behavioral;