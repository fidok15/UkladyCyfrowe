library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Licznik_tb is
end Licznik_tb;

architecture Behavioral of Licznik_tb is
    component Licznik
        Port ( Clk   : in  STD_LOGIC;
               CE    : in  STD_LOGIC;
               Rst   : in  STD_LOGIC;
               UPnDN : in  STD_LOGIC;
               Q     : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    signal Clk   : STD_LOGIC := '0';
    signal CE    : STD_LOGIC;
    signal Rst   : STD_LOGIC;
    signal UPnDN : STD_LOGIC;
    signal Q     : STD_LOGIC_VECTOR (2 downto 0);
begin
    UUT: Licznik port map ( Clk => Clk, CE => CE, Rst => Rst, UPnDN => UPnDN, Q => Q );

    Clk <= not Clk after 15 ns;

    Rst   <= '1', '0' after 60 ns, '1' after 690 ns, '0' after 720 ns;
    CE    <= '1', '0' after 540 ns, '1' after 600 ns;
    UPnDN <= '1', '0' after 300 ns, '1' after 540 ns;

    Check: process
        type Tab is array (0 to 7) of integer;
        constant NAST_UP : Tab := (1, 5, 3, 4, 6, 2, 7, 0);
        constant NAST_DN : Tab := (7, 0, 5, 2, 3, 1, 4, 6);
        variable Ocz : integer := 0;
    begin
        while now < 800 ns loop
            wait until rising_edge(Clk);
            if Rst = '1' then
                Ocz := 0;
            elsif CE = '1' then
                if UPnDN = '1' then Ocz := NAST_UP(Ocz);
                else                Ocz := NAST_DN(Ocz);
                end if;
            end if;
            wait for 10 ns;
            assert to_integer(unsigned(Q)) = Ocz
                report "Blad: Q = " & integer'image(to_integer(unsigned(Q)))
                     & ", oczekiwano " & integer'image(Ocz) severity error;
        end loop;
        report "Koniec testu";
        wait;
    end process;
end Behavioral;
