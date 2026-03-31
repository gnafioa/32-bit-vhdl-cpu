library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_control_32 is
    Port (
        ALUOp       : in  STD_LOGIC_VECTOR(1 downto 0);
        ALU_Funct   : in  STD_LOGIC_VECTOR(2 downto 0);
        ALU_Control : out STD_LOGIC_VECTOR(2 downto 0)
    );
end alu_control_32;

architecture Behavioral of alu_control_32 is
begin
    process(ALUOp, ALU_Funct)
    begin
        case ALUOp is
            when "00" =>
                case ALU_Funct is
                    when "000" => ALU_Control <= "000"; -- ADD
                    when "001" => ALU_Control <= "001"; -- SUB
                    when "010" => ALU_Control <= "010"; -- AND
                    when "011" => ALU_Control <= "011"; -- OR
                    when "100" => ALU_Control <= "100"; -- SLT
                    when others => ALU_Control <= "000";
                end case;

            when "01" =>
                ALU_Control <= "001"; -- BEQ -> SUB

            when "10" =>
                ALU_Control <= "100"; -- SLTI -> SLT

            when "11" =>
                ALU_Control <= "000"; -- ADDI, LW, SW -> ADD

            when others =>
                ALU_Control <= "000";
        end case;
    end process;
end Behavioral;