-- Z1 d) Y = (X - 3) mod 16
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Z1 is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Z1;

architecture Dataflow of Z1 is
begin
    Y(0) <= not X(0);
    Y(1) <= (X(1) and not X(0)) or (not X(1) and X(0));
    Y(2) <= (X(2) and X(1) and X(0))
         or (not X(2) and not X(1)) or (not X(2) and not X(0));
    Y(3) <= (X(3) and X(2)) or (X(3) and X(1) and X(0))
         or (not X(3) and not X(2) and not X(1)) or (not X(3) and not X(2) and not X(0));
end Dataflow;
