library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Detektor is
    Port ( Clk : in  STD_LOGIC;
           CE  : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           X   : in  STD_LOGIC;
           Y   : out STD_LOGIC);
end Detektor;

architecture Behavioral of Detektor is
    type state_type is (S0, S1, S2, S3, S4, S5, S6);
    signal state, next_state : state_type := S0;
begin
    reg: process (Clk)
    begin
        if rising_edge(Clk) then
            if Rst = '1' then
                state <= S0;
            elsif CE = '1' then
                state <= next_state;
            end if;
        end if;
    end process;

    nxt: process (state, X)
    begin
        case state is
            when S0 => if X = '0' then next_state <= S0; else next_state <= S1; end if;
            when S1 => if X = '0' then next_state <= S2; else next_state <= S1; end if;
            when S2 => if X = '0' then next_state <= S3; else next_state <= S1; end if;
            when S3 => if X = '0' then next_state <= S0; else next_state <= S4; end if;
            when S4 => if X = '0' then next_state <= S5; else next_state <= S1; end if;
            when S5 => if X = '0' then next_state <= S6; else next_state <= S1; end if;
            when S6 => if X = '0' then next_state <= S0; else next_state <= S4; end if;
        end case;
    end process;

    outp: process (state)
    begin
        if state = S6 then
            Y <= '1';
        else
            Y <= '0';
        end if;
    end process;
end Behavioral;
