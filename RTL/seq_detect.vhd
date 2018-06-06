-- Simple FSM to detect sequence "1101".
-- If inputs at the I_SEQ is 1101 in sequence then out O_DETECTED is set to 1
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEQ_DETECT is
    Port ( 
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           I_SEQ : in STD_LOGIC;
           O_DETECTED : out STD_LOGIC);
end SEQ_DETECT;

architecture Behavioral of SEQ_DETECT is
    type STATE_TYPE is (S0,S1,S2,S3);
    signal CURRENT_STATE, NEXT_STATE : STATE_TYPE := S0;
begin

    clocking: process(clk,rst)
    begin
        if rst = '1' then
            CURRENT_STATE <= S0;
        elsif rising_edge(clk) then
            CURRENT_STATE <= NEXT_STATE;
        end if;
    end process clocking;
    
    state_update: process(CURRENT_STATE,I_SEQ)
    begin
        case CURRENT_STATE is
            when S0 =>
                O_DETECTED <= '0';
                if I_SEQ = '1' then
                    NEXT_STATE <= S1;
                else 
                    NEXT_STATE <= S0;
                end if;
            when S1 =>
                O_DETECTED <= '0';
                if I_SEQ = '1' then
                    NEXT_STATE <= S2;
                else 
                    NEXT_STATE <= S0;
                end if;
            when S2 =>
                O_DETECTED <= '0';
                if I_SEQ = '1' then
                    NEXT_STATE <= S2;
                else 
                    NEXT_STATE <= S3;
                end if;            
            when S3 =>
                NEXT_STATE <= S0;
                if I_SEQ = '1' then
                    O_DETECTED <= '1';
                else 
                    O_DETECTED <= '0';
                end if;
                
            when others => 
                NEXT_STATE <= S0;
                O_DETECTED <= '0';
        end case;
    end process state_update;
end Behavioral;
