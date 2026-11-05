-- Lab 2 Z2 b) Ten sam licznik (cykl w gore: 0 1 5 2 3 4 6 7), ale wzbudzenia D
-- z tablicy (with ... select) zamiast rownan. Przerzutniki bez zmian (FDRE).
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
    signal Sel : STD_LOGIC_VECTOR (3 downto 0);  -- UPnDN & Q
begin
    Sel <= UPnDN & Qi;

    with Sel select
        D <= "111" when "0000",   -- w dol: 0 -> 7
             "000" when "0001",   --        1 -> 0
             "101" when "0010",   --        2 -> 5
             "010" when "0011",   --        3 -> 2
             "011" when "0100",   --        4 -> 3
             "001" when "0101",   --        5 -> 1
             "100" when "0110",   --        6 -> 4
             "110" when "0111",   --        7 -> 6
             "001" when "1000",   -- w gore: 0 -> 1
             "101" when "1001",   --         1 -> 5
             "011" when "1010",   --         2 -> 3
             "100" when "1011",   --         3 -> 4
             "110" when "1100",   --         4 -> 6
             "010" when "1101",   --         5 -> 2
             "111" when "1110",   --         6 -> 7
             "000" when "1111",   --         7 -> 0
             "000" when others;

    FF2: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(2), Q => Qi(2));
    FF1: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(1), Q => Qi(1));
    FF0: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(0), Q => Qi(0));

    Q <= Qi;
end Behavioral;
