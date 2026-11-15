library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Licznik is
    Port ( Clk   : in  STD_LOGIC;
           CE    : in  STD_LOGIC;
           Rst   : in  STD_LOGIC;
           UPnDN : in  STD_LOGIC;
           Q     : out STD_LOGIC_VECTOR (2 downto 0));
end Licznik;

architecture Behavioral of Licznik is
    signal Qi  : STD_LOGIC_VECTOR (2 downto 0);
    signal D   : STD_LOGIC_VECTOR (2 downto 0);
    signal Sel : STD_LOGIC_VECTOR (3 downto 0);
begin
    Sel <= UPnDN & Qi;

    with Sel select
        D <= "111" when "0000",
             "000" when "0001",
             "101" when "0010",
             "010" when "0011",
             "011" when "0100",
             "001" when "0101",
             "100" when "0110",
             "110" when "0111",
             "001" when "1000",
             "101" when "1001",
             "011" when "1010",
             "100" when "1011",
             "110" when "1100",
             "010" when "1101",
             "111" when "1110",
             "000" when "1111",
             "000" when others;

    FF2: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(2), Q => Qi(2));
    FF1: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(1), Q => Qi(1));
    FF0: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(0), Q => Qi(0));

    Q <= Qi;
end Behavioral;
