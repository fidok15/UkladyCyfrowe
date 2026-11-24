library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Detektor is
    Port ( Clk : in  STD_LOGIC;
           CE  : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           X   : in  STD_LOGIC;
           Y   : out STD_LOGIC);
end Detektor;

architecture Behavioral of Detektor is
    signal Q   : STD_LOGIC_VECTOR (2 downto 0);
    signal D   : STD_LOGIC_VECTOR (2 downto 0);
    signal Sel : STD_LOGIC_VECTOR (3 downto 0);
begin
    Sel <= X & Q;

    with Sel select
        D <= "010" when "0001",
             "011" when "0010",
             "101" when "0100",
             "110" when "0101",
             "100" when "1011",
             "100" when "1110",
             "001" when "1000" | "1001" | "1010" | "1100" | "1101",
             "000" when others;

    FF2: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(2), Q => Q(2));
    FF1: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(1), Q => Q(1));
    FF0: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(0), Q => Q(0));

    Y <= '1' when Q = "110" else '0';
end Behavioral;
