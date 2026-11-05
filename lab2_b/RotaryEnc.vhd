-- JS PWr Edu PL
-- --------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity RotaryEnc is
  port (
    ROT_A : in STD_LOGIC;
    ROT_B : in STD_LOGIC;
    Clk : in STD_LOGIC;
    RotL : out STD_LOGIC;
    RotR : out STD_LOGIC
  );
end RotaryEnc;

architecture STRUCTURE of RotaryEnc is
  signal FF : STD_LOGIC;
  signal FF_i_1_n_0 : STD_LOGIC;
  signal RotL0 : STD_LOGIC;
  signal RotR0 : STD_LOGIC;
  signal ffA : STD_LOGIC;
  signal ffB : STD_LOGIC;
  signal prevA : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of RotL_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of RotR_i_1 : label is "soft_lutpair0";
begin
FF_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => FF,
      I1 => ffA,
      I2 => ffB,
      O => FF_i_1_n_0
    );
FF_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk,
      CE => '1',
      D => FF_i_1_n_0,
      Q => FF,
      R => '0'
    );
RotL_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => FF,
      I1 => ffB,
      I2 => ffA,
      I3 => prevA,
      O => RotL0
    );
RotL_reg: unisim.vcomponents.FDRE
     port map (
      C => Clk,
      CE => '1',
      D => RotL0,
      Q => RotL,
      R => '0'
    );
RotR_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => prevA,
      I1 => FF,
      I2 => ffB,
      I3 => ffA,
      O => RotR0
    );
RotR_reg: unisim.vcomponents.FDRE
     port map (
      C => Clk,
      CE => '1',
      D => RotR0,
      Q => RotR,
      R => '0'
    );
ffA_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk,
      CE => '1',
      D => ROT_A,
      Q => ffA,
      R => '0'
    );
ffB_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk,
      CE => '1',
      D => ROT_B,
      Q => ffB,
      R => '0'
    );
prevA_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk,
      CE => '1',
      D => ffA,
      Q => prevA,
      R => '0'
    );
end STRUCTURE;
