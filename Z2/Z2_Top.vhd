-- Z2: wynik Z1 na wyswietlaczu OLED (plyta rozszerzajaca AUP-ZU3).
--   SW(3:0) -> X (tryb reczny); SW7 = '1' -> tryb AUTO: X liczy 0..15 co STEP_CYCLES taktow
--   LED(7:4) = X, LED(3:0) = Y
--   OLED: lewe 2 cyfry = X dziesietnie, prawe 2 cyfry = Y dziesietnie
-- W projekcie musza byc tez: Z1_x.vhd (wybrany wariant) oraz OLED_1x32.vhd.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity Z2_Top is
    Generic ( STEP_CYCLES : positive := 100E6 );  -- 100E6 = 1 s przy 100 MHz; 10 = 100 ns (symulacja)
    Port ( CLK_100MHz_P : in  STD_LOGIC;
           CLK_100MHz_N : in  STD_LOGIC;
           SW   : in  STD_LOGIC_VECTOR (3 downto 0);
           AUTO : in  STD_LOGIC;
           LED  : out STD_LOGIC_VECTOR (7 downto 0);
           OLED_SDA : inout STD_LOGIC;
           OLED_SCL : inout STD_LOGIC );
end Z2_Top;

architecture Behavioral of Z2_Top is
    component Z1
        Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component OLED_1x32
        Port ( Clk_100MHz : in STD_LOGIC;
               Line   : in STD_LOGIC_VECTOR (31 downto 0);
               DecPts : in STD_LOGIC_VECTOR (7 downto 0);
               Blank  : in STD_LOGIC_VECTOR (7 downto 0);
               I2C_NACK : out STD_LOGIC;
               OLED_SDA : inout STD_LOGIC;
               OLED_SCL : inout STD_LOGIC );
    end component;

    -- 0..15 -> dwie cyfry dziesietne (dziesiatki & jednosci), kazda na 4 bitach
    function Dec2 (v : STD_LOGIC_VECTOR (3 downto 0)) return STD_LOGIC_VECTOR is
        variable n : natural := to_integer(unsigned(v));
    begin
        return std_logic_vector(to_unsigned(n / 10, 4) & to_unsigned(n mod 10, 4));
    end function;

    signal Clk_Buf    : STD_LOGIC;  -- IBUFDS -> BUFG
    signal Clk_100MHz : STD_LOGIC;  -- globalny zegar projektu
    signal Cnt   : natural range 0 to STEP_CYCLES - 1 := 0;
    signal XAuto : unsigned (3 downto 0) := "0000";
    signal X, Y  : STD_LOGIC_VECTOR (3 downto 0);
    signal DX, DY : STD_LOGIC_VECTOR (7 downto 0);
    signal Line  : STD_LOGIC_VECTOR (31 downto 0);
    signal Blank : STD_LOGIC_VECTOR (7 downto 0);
begin
    inst_IBUFDS : IBUFDS port map ( I => CLK_100MHz_P, IB => CLK_100MHz_N, O => Clk_Buf );
    inst_BUFG   : BUFG   port map ( I => Clk_Buf, O => Clk_100MHz );

    -- Tryb AUTO: X + 1 co STEP_CYCLES taktow zegara
    Step: process (Clk_100MHz)
    begin
        if rising_edge(Clk_100MHz) then
            if Cnt = STEP_CYCLES - 1 then
                Cnt <= 0;
                XAuto <= XAuto + 1;
            else
                Cnt <= Cnt + 1;
            end if;
        end if;
    end process;

    X <= std_logic_vector(XAuto) when AUTO = '1' else SW;

    UUT: Z1 port map ( X => X, Y => Y );

    LED <= X & Y;

    -- Wyswietlacz: cyfry 7..0 = [X dzies.][X jedn.][ ][ ][ ][ ][Y dzies.][Y jedn.]
    DX <= Dec2(X);
    DY <= Dec2(Y);
    Line <= DX & X"0000" & DY;
    Blank(7) <= '1' when DX(7 downto 4) = "0000" else '0';  -- bez zera wiodacego
    Blank(6) <= '0';
    Blank(5 downto 2) <= "1111";
    Blank(1) <= '1' when DY(7 downto 4) = "0000" else '0';
    Blank(0) <= '0';

    Display: OLED_1x32 port map (
        Clk_100MHz => Clk_100MHz,
        Line   => Line,
        DecPts => (others => '0'),
        Blank  => Blank,
        I2C_NACK => open,
        OLED_SDA => OLED_SDA,
        OLED_SCL => OLED_SCL );
end Behavioral;
