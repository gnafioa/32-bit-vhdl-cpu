library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_control_unit_32 is
end tb_control_unit_32;

architecture Behavioral of tb_control_unit_32 is
    signal opcode        : STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
    signal reset         : STD_LOGIC := '0';
    signal reg_dst       : STD_LOGIC_VECTOR(1 downto 0);
    signal mem_to_reg    : STD_LOGIC_VECTOR(1 downto 0);
    signal alu_op        : STD_LOGIC_VECTOR(1 downto 0);
    signal jump          : STD_LOGIC;
    signal branch        : STD_LOGIC;
    signal mem_read      : STD_LOGIC;
    signal mem_write     : STD_LOGIC;
    signal alu_src       : STD_LOGIC;
    signal reg_write     : STD_LOGIC;
    signal sign_or_zero  : STD_LOGIC;
begin

    uut: entity work.control_unit_32
        port map (
            opcode        => opcode,
            reset         => reset,
            reg_dst       => reg_dst,
            mem_to_reg    => mem_to_reg,
            alu_op        => alu_op,
            jump          => jump,
            branch        => branch,
            mem_read      => mem_read,
            mem_write     => mem_write,
            alu_src       => alu_src,
            reg_write     => reg_write,
            sign_or_zero  => sign_or_zero
        );

    stim_proc: process
    begin
        -- reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- add
        opcode <= "000000";
        wait for 20 ns;

        -- slti
        opcode <= "001010";
        wait for 20 ns;

        -- j
        opcode <= "000010";
        wait for 20 ns;

        -- jal
        opcode <= "000011";
        wait for 20 ns;

        -- lw
        opcode <= "100011";
        wait for 20 ns;

        -- sw
        opcode <= "101011";
        wait for 20 ns;

        -- beq
        opcode <= "000100";
        wait for 20 ns;

        -- addi
        opcode <= "001000";
        wait for 20 ns;

        wait;
    end process;

end Behavioral;