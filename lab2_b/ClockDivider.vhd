-- JS PWr Edu PL
-- --------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

library UNISIM;
use UNISIM.VComponents.all;


entity ClockDivider is
    Generic(
        IN_FREQ_HZ  : POSITIVE := 100E6;
        OUT_FREQ_HZ : POSITIVE := 1
        ); 
    Port (    
        Clk_In  : in  std_logic;
        Clk_Out : out std_logic
        );
end entity;

architecture RTL of ClockDivider is

    -- Range and size of a counter used for division
    constant CNT_MAX    : POSITIVE := IN_FREQ_HZ / OUT_FREQ_HZ / 2 - 1;
    constant CNT_LENGTH : POSITIVE := POSITIVE( ceil( log2( real( CNT_MAX ) ) ) );
    -- The counter
    signal Cnt : unsigned( CNT_LENGTH - 1 downto 0 ) := ( others => '0' );
    -- Aux
    signal Clk_Out_int  : std_logic := '0';

begin

    -- The counter
    process( Clk_In )
    begin
        if rising_edge( Clk_In ) then
            if Cnt = CNT_MAX then
                Cnt <= ( others => '0' );
                Clk_Out_int <= not Clk_Out_int;
            else
                Cnt <= Cnt + 1;
            end if;
        end if;
    end process;
    
    -- Global clock buffer for the output
    BUFG_INST: BUFG port map( I => Clk_Out_int, O => Clk_Out );
    
end RTL;
