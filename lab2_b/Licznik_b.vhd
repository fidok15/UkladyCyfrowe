-- Lab 2 Z1 b) Trzybitowy licznik rewersyjny, cykl w gore: 0 1 5 2 3 4 6 7
-- (w dol odwrotnie: 0 7 6 4 3 2 5 1). 3 przerzutniki FDRE z UNISIM
-- (D z CE i synchronicznym R) + zminimalizowane rownania wzbudzen D.
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
    signal Qi : STD_LOGIC_VECTOR (2 downto 0);  -- wyjscia przerzutnikow
    signal D  : STD_LOGIC_VECTOR (2 downto 0);  -- wzbudzenia
    signal U  : STD_LOGIC;
begin
    U <= UPnDN;

    -- Rownania z map Karnaugha (U = UPnDN)
    D(2) <= (not U and not Qi(2) and not Qi(0)) or (not U and Qi(2) and Qi(1))
         or (U and not Qi(2) and Qi(0)) or (U and Qi(2) and not Qi(0));
    D(1) <= (not U and not Qi(1) and not Qi(0)) or (not U and Qi(1) and Qi(0))
         or (U and Qi(2) and not Qi(1)) or (U and Qi(1) and not Qi(0));
    D(0) <= (not U and Qi(2) and not Qi(1)) or (U and not Qi(2) and not Qi(1))
         or (U and Qi(1) and not Qi(0)) or (not Qi(2) and not Qi(0));

    -- Trzy przerzutniki typu D z biblioteki UNISIM
    FF2: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(2), Q => Qi(2));
    FF1: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(1), Q => Qi(1));
    FF0: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(0), Q => Qi(0));

    Q <= Qi;
end Behavioral;
