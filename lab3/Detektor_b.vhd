-- Lab 3 Z1 b) Detektor sekwencji 000100 jako automat Moore'a (7 stanow).
-- 3 przerzutniki FDRE z UNISIM, funkcja przejsc w tablicy (with ... select).
-- Stan Sk = "dopasowano k pierwszych bitow sekwencji", S6 = wykryto (Y = 1).
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
    signal Q   : STD_LOGIC_VECTOR (2 downto 0);  -- stan (wyjscia przerzutnikow)
    signal D   : STD_LOGIC_VECTOR (2 downto 0);  -- stan nastepny
    signal Sel : STD_LOGIC_VECTOR (3 downto 0);  -- X & Q
begin
    Sel <= X & Q;

    with Sel select
        D <= "001" when "0000",   -- X=0: S0 -> S1
             "010" when "0001",   --      S1 -> S2
             "011" when "0010",   --      S2 -> S3
             "011" when "0011",   --      S3 -> S3 (0000: dalej "000")
             "101" when "0100",   --      S4 -> S5
             "110" when "0101",   --      S5 -> S6 (wykryto)
             "011" when "0110",   --      S6 -> S3 (koncowka "00" + 0 = "000")
             "100" when "1011",   -- X=1: S3 -> S4, pozostale stany -> S0
             "000" when others;

    FF2: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(2), Q => Q(2));
    FF1: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(1), Q => Q(1));
    FF0: FDRE generic map (INIT => '0')
         port map (C => Clk, CE => CE, R => Rst, D => D(0), Q => Q(0));

    -- Moore: wyjscie zalezy tylko od stanu
    Y <= '1' when Q = "110" else '0';
end Behavioral;
