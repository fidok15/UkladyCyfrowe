-- Testbench Z2: STEP_CYCLES = 10 -> w trybie AUTO X zmienia sie co 100 ns (10 taktow po 10 ns).
-- K = przesuniecie wariantu Z1: a) 1, b) 3, c) -1, d) -3 (tylko do samosprawdzenia).
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Z2_tb is
    Generic ( K : integer := 1 );
end Z2_tb;

architecture Behavioral of Z2_tb is
    component Z2_Top
        Generic ( STEP_CYCLES : positive );
        Port ( CLK_100MHz_P : in  STD_LOGIC;
               CLK_100MHz_N : in  STD_LOGIC;
               SW   : in  STD_LOGIC_VECTOR (3 downto 0);
               AUTO : in  STD_LOGIC;
               LED  : out STD_LOGIC_VECTOR (7 downto 0);
               OLED_SDA : inout STD_LOGIC;
               OLED_SCL : inout STD_LOGIC );
    end component;

    signal ClkP : STD_LOGIC := '0';
    signal ClkN : STD_LOGIC;
    signal SW   : STD_LOGIC_VECTOR (3 downto 0);
    signal AUTO : STD_LOGIC;
    signal LED  : STD_LOGIC_VECTOR (7 downto 0);
    signal OLED_SDA, OLED_SCL : STD_LOGIC;
begin
    UUT: Z2_Top
        generic map ( STEP_CYCLES => 10 )
        port map ( CLK_100MHz_P => ClkP, CLK_100MHz_N => ClkN, SW => SW, AUTO => AUTO,
                   LED => LED, OLED_SDA => OLED_SDA, OLED_SCL => OLED_SCL );

    ClkP <= not ClkP after 5 ns;  -- 100 MHz
    ClkN <= not ClkP;
    OLED_SDA <= 'H';              -- rezystory podciagajace I2C
    OLED_SCL <= 'H';

    SW   <= "0101";
    AUTO <= '0', '1' after 200 ns;

    -- Samosprawdzenie (opcjonalne): LED(7:4) = X, LED(3:0) = Y
    Check: process
        variable PrevX : unsigned (3 downto 0);
    begin
        wait for 100 ns;  -- tryb reczny: X = SW
        assert LED(7 downto 4) = SW and to_integer(unsigned(LED(3 downto 0))) = (5 + K) mod 16
            report "Blad w trybie recznym" severity error;
        wait for 150 ns;  -- tryb AUTO, probki w polowie kolejnych 100 ns
        for i in 1 to 20 loop
            assert to_integer(unsigned(LED(3 downto 0))) = (to_integer(unsigned(LED(7 downto 4))) + K) mod 16
                report "Blad Y dla X = " & integer'image(to_integer(unsigned(LED(7 downto 4)))) severity error;
            PrevX := unsigned(LED(7 downto 4));
            wait for 100 ns;
            assert unsigned(LED(7 downto 4)) = PrevX + 1
                report "X nie zmienil sie po 100 ns" severity error;
        end loop;
        report "Koniec testu";
        wait;
    end process;
end Behavioral;
