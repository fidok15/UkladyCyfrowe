-- Testbench Z1: X = 0..15, co 100 ns.
-- K = przesuniecie wariantu: a) 1, b) 3, c) -1, d) -3 (tylko do samosprawdzenia).
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Z1_tb is
    Generic ( K : integer := 1 );
end Z1_tb;

architecture Behavioral of Z1_tb is
    component Z1
        Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal X : STD_LOGIC_VECTOR (3 downto 0);
    signal Y : STD_LOGIC_VECTOR (3 downto 0);
begin
    UUT: Z1 port map ( X => X, Y => Y );

    X <= "0000",
         "0001" after  100 ns, "0010" after  200 ns, "0011" after  300 ns,
         "0100" after  400 ns, "0101" after  500 ns, "0110" after  600 ns,
         "0111" after  700 ns, "1000" after  800 ns, "1001" after  900 ns,
         "1010" after 1000 ns, "1011" after 1100 ns, "1100" after 1200 ns,
         "1101" after 1300 ns, "1110" after 1400 ns, "1111" after 1500 ns;

    -- Samosprawdzenie (opcjonalne, na zajeciach mozna pominac):
    -- w polowie kazdego kroku porownuje Y z (X + K) mod 16.
    Check: process
    begin
        for i in 0 to 15 loop
            wait for 50 ns;
            assert to_integer(unsigned(Y)) = (i + K) mod 16
                report "Blad dla X = " & integer'image(i) severity error;
            wait for 50 ns;
        end loop;
        report "Koniec testu";
        wait;
    end process;
end Behavioral;
