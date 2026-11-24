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

    constant T    : time := 20 ns;
    constant TSU  : time := 8 ns;
    constant Vect : STD_LOGIC_VECTOR (0 to 20) := "000100100000100101000";

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
        wait until rising_edge(Clk);
        wait for T - TSU;
        Rst <= '0';
        for i in Vect'range loop
            X <= Vect(i);
            wait until rising_edge(Clk);
            wait for T - TSU;
        end loop;
        wait;
    end process;
end Behavioral;
