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
    signal Qi : STD_LOGIC_VECTOR (2 downto 0);
    signal D  : STD_LOGIC_VECTOR (2 downto 0);
    signal U  : STD_LOGIC;
begin
    U <= UPnDN;

    D(2) <= (not U and not Qi(2) and not Qi(0)) or (not U and Qi(2) and Qi(1))
         or (U and not Qi(2) and Qi(0)) or (U and Qi(2) and not Qi(0));
    D(1) <= (not U and not Qi(1) and not Qi(0)) or (not U and Qi(1) and Qi(0))
         or (U and Qi(2) and not Qi(1)) or (U and Qi(1) and not Qi(0));
    D(0) <= (not U and Qi(2) and not Qi(1)) or (U and not Qi(2) and not Qi(1))
         or (U and Qi(1) and not Qi(0)) or (not Qi(2) and not Qi(0));

    FF2: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(2), Q => Qi(2));
    FF1: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(1), Q => Qi(1));
    FF0: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(0), Q => Qi(0));

    Q <= Qi;
end Behavioral;
