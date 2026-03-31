library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_alu_control_32 is
end tb_alu_control_32;

architecture Behavioral of tb_alu_control_32 is
    signal ALUOp       : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal ALU_Funct   : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal ALU_Control : STD_LOGIC_VECTOR(2 downto 0);
begin

    uut: entity work.alu_control_32
        port map (
            ALUOp       => ALUOp,
            ALU_Funct   => ALU_Funct,
            ALU_Control => ALU_Control
        );

    stim_proc: process
    begin
        -- R-type ADD
        ALUOp <= "00"; ALU_Funct <= "000";
        wait for 20 ns;

        -- R-type SUB
        ALUOp <= "00"; ALU_Funct <= "001";
        wait for 20 ns;

        -- R-type AND
        ALUOp <= "00"; ALU_Funct <= "010";
        wait for 20 ns;

        -- R-type OR
        ALUOp <= "00"; ALU_Funct <= "011";
        wait for 20 ns;

        -- R-type SLT
        ALUOp <= "00"; ALU_Funct <= "100";
        wait for 20 ns;

        -- BEQ
        ALUOp <= "01"; ALU_Funct <= "000";
        wait for 20 ns;

        -- SLTI
        ALUOp <= "10"; ALU_Funct <= "000";
        wait for 20 ns;

        -- ADDI / LW / SW
        ALUOp <= "11"; ALU_Funct <= "000";
        wait for 20 ns;

        wait;
    end process;

end Behavioral;