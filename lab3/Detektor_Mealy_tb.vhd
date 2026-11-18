-- Testbench Lab 3 Z3 b) dla automatu Mealy'ego. Te same pobudzenia co Detektor_tb:
-- Fclk = 20 MHz, ciag 111 000100 111 000101 111, X 20 ns przed zboczem Clk.
-- Mealy: Y = 1 juz w takcie, w ktorym na wejsciu jest ostatni bit sekwencji.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Detektor_Mealy_tb is
end Detektor_Mealy_tb;

architecture Behavioral of Detektor_Mealy_tb is
    component Detektor
        Port ( Clk : in  STD_LOGIC;
               CE  : in  STD_LOGIC;
               Rst : in  STD_LOGIC;
               X   : in  STD_LOGIC;
               Y   : out STD_LOGIC);
    end component;

    constant T    : time := 50 ns;   -- 20 MHz
    constant TSU  : time := 20 ns;   -- X przed zboczem Clk
    constant Vect : STD_LOGIC_VECTOR (0 to 20) := "111000100111000101111";

    signal Clk : STD_LOGIC := '0';
    signal CE  : STD_LOGIC := '1';
    signal Rst : STD_LOGIC := '1';
    signal X   : STD_LOGIC := '0';
    signal Y   : STD_LOGIC;
begin
    UUT: Detektor port map ( Clk => Clk, CE => CE, Rst => Rst, X => X, Y => Y );

    Clk <= not Clk after T / 2;

    Stim: process
    begin
        wait until rising_edge(Clk);      -- 25 ns: reset
        wait for T - TSU;
        Rst <= '0';
        for i in Vect'range loop
            X <= Vect(i);
            wait until rising_edge(Clk);
            wait for T - TSU;
        end loop;
        wait;
    end process;

    -- Samosprawdzenie: Y sprawdzane 10 ns po zmianie X (przed zboczem Clk)
    Check: process
        type Tab is array (0 to 5) of integer;
        constant NAST_0 : Tab := (1, 2, 3, 3, 5, 3);  -- przejscia dla X = 0
        constant NAST_1 : Tab := (0, 0, 0, 4, 0, 0);  -- przejscia dla X = 1
        variable S      : integer := 0;
        variable Wykryc : integer := 0;
        variable Ocz    : boolean;
    begin
        for k in 0 to 21 loop
            wait until rising_edge(Clk);
            if Rst = '1' then    S := 0;
            elsif CE = '1' then
                if X = '0' then  S := NAST_0(S);
                else             S := NAST_1(S);
                end if;
            end if;
            wait for 40 ns;
            Ocz := (S = 5) and (X = '0');
            if Y = '1' then Wykryc := Wykryc + 1; end if;
            assert (Y = '1') = Ocz
                report "Blad: Y = " & STD_LOGIC'image(Y) & ", stan S" & integer'image(S)
                severity error;
        end loop;
        assert Wykryc = 1 report "Blad: liczba wykryc = " & integer'image(Wykryc) severity error;
        report "Koniec testu";
        wait;
    end process;
end Behavioral;
