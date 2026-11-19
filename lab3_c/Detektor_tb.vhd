-- Testbench Lab 3 c) dla automatu Moore'a (Z1, Z2). Fclk = 50 MHz (okres 20 ns).
-- Ciag: *** abcdef *** abcdef' *** = 000 100100 000 100101 000 (21 bitow).
-- X ustawiane 8 ns przed zboczem narastajacym Clk.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Detektor_tb is
end Detektor_tb;

architecture Behavioral of Detektor_tb is
    component Detektor
        Port ( Clk : in  STD_LOGIC;
               CE  : in  STD_LOGIC;
               Rst : in  STD_LOGIC;
               X   : in  STD_LOGIC;
               Y   : out STD_LOGIC);
    end component;

    constant T    : time := 20 ns;   -- 50 MHz
    constant TSU  : time := 8 ns;    -- X przed zboczem Clk
    constant Vect : STD_LOGIC_VECTOR (0 to 20) := "000100100000100101000";

    signal Clk : STD_LOGIC := '0';
    signal CE  : STD_LOGIC := '1';
    signal Rst : STD_LOGIC := '1';
    signal X   : STD_LOGIC := '0';
    signal Y   : STD_LOGIC;
begin
    UUT: Detektor port map ( Clk => Clk, CE => CE, Rst => Rst, X => X, Y => Y );

    -- Zegar 50 MHz: zbocza narastajace w 10, 30, 50, ... ns
    Clk <= not Clk after T / 2;

    -- Pobudzenia: po zboczu czekamy T - TSU = 12 ns i podajemy kolejny bit
    Stim: process
    begin
        wait until rising_edge(Clk);      -- 10 ns: reset
        wait for T - TSU;
        Rst <= '0';
        for i in Vect'range loop
            X <= Vect(i);
            wait until rising_edge(Clk);
            wait for T - TSU;
        end loop;
        wait;
    end process;

    -- Samosprawdzenie (opcjonalne): model automatu liczony rownolegle
    Check: process
        type Tab is array (0 to 6) of integer;
        constant NAST_0 : Tab := (0, 2, 3, 0, 5, 6, 0);  -- przejscia dla X = 0
        constant NAST_1 : Tab := (1, 1, 1, 4, 1, 1, 4);  -- przejscia dla X = 1
        variable S      : integer := 0;
        variable Wykryc : integer := 0;
    begin
        for k in 0 to 21 loop
            wait until rising_edge(Clk);
            if Rst = '1' then    S := 0;
            elsif CE = '1' then
                if X = '0' then  S := NAST_0(S);
                else             S := NAST_1(S);
                end if;
            end if;
            wait for 5 ns;
            if Y = '1' then Wykryc := Wykryc + 1; end if;
            assert (Y = '1') = (S = 6)
                report "Blad: Y = " & STD_LOGIC'image(Y) & ", stan S" & integer'image(S)
                severity error;
        end loop;
        assert Wykryc = 1 report "Blad: liczba wykryc = " & integer'image(Wykryc) severity error;
        report "Koniec testu";
        wait;
    end process;
end Behavioral;
