-- JS PWr Edu PL
-- --------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity OLED_1x32 is
  port (
    Clk_100MHz : in STD_LOGIC;
    Line : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DecPts : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Blank : in STD_LOGIC_VECTOR ( 7 downto 0 );
    I2C_NACK : out STD_LOGIC;
    OLED_SDA : inout STD_LOGIC;
    OLED_SCL : inout STD_LOGIC
  );
end OLED_1x32;

architecture STRUCTURE of OLED_1x32 is
  signal DO : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \FSM_onehot_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_10_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[3]_i_9_n_0\ : STD_LOGIC;
  signal I2C_FIFO_Empty : STD_LOGIC;
  signal I2C_FIFO_Full : STD_LOGIC;
  signal \^i2c_nack\ : STD_LOGIC;
  signal L : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal NACK_i_1_n_0 : STD_LOGIC;
  signal NACK_i_2_n_0 : STD_LOGIC;
  signal NACK_i_3_n_0 : STD_LOGIC;
  signal NACK_i_4_n_0 : STD_LOGIC;
  signal NACK_i_5_n_0 : STD_LOGIC;
  signal NACK_i_6_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_10_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_11_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_13_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_14_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_15_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_16_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_17_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_18_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_19_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_20_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_21_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_22_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_23_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_24_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_25_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_27_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_28_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_29_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_31_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_32_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_33_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_34_n_0 : STD_LOGIC;
  signal RAM_reg_0_15_0_7_i_35_n_0 : STD_LOGIC;
  signal SCLout_i_1_n_0 : STD_LOGIC;
  signal SCLout_i_2_n_0 : STD_LOGIC;
  signal SCLout_i_3_n_0 : STD_LOGIC;
  signal SCLout_i_4_n_0 : STD_LOGIC;
  signal SCLout_i_5_n_0 : STD_LOGIC;
  signal SCLout_i_6_n_0 : STD_LOGIC;
  signal SCLout_i_7_n_0 : STD_LOGIC;
  signal SCLout_i_8_n_0 : STD_LOGIC;
  signal SDAout_i_1_n_0 : STD_LOGIC;
  signal SDAout_i_2_n_0 : STD_LOGIC;
  signal SDAout_i_3_n_0 : STD_LOGIC;
  signal SDAout_i_5_n_0 : STD_LOGIC;
  signal SDAout_i_6_n_0 : STD_LOGIC;
  signal SDAout_i_7_n_0 : STD_LOGIC;
  signal SDAout_i_8_n_0 : STD_LOGIC;
  signal SDAout_i_9_n_0 : STD_LOGIC;
  signal \addrROM[5]_i_1_n_0\ : STD_LOGIC;
  signal \addrROM[5]_i_2_n_0\ : STD_LOGIC;
  signal \addrROM[5]_i_4_n_0\ : STD_LOGIC;
  signal \addrROM[5]_i_5_n_0\ : STD_LOGIC;
  signal \addrROM[5]_i_6_n_0\ : STD_LOGIC;
  signal \addrRd[0]_i_1_n_0\ : STD_LOGIC;
  signal \addrRd[1]_i_1_n_0\ : STD_LOGIC;
  signal \addrRd[2]_i_1_n_0\ : STD_LOGIC;
  signal \addrRd[3]_i_1_n_0\ : STD_LOGIC;
  signal \addrRd_rep[3]_i_3_n_0\ : STD_LOGIC;
  signal \addrWr[0]_i_1_n_0\ : STD_LOGIC;
  signal \addrWr[1]_i_1_n_0\ : STD_LOGIC;
  signal \addrWr[2]_i_1_n_0\ : STD_LOGIC;
  signal \addrWr[3]_i_1_n_0\ : STD_LOGIC;
  signal addrWr_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \cnt20b[0]_i_1_n_0\ : STD_LOGIC;
  signal \cnt20b[0]_i_4_n_0\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_10\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_11\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_12\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_13\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_14\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_15\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_8\ : STD_LOGIC;
  signal \cnt20b_reg[0]_i_3_n_9\ : STD_LOGIC;
  signal \cnt20b_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \cnt20b_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \cnt20b_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \cntBits[0]_i_1_n_0\ : STD_LOGIC;
  signal \cntBits[1]_i_1_n_0\ : STD_LOGIC;
  signal \cntBits[2]_i_1_n_0\ : STD_LOGIC;
  signal \cntBits[3]_i_2_n_0\ : STD_LOGIC;
  signal \cntBits[3]_i_3_n_0\ : STD_LOGIC;
  signal \cntBits[3]_i_4_n_0\ : STD_LOGIC;
  signal \cntBits[3]_i_5_n_0\ : STD_LOGIC;
  signal \cntSCL[10]_i_2_n_0\ : STD_LOGIC;
  signal \cntSCL[11]_i_2_n_0\ : STD_LOGIC;
  signal \cntSCL[14]_i_2_n_0\ : STD_LOGIC;
  signal \cntSCL[3]_i_2_n_0\ : STD_LOGIC;
  signal \cntSCL[6]_i_2_n_0\ : STD_LOGIC;
  signal \cntSCL[8]_i_2_n_0\ : STD_LOGIC;
  signal \cntSCL[8]_i_3_n_0\ : STD_LOGIC;
  signal \cntSCL[9]_i_2_n_0\ : STD_LOGIC;
  signal \cntSCL[9]_i_3_n_0\ : STD_LOGIC;
  signal \cntSCL[9]_i_4_n_0\ : STD_LOGIC;
  signal \cntSCL[9]_i_5_n_0\ : STD_LOGIC;
  signal \cntX[7]_i_2_n_0\ : STD_LOGIC;
  signal \cntX[7]_i_3_n_0\ : STD_LOGIC;
  signal \cntX[7]_i_4_n_0\ : STD_LOGIC;
  signal \g0_b0__0_i_1_n_0\ : STD_LOGIC;
  signal \g0_b0__0_i_7_n_0\ : STD_LOGIC;
  signal \g0_b0__0_i_8_n_0\ : STD_LOGIC;
  signal \g0_b0__0_i_9_n_0\ : STD_LOGIC;
  signal \g0_b0__0_n_0\ : STD_LOGIC;
  signal g0_b0_n_0 : STD_LOGIC;
  signal \g0_b1__0_n_0\ : STD_LOGIC;
  signal g0_b1_n_0 : STD_LOGIC;
  signal \g0_b2__0_n_0\ : STD_LOGIC;
  signal g0_b2_n_0 : STD_LOGIC;
  signal \g0_b3__0_n_0\ : STD_LOGIC;
  signal g0_b3_n_0 : STD_LOGIC;
  signal \g0_b4__0_n_0\ : STD_LOGIC;
  signal g0_b4_n_0 : STD_LOGIC;
  signal \g0_b5__0_n_0\ : STD_LOGIC;
  signal g0_b5_n_0 : STD_LOGIC;
  signal \g0_b6__0_n_0\ : STD_LOGIC;
  signal g0_b6_n_0 : STD_LOGIC;
  signal g0_b7_n_0 : STD_LOGIC;
  signal g1_b0_n_0 : STD_LOGIC;
  signal g1_b1_n_0 : STD_LOGIC;
  signal g1_b3_n_0 : STD_LOGIC;
  signal g1_b4_n_0 : STD_LOGIC;
  signal g1_b6_n_0 : STD_LOGIC;
  signal iEmpty_i_1_n_0 : STD_LOGIC;
  signal iEmpty_i_2_n_0 : STD_LOGIC;
  signal iEmpty_i_3_n_0 : STD_LOGIC;
  signal iFull_i_1_n_0 : STD_LOGIC;
  signal iFull_i_2_n_0 : STD_LOGIC;
  signal iFull_i_3_n_0 : STD_LOGIC;
  signal \i_I2C/FSM_onehot_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_I2C/FSM_onehot_state_reg_n_0_[5]\ : STD_LOGIC;
  signal \i_I2C/RdNotWr0\ : STD_LOGIC;
  signal \i_I2C/SCLin\ : STD_LOGIC;
  signal \i_I2C/SCLout_reg_n_0\ : STD_LOGIC;
  signal \i_I2C/SDAin\ : STD_LOGIC;
  signal \i_I2C/SDAout\ : STD_LOGIC;
  signal \i_I2C/T\ : STD_LOGIC;
  signal \i_I2C/cntBits\ : STD_LOGIC;
  signal \i_I2C/cntBits_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_I2C/cntBits_reg_n_0_[1]\ : STD_LOGIC;
  signal \i_I2C/cntBits_reg_n_0_[2]\ : STD_LOGIC;
  signal \i_I2C/cntBits_reg_n_0_[3]\ : STD_LOGIC;
  signal \i_I2C/cntSCL\ : STD_LOGIC;
  signal \i_I2C/cntSCL__0\ : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \i_I2C/i_FIFO/DoPush\ : STD_LOGIC;
  signal \i_I2C/i_FIFO/addrRd\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \i_I2C/i_FIFO/addrRd_reg\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \i_I2C/i_FIFO/p_1_in\ : STD_LOGIC;
  signal \i_I2C/i_FIFO/plusOp0_in\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \i_I2C/p_0_in\ : STD_LOGIC;
  signal \i_I2C/rSDAin\ : STD_LOGIC;
  signal \i_I2C/sclEnd\ : STD_LOGIC;
  signal \i_I2C/sregOut[0]_i_1_n_0\ : STD_LOGIC;
  signal \i_I2C/sregOut[1]_i_1_n_0\ : STD_LOGIC;
  signal \i_I2C/sregOut[2]_i_1_n_0\ : STD_LOGIC;
  signal \i_I2C/sregOut[3]_i_1_n_0\ : STD_LOGIC;
  signal \i_I2C/sregOut[4]_i_1_n_0\ : STD_LOGIC;
  signal \i_I2C/sregOut[5]_i_1_n_0\ : STD_LOGIC;
  signal \i_I2C/sregOut[6]_i_1_n_0\ : STD_LOGIC;
  signal \i_I2C/sregOut[7]_i_3_n_0\ : STD_LOGIC;
  signal \i_I2C/sregOut_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_I2C/sregOut_reg_n_0_[1]\ : STD_LOGIC;
  signal \i_I2C/sregOut_reg_n_0_[2]\ : STD_LOGIC;
  signal \i_I2C/sregOut_reg_n_0_[3]\ : STD_LOGIC;
  signal \i_I2C/sregOut_reg_n_0_[4]\ : STD_LOGIC;
  signal \i_I2C/sregOut_reg_n_0_[5]\ : STD_LOGIC;
  signal \i_I2C/sregOut_reg_n_0_[6]\ : STD_LOGIC;
  signal \i_Master/L\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \i_Master/addrROM_reg\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \i_Master/addrROM_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 3 );
  signal \i_Master/addrROM_reg__0__0\ : STD_LOGIC_VECTOR ( 5 to 5 );
  signal \i_Master/cnt20b0\ : STD_LOGIC;
  signal \i_Master/cnt20b_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_Master/cnt20b_reg_n_0_[1]\ : STD_LOGIC;
  signal \i_Master/cnt20b_reg_n_0_[2]\ : STD_LOGIC;
  signal \i_Master/cnt20b_reg_n_0_[3]\ : STD_LOGIC;
  signal \i_Master/cnt20b_reg_n_0_[4]\ : STD_LOGIC;
  signal \i_Master/cnt20b_reg_n_0_[5]\ : STD_LOGIC;
  signal \i_Master/cnt20b_reg_n_0_[6]\ : STD_LOGIC;
  signal \i_Master/cntHeartbeat0\ : STD_LOGIC;
  signal \i_Master/cntHeartbeat_reg\ : STD_LOGIC_VECTOR ( 5 downto 4 );
  signal \i_Master/cntHeartbeat_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_Master/cntHeartbeat_reg_n_0_[1]\ : STD_LOGIC;
  signal \i_Master/cntHeartbeat_reg_n_0_[3]\ : STD_LOGIC;
  signal \i_Master/cntX_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_Master/cntX_reg_n_0_[4]\ : STD_LOGIC;
  signal \i_Master/cntX_reg_n_0_[5]\ : STD_LOGIC;
  signal \i_Master/cntX_reg_n_0_[6]\ : STD_LOGIC;
  signal \i_Master/ib.iChar_ROM/RAM_reg_0_15_0_7_i_12_n_0\ : STD_LOGIC;
  signal \i_Master/ib.iChar_ROM/RAM_reg_0_15_0_7_i_26_n_0\ : STD_LOGIC;
  signal \i_Master/next_state\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \i_Master/p_0_in\ : STD_LOGIC;
  signal \i_Master/p_0_out\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \i_Master/p_3_in\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \i_Master/p_8_in\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \i_Master/regBlank_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_Master/regBlank_reg_n_0_[1]\ : STD_LOGIC;
  signal \i_Master/regBlank_reg_n_0_[2]\ : STD_LOGIC;
  signal \i_Master/regBlank_reg_n_0_[3]\ : STD_LOGIC;
  signal \i_Master/regBlank_reg_n_0_[4]\ : STD_LOGIC;
  signal \i_Master/regBlank_reg_n_0_[5]\ : STD_LOGIC;
  signal \i_Master/regBlank_reg_n_0_[6]\ : STD_LOGIC;
  signal \i_Master/regBlank_reg_n_0_[7]\ : STD_LOGIC;
  signal \i_Master/regDI\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[10]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[11]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[12]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[13]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[14]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[15]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[16]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[17]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[18]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[19]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[1]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[20]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[21]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[22]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[23]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[24]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[25]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[26]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[27]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[28]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[29]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[2]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[30]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[31]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[3]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[4]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[5]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[6]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[7]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[8]\ : STD_LOGIC;
  signal \i_Master/regDI_reg_n_0_[9]\ : STD_LOGIC;
  signal \i_Master/regDecPts_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_Master/regDecPts_reg_n_0_[1]\ : STD_LOGIC;
  signal \i_Master/regDecPts_reg_n_0_[2]\ : STD_LOGIC;
  signal \i_Master/regDecPts_reg_n_0_[3]\ : STD_LOGIC;
  signal \i_Master/regDecPts_reg_n_0_[4]\ : STD_LOGIC;
  signal \i_Master/regDecPts_reg_n_0_[5]\ : STD_LOGIC;
  signal \i_Master/regDecPts_reg_n_0_[6]\ : STD_LOGIC;
  signal \i_Master/state\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal in100 : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \plusOp__1\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal rSCLin : STD_LOGIC;
  signal regBlank : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal regDI : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal regDecPts : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal sel : STD_LOGIC_VECTOR ( 6 downto 1 );
  signal sregOut : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \sregOut[7]_i_2_n_0\ : STD_LOGIC;
  signal \sregOut[7]_i_4_n_0\ : STD_LOGIC;
  signal \sregOut[7]_i_5_n_0\ : STD_LOGIC;
  signal \sregOut[7]_i_6_n_0\ : STD_LOGIC;
  signal \NLW_cnt20b_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \NLW_cnt20b_reg[8]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_i_I2C/i_FIFO/RAM_reg_0_15_0_7_DOE_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_i_I2C/i_FIFO/RAM_reg_0_15_0_7_DOF_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_i_I2C/i_FIFO/RAM_reg_0_15_0_7_DOG_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_i_I2C/i_FIFO/RAM_reg_0_15_0_7_DOH_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[0]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \FSM_onehot_state[1]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \FSM_onehot_state[3]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \FSM_sequential_state[3]_i_10\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state[3]_i_2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \FSM_sequential_state[3]_i_7\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state[3]_i_8\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of NACK_i_3 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of NACK_i_4 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of RAM_reg_0_15_0_7_i_10 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of RAM_reg_0_15_0_7_i_20 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of RAM_reg_0_15_0_7_i_21 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of RAM_reg_0_15_0_7_i_23 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of RAM_reg_0_15_0_7_i_32 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of RAM_reg_0_15_0_7_i_33 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of RAM_reg_0_15_0_7_i_34 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of SCLout_i_4 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of SCLout_i_7 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of SCLout_i_8 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of SDAout_i_5 : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of SDAout_i_9 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \addrROM[0]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \addrROM[1]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \addrROM[2]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \addrROM[3]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \addrROM[4]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \addrRd[0]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \addrRd[1]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \addrRd[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \addrRd[3]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \addrRd_rep[1]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \addrRd_rep[2]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \addrRd_rep[3]_i_2\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \addrRd_rep[3]_i_3\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \addrWr[0]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \addrWr[1]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \addrWr[2]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \addrWr[3]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \cntBits[0]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \cntBits[1]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \cntBits[2]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \cntBits[3]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \cntBits[3]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \cntBits[3]_i_5\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cntHeartbeat[1]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \cntHeartbeat[2]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \cntHeartbeat[3]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \cntHeartbeat[4]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \cntSCL[11]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \cntSCL[12]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \cntSCL[13]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \cntSCL[14]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \cntSCL[1]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \cntSCL[2]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \cntSCL[3]_i_2\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \cntSCL[4]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \cntSCL[6]_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \cntSCL[8]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \cntSCL[8]_i_3\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \cntSCL[9]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \cntX[1]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \cntX[2]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \cntX[3]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \cntX[4]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \cntX[7]_i_3\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of g0_b0 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \g0_b0__0_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \g0_b0__0_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \g0_b0__0_i_7\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \g0_b0__0_i_8\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of g0_b1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of g0_b2 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of g0_b3 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of g0_b4 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of g0_b5 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of g0_b6 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of g0_b7 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of iEmpty_i_3 : label is "soft_lutpair26";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \i_I2C/FSM_onehot_state_reg[0]\ : label is "sreset:100000,sidle:000010,sstart:010000,sbytewrite:001000,sstop:000001,sbyteread:000100";
  attribute FSM_ENCODED_STATES of \i_I2C/FSM_onehot_state_reg[1]\ : label is "sreset:100000,sidle:000010,sstart:010000,sbytewrite:001000,sstop:000001,sbyteread:000100";
  attribute FSM_ENCODED_STATES of \i_I2C/FSM_onehot_state_reg[3]\ : label is "sreset:100000,sidle:000010,sstart:010000,sbytewrite:001000,sstop:000001,sbyteread:000100";
  attribute FSM_ENCODED_STATES of \i_I2C/FSM_onehot_state_reg[4]\ : label is "sreset:100000,sidle:000010,sstart:010000,sbytewrite:001000,sstop:000001,sbyteread:000100";
  attribute FSM_ENCODED_STATES of \i_I2C/FSM_onehot_state_reg[5]\ : label is "sreset:100000,sidle:000010,sstart:010000,sbytewrite:001000,sstop:000001,sbyteread:000100";
  attribute box_type : string;
  attribute box_type of \i_I2C/IOBUF_SCL\ : label is "PRIMITIVE";
  attribute box_type of \i_I2C/IOBUF_SDA\ : label is "PRIMITIVE";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \i_I2C/i_FIFO/RAM_reg_0_15_0_7\ : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of \i_I2C/i_FIFO/RAM_reg_0_15_0_7\ : label is 128;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of \i_I2C/i_FIFO/RAM_reg_0_15_0_7\ : label is "OLED_1x32/i_I2C/i_FIFO/RAM_reg";
  attribute RTL_RAM_STYLE : string;
  attribute RTL_RAM_STYLE of \i_I2C/i_FIFO/RAM_reg_0_15_0_7\ : label is "auto";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of \i_I2C/i_FIFO/RAM_reg_0_15_0_7\ : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of \i_I2C/i_FIFO/RAM_reg_0_15_0_7\ : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of \i_I2C/i_FIFO/RAM_reg_0_15_0_7\ : label is 15;
  attribute ram_offset : integer;
  attribute ram_offset of \i_I2C/i_FIFO/RAM_reg_0_15_0_7\ : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of \i_I2C/i_FIFO/RAM_reg_0_15_0_7\ : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of \i_I2C/i_FIFO/RAM_reg_0_15_0_7\ : label is 7;
  attribute IOB : string;
  attribute IOB of \i_I2C/rSCLin_reg\ : label is "TRUE";
  attribute IOB of \i_I2C/rSDAin_reg\ : label is "TRUE";
  attribute FSM_ENCODED_STATES of \i_Master/FSM_sequential_state_reg[0]\ : label is "spushinit:0000,swaitinit:0001,swaitpixels:0011,sgoinit:0101,sgopixels:0100,spixels:0110,swaitconfig:0111,swaitready:1000,sreset:1001,spushconfig:1100,swaitcls:1010,sgoconfig:1011,spushcls:1101,sgocls:0010";
  attribute FSM_ENCODED_STATES of \i_Master/FSM_sequential_state_reg[1]\ : label is "spushinit:0000,swaitinit:0001,swaitpixels:0011,sgoinit:0101,sgopixels:0100,spixels:0110,swaitconfig:0111,swaitready:1000,sreset:1001,spushconfig:1100,swaitcls:1010,sgoconfig:1011,spushcls:1101,sgocls:0010";
  attribute FSM_ENCODED_STATES of \i_Master/FSM_sequential_state_reg[2]\ : label is "spushinit:0000,swaitinit:0001,swaitpixels:0011,sgoinit:0101,sgopixels:0100,spixels:0110,swaitconfig:0111,swaitready:1000,sreset:1001,spushconfig:1100,swaitcls:1010,sgoconfig:1011,spushcls:1101,sgocls:0010";
  attribute FSM_ENCODED_STATES of \i_Master/FSM_sequential_state_reg[3]\ : label is "spushinit:0000,swaitinit:0001,swaitpixels:0011,sgoinit:0101,sgopixels:0100,spixels:0110,swaitconfig:0111,swaitready:1000,sreset:1001,spushconfig:1100,swaitcls:1010,sgoconfig:1011,spushcls:1101,sgocls:0010";
  attribute SOFT_HLUTNM of \sregOut[7]_i_4\ : label is "soft_lutpair1";
begin
  I2C_NACK <= \^i2c_nack\;
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \i_I2C/p_0_in\,
      I1 => I2C_FIFO_Empty,
      O => \FSM_onehot_state[0]_i_1_n_0\
    );
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \i_I2C/FSM_onehot_state_reg_n_0_[0]\,
      I1 => \i_I2C/FSM_onehot_state_reg_n_0_[5]\,
      O => \FSM_onehot_state[1]_i_1_n_0\
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \i_I2C/cntBits\,
      I1 => I2C_FIFO_Empty,
      I2 => \i_I2C/p_0_in\,
      O => \FSM_onehot_state[3]_i_1_n_0\
    );
\FSM_onehot_state[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFD00"
    )
        port map (
      I0 => NACK_i_4_n_0,
      I1 => \i_I2C/cntBits\,
      I2 => \i_I2C/FSM_onehot_state_reg_n_0_[0]\,
      I3 => \i_I2C/sclEnd\,
      I4 => \i_I2C/RdNotWr0\,
      I5 => \i_I2C/FSM_onehot_state_reg_n_0_[5]\,
      O => \FSM_onehot_state[5]_i_1_n_0\
    );
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5545"
    )
        port map (
      I0 => \i_Master/state\(0),
      I1 => \i_Master/state\(3),
      I2 => \i_Master/state\(2),
      I3 => \i_Master/state\(1),
      O => \FSM_sequential_state[0]_i_1_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"89EA"
    )
        port map (
      I0 => \i_Master/state\(2),
      I1 => \i_Master/state\(3),
      I2 => \i_Master/state\(1),
      I3 => \i_Master/state\(0),
      O => \i_Master/next_state\(1)
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6B54"
    )
        port map (
      I0 => \i_Master/state\(0),
      I1 => \i_Master/state\(3),
      I2 => \i_Master/state\(2),
      I3 => \i_Master/state\(1),
      O => \i_Master/next_state\(2)
    );
\FSM_sequential_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"444AFFFF444A444A"
    )
        port map (
      I0 => \i_Master/state\(2),
      I1 => \i_I2C/cntSCL\,
      I2 => \i_Master/state\(1),
      I3 => \i_Master/state\(3),
      I4 => \FSM_sequential_state[3]_i_3_n_0\,
      I5 => \FSM_sequential_state[3]_i_4_n_0\,
      O => \FSM_sequential_state[3]_i_1_n_0\
    );
\FSM_sequential_state[3]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \i_Master/state\(2),
      I1 => \i_Master/state\(1),
      O => \FSM_sequential_state[3]_i_10_n_0\
    );
\FSM_sequential_state[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88B8"
    )
        port map (
      I0 => \i_Master/state\(3),
      I1 => \i_Master/state\(0),
      I2 => \i_Master/state\(1),
      I3 => \i_Master/state\(2),
      O => \i_Master/next_state\(3)
    );
\FSM_sequential_state[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E0EE0000000E0000"
    )
        port map (
      I0 => \FSM_sequential_state[3]_i_5_n_0\,
      I1 => \FSM_sequential_state[3]_i_6_n_0\,
      I2 => \i_Master/state\(3),
      I3 => \i_I2C/cntSCL\,
      I4 => \i_Master/state\(0),
      I5 => \i_Master/state\(2),
      O => \FSM_sequential_state[3]_i_3_n_0\
    );
\FSM_sequential_state[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF1151"
    )
        port map (
      I0 => \FSM_sequential_state[3]_i_7_n_0\,
      I1 => \i_Master/state\(2),
      I2 => \i_Master/p_0_in\,
      I3 => \FSM_sequential_state[3]_i_8_n_0\,
      I4 => \FSM_sequential_state[3]_i_9_n_0\,
      O => \FSM_sequential_state[3]_i_4_n_0\
    );
\FSM_sequential_state[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \FSM_sequential_state[3]_i_10_n_0\,
      I1 => I2C_FIFO_Full,
      I2 => \i_Master/cnt20b_reg_n_0_[4]\,
      I3 => \i_Master/cnt20b_reg_n_0_[5]\,
      I4 => \i_Master/cnt20b_reg_n_0_[0]\,
      I5 => \i_Master/p_3_in\(1),
      O => \FSM_sequential_state[3]_i_5_n_0\
    );
\FSM_sequential_state[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \i_Master/p_3_in\(0),
      I1 => \i_Master/p_3_in\(2),
      I2 => \i_Master/cnt20b_reg_n_0_[2]\,
      I3 => \i_Master/cnt20b_reg_n_0_[1]\,
      I4 => \i_Master/cnt20b_reg_n_0_[6]\,
      I5 => \i_Master/cnt20b_reg_n_0_[3]\,
      O => \FSM_sequential_state[3]_i_6_n_0\
    );
\FSM_sequential_state[3]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFC0DD"
    )
        port map (
      I0 => \addrROM[5]_i_5_n_0\,
      I1 => I2C_FIFO_Full,
      I2 => \i_Master/state\(2),
      I3 => \i_Master/state\(1),
      I4 => \i_Master/state\(3),
      O => \FSM_sequential_state[3]_i_7_n_0\
    );
\FSM_sequential_state[3]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \cntX[7]_i_4_n_0\,
      I1 => \i_Master/cntX_reg_n_0_[6]\,
      O => \FSM_sequential_state[3]_i_8_n_0\
    );
\FSM_sequential_state[3]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABAAAAAA"
    )
        port map (
      I0 => \i_Master/state\(0),
      I1 => I2C_FIFO_Full,
      I2 => \i_Master/state\(1),
      I3 => \i_Master/state\(2),
      I4 => \addrROM[5]_i_6_n_0\,
      O => \FSM_sequential_state[3]_i_9_n_0\
    );
NACK_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAAAAE"
    )
        port map (
      I0 => \^i2c_nack\,
      I1 => NACK_i_2_n_0,
      I2 => L(4),
      I3 => NACK_i_3_n_0,
      I4 => NACK_i_4_n_0,
      I5 => \i_I2C/FSM_onehot_state_reg_n_0_[5]\,
      O => NACK_i_1_n_0
    );
NACK_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => NACK_i_5_n_0,
      I1 => L(1),
      I2 => L(2),
      I3 => L(3),
      I4 => NACK_i_6_n_0,
      O => NACK_i_2_n_0
    );
NACK_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => L(8),
      I1 => L(11),
      I2 => L(10),
      O => NACK_i_3_n_0
    );
NACK_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFBFFFF"
    )
        port map (
      I0 => \i_I2C/cntBits_reg_n_0_[2]\,
      I1 => \i_I2C/cntBits_reg_n_0_[3]\,
      I2 => \i_I2C/cntBits_reg_n_0_[1]\,
      I3 => \i_I2C/cntBits_reg_n_0_[0]\,
      I4 => \i_I2C/p_0_in\,
      O => NACK_i_4_n_0
    );
NACK_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => L(7),
      I1 => \i_I2C/rSDAin\,
      I2 => L(9),
      I3 => L(6),
      I4 => L(5),
      I5 => L(0),
      O => NACK_i_5_n_0
    );
NACK_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => L(12),
      I1 => L(14),
      I2 => L(13),
      O => NACK_i_6_n_0
    );
RAM_reg_0_15_0_7_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01450101"
    )
        port map (
      I0 => I2C_FIFO_Full,
      I1 => \i_Master/state\(3),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(1),
      I4 => \i_Master/state\(2),
      O => \i_I2C/i_FIFO/DoPush\
    );
RAM_reg_0_15_0_7_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_32_n_0,
      I1 => \i_Master/p_3_in\(2),
      I2 => \i_Master/p_3_in\(1),
      I3 => \i_Master/p_3_in\(0),
      O => RAM_reg_0_15_0_7_i_10_n_0
    );
RAM_reg_0_15_0_7_i_11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EAFFFFFA"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_33_n_0,
      I1 => \i_Master/p_0_in\,
      I2 => \i_Master/L\(1),
      I3 => \i_Master/L\(2),
      I4 => \i_Master/L\(3),
      O => RAM_reg_0_15_0_7_i_11_n_0
    );
RAM_reg_0_15_0_7_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFBFF"
    )
        port map (
      I0 => \i_Master/state\(0),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(3),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/regBlank_reg_n_0_[7]\,
      I5 => \i_Master/p_0_in\,
      O => RAM_reg_0_15_0_7_i_13_n_0
    );
RAM_reg_0_15_0_7_i_14: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABFB"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_25_n_0,
      I1 => \g0_b4__0_n_0\,
      I2 => sel(6),
      I3 => g1_b4_n_0,
      O => RAM_reg_0_15_0_7_i_14_n_0
    );
RAM_reg_0_15_0_7_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888FF888888F88"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_20_n_0,
      I1 => g0_b1_n_0,
      I2 => \i_Master/addrROM_reg\(1),
      I3 => \i_Master/addrROM_reg\(2),
      I4 => RAM_reg_0_15_0_7_i_34_n_0,
      I5 => \i_Master/addrROM_reg\(0),
      O => RAM_reg_0_15_0_7_i_15_n_0
    );
RAM_reg_0_15_0_7_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000000E2"
    )
        port map (
      I0 => \g0_b0__0_n_0\,
      I1 => sel(6),
      I2 => g1_b0_n_0,
      I3 => \i_Master/p_0_in\,
      I4 => \i_Master/regBlank_reg_n_0_[7]\,
      I5 => RAM_reg_0_15_0_7_i_33_n_0,
      O => RAM_reg_0_15_0_7_i_16_n_0
    );
RAM_reg_0_15_0_7_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \FSM_sequential_state[3]_i_8_n_0\,
      I1 => \i_Master/p_0_in\,
      I2 => \i_Master/p_8_in\(0),
      I3 => \i_Master/cntHeartbeat_reg\(5),
      I4 => \i_Master/cntHeartbeat_reg\(4),
      I5 => RAM_reg_0_15_0_7_i_33_n_0,
      O => RAM_reg_0_15_0_7_i_17_n_0
    );
RAM_reg_0_15_0_7_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF150015001500"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_34_n_0,
      I1 => \i_Master/addrROM_reg\(1),
      I2 => \i_Master/addrROM_reg\(2),
      I3 => \i_Master/addrROM_reg\(0),
      I4 => RAM_reg_0_15_0_7_i_20_n_0,
      I5 => g0_b0_n_0,
      O => RAM_reg_0_15_0_7_i_18_n_0
    );
RAM_reg_0_15_0_7_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C0FFD0D0C0FFDDDD"
    )
        port map (
      I0 => \g0_b5__0_n_0\,
      I1 => RAM_reg_0_15_0_7_i_25_n_0,
      I2 => RAM_reg_0_15_0_7_i_13_n_0,
      I3 => g1_b1_n_0,
      I4 => sel(6),
      I5 => \g0_b1__0_n_0\,
      O => RAM_reg_0_15_0_7_i_19_n_0
    );
RAM_reg_0_15_0_7_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAAEAEEEE"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_10_n_0,
      I1 => RAM_reg_0_15_0_7_i_11_n_0,
      I2 => \i_Master/ib.iChar_ROM/RAM_reg_0_15_0_7_i_12_n_0\,
      I3 => RAM_reg_0_15_0_7_i_13_n_0,
      I4 => RAM_reg_0_15_0_7_i_14_n_0,
      I5 => RAM_reg_0_15_0_7_i_15_n_0,
      O => \i_Master/p_0_out\(1)
    );
RAM_reg_0_15_0_7_i_20: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \i_Master/state\(1),
      I1 => \i_Master/state\(0),
      I2 => \i_Master/state\(2),
      I3 => \i_Master/state\(3),
      O => RAM_reg_0_15_0_7_i_20_n_0
    );
RAM_reg_0_15_0_7_i_21: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => \i_Master/addrROM_reg\(2),
      I1 => \i_Master/addrROM_reg\(1),
      I2 => \i_Master/addrROM_reg\(0),
      I3 => RAM_reg_0_15_0_7_i_34_n_0,
      O => RAM_reg_0_15_0_7_i_21_n_0
    );
RAM_reg_0_15_0_7_i_22: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888F888F888888"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_20_n_0,
      I1 => g0_b2_n_0,
      I2 => RAM_reg_0_15_0_7_i_34_n_0,
      I3 => \i_Master/addrROM_reg\(1),
      I4 => \i_Master/addrROM_reg\(0),
      I5 => \i_Master/addrROM_reg\(2),
      O => RAM_reg_0_15_0_7_i_22_n_0
    );
RAM_reg_0_15_0_7_i_23: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_32_n_0,
      I1 => \i_Master/p_3_in\(2),
      I2 => \i_Master/p_3_in\(0),
      I3 => \i_Master/p_3_in\(1),
      O => RAM_reg_0_15_0_7_i_23_n_0
    );
RAM_reg_0_15_0_7_i_24: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF4540"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_13_n_0,
      I1 => g1_b4_n_0,
      I2 => sel(6),
      I3 => \g0_b2__0_n_0\,
      I4 => RAM_reg_0_15_0_7_i_35_n_0,
      O => RAM_reg_0_15_0_7_i_24_n_0
    );
RAM_reg_0_15_0_7_i_25: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFBFBFBFBFBFBFB"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_33_n_0,
      I1 => \i_Master/p_0_in\,
      I2 => \i_Master/regBlank_reg_n_0_[7]\,
      I3 => \i_Master/L\(2),
      I4 => \i_Master/L\(3),
      I5 => \i_Master/L\(1),
      O => RAM_reg_0_15_0_7_i_25_n_0
    );
RAM_reg_0_15_0_7_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888F8F888F8888"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_20_n_0,
      I1 => g0_b5_n_0,
      I2 => RAM_reg_0_15_0_7_i_34_n_0,
      I3 => \i_Master/addrROM_reg\(1),
      I4 => \i_Master/addrROM_reg\(2),
      I5 => \i_Master/addrROM_reg\(0),
      O => RAM_reg_0_15_0_7_i_27_n_0
    );
RAM_reg_0_15_0_7_i_28: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF004000400040"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_34_n_0,
      I1 => \i_Master/addrROM_reg\(0),
      I2 => \i_Master/addrROM_reg\(1),
      I3 => \i_Master/addrROM_reg\(2),
      I4 => RAM_reg_0_15_0_7_i_20_n_0,
      I5 => g0_b4_n_0,
      O => RAM_reg_0_15_0_7_i_28_n_0
    );
RAM_reg_0_15_0_7_i_29: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008A80"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_11_n_0,
      I1 => g1_b3_n_0,
      I2 => sel(6),
      I3 => \g0_b3__0_n_0\,
      I4 => RAM_reg_0_15_0_7_i_13_n_0,
      O => RAM_reg_0_15_0_7_i_29_n_0
    );
RAM_reg_0_15_0_7_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEAEE"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_10_n_0,
      I1 => RAM_reg_0_15_0_7_i_11_n_0,
      I2 => RAM_reg_0_15_0_7_i_16_n_0,
      I3 => RAM_reg_0_15_0_7_i_14_n_0,
      I4 => RAM_reg_0_15_0_7_i_17_n_0,
      I5 => RAM_reg_0_15_0_7_i_18_n_0,
      O => \i_Master/p_0_out\(0)
    );
RAM_reg_0_15_0_7_i_30: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A080A0A0A0A0A0A0"
    )
        port map (
      I0 => \i_Master/regDI_reg_n_0_[30]\,
      I1 => \i_Master/regDI_reg_n_0_[29]\,
      I2 => \i_Master/regDI_reg_n_0_[31]\,
      I3 => \g0_b0__0_i_7_n_0\,
      I4 => \g0_b0__0_i_8_n_0\,
      I5 => \g0_b0__0_i_9_n_0\,
      O => sel(6)
    );
RAM_reg_0_15_0_7_i_31: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF01011110"
    )
        port map (
      I0 => \i_Master/state\(0),
      I1 => \i_Master/state\(3),
      I2 => \i_Master/state\(2),
      I3 => g0_b6_n_0,
      I4 => \i_Master/state\(1),
      I5 => RAM_reg_0_15_0_7_i_21_n_0,
      O => RAM_reg_0_15_0_7_i_31_n_0
    );
RAM_reg_0_15_0_7_i_32: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => \i_Master/state\(2),
      I1 => \i_Master/state\(3),
      I2 => \i_Master/state\(1),
      I3 => \i_Master/state\(0),
      O => RAM_reg_0_15_0_7_i_32_n_0
    );
RAM_reg_0_15_0_7_i_33: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => \i_Master/state\(2),
      I1 => \i_Master/state\(3),
      I2 => \i_Master/state\(1),
      I3 => \i_Master/state\(0),
      O => RAM_reg_0_15_0_7_i_33_n_0
    );
RAM_reg_0_15_0_7_i_34: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDFF"
    )
        port map (
      I0 => \i_Master/state\(3),
      I1 => \i_Master/state\(0),
      I2 => \i_Master/state\(1),
      I3 => \i_Master/state\(2),
      O => RAM_reg_0_15_0_7_i_34_n_0
    );
RAM_reg_0_15_0_7_i_35: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_33_n_0,
      I1 => \i_Master/p_0_in\,
      I2 => in100,
      I3 => \i_Master/L\(2),
      I4 => \i_Master/L\(3),
      I5 => \i_Master/L\(1),
      O => RAM_reg_0_15_0_7_i_35_n_0
    );
RAM_reg_0_15_0_7_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF444"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_19_n_0,
      I1 => RAM_reg_0_15_0_7_i_11_n_0,
      I2 => g0_b3_n_0,
      I3 => RAM_reg_0_15_0_7_i_20_n_0,
      I4 => RAM_reg_0_15_0_7_i_21_n_0,
      O => \i_Master/p_0_out\(3)
    );
RAM_reg_0_15_0_7_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_19_n_0,
      I1 => RAM_reg_0_15_0_7_i_11_n_0,
      I2 => RAM_reg_0_15_0_7_i_22_n_0,
      O => \i_Master/p_0_out\(2)
    );
RAM_reg_0_15_0_7_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFEAEEEAEA"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_23_n_0,
      I1 => RAM_reg_0_15_0_7_i_11_n_0,
      I2 => RAM_reg_0_15_0_7_i_24_n_0,
      I3 => RAM_reg_0_15_0_7_i_25_n_0,
      I4 => \i_Master/ib.iChar_ROM/RAM_reg_0_15_0_7_i_26_n_0\,
      I5 => RAM_reg_0_15_0_7_i_27_n_0,
      O => \i_Master/p_0_out\(5)
    );
RAM_reg_0_15_0_7_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFEAEEEAEA"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_23_n_0,
      I1 => RAM_reg_0_15_0_7_i_11_n_0,
      I2 => RAM_reg_0_15_0_7_i_24_n_0,
      I3 => RAM_reg_0_15_0_7_i_25_n_0,
      I4 => \i_Master/ib.iChar_ROM/RAM_reg_0_15_0_7_i_26_n_0\,
      I5 => RAM_reg_0_15_0_7_i_28_n_0,
      O => \i_Master/p_0_out\(4)
    );
RAM_reg_0_15_0_7_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00010000"
    )
        port map (
      I0 => \i_Master/state\(1),
      I1 => \i_Master/state\(0),
      I2 => \i_Master/state\(2),
      I3 => \i_Master/state\(3),
      I4 => g0_b7_n_0,
      I5 => RAM_reg_0_15_0_7_i_29_n_0,
      O => \i_Master/p_0_out\(7)
    );
RAM_reg_0_15_0_7_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF54040000"
    )
        port map (
      I0 => RAM_reg_0_15_0_7_i_13_n_0,
      I1 => \g0_b3__0_n_0\,
      I2 => sel(6),
      I3 => g1_b3_n_0,
      I4 => RAM_reg_0_15_0_7_i_11_n_0,
      I5 => RAM_reg_0_15_0_7_i_31_n_0,
      O => \i_Master/p_0_out\(6)
    );
SCLout_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFD0FFF30C00FF23"
    )
        port map (
      I0 => SCLout_i_2_n_0,
      I1 => \i_I2C/cntBits\,
      I2 => SCLout_i_3_n_0,
      I3 => \i_I2C/FSM_onehot_state_reg_n_0_[0]\,
      I4 => SCLout_i_4_n_0,
      I5 => \i_I2C/SCLout_reg_n_0\,
      O => SCLout_i_1_n_0
    );
SCLout_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000020"
    )
        port map (
      I0 => SCLout_i_5_n_0,
      I1 => L(9),
      I2 => L(6),
      I3 => L(12),
      I4 => L(14),
      I5 => L(13),
      O => SCLout_i_2_n_0
    );
SCLout_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFBFFF"
    )
        port map (
      I0 => SCLout_i_6_n_0,
      I1 => L(1),
      I2 => L(2),
      I3 => L(3),
      I4 => SCLout_i_7_n_0,
      I5 => \cntBits[3]_i_4_n_0\,
      O => SCLout_i_3_n_0
    );
SCLout_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF5777"
    )
        port map (
      I0 => SCLout_i_5_n_0,
      I1 => L(8),
      I2 => L(6),
      I3 => L(7),
      I4 => \sregOut[7]_i_5_n_0\,
      O => SCLout_i_4_n_0
    );
SCLout_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000400"
    )
        port map (
      I0 => SCLout_i_7_n_0,
      I1 => L(5),
      I2 => L(0),
      I3 => L(1),
      I4 => L(2),
      I5 => SCLout_i_8_n_0,
      O => SCLout_i_5_n_0
    );
SCLout_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFF07FFFF"
    )
        port map (
      I0 => L(7),
      I1 => L(6),
      I2 => L(8),
      I3 => L(4),
      I4 => L(5),
      I5 => L(0),
      O => SCLout_i_6_n_0
    );
SCLout_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEFF"
    )
        port map (
      I0 => L(10),
      I1 => L(11),
      I2 => L(8),
      I3 => L(7),
      O => SCLout_i_7_n_0
    );
SCLout_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => L(3),
      I1 => L(4),
      O => SCLout_i_8_n_0
    );
SDAout_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8080808880808000"
    )
        port map (
      I0 => SDAout_i_2_n_0,
      I1 => SDAout_i_3_n_0,
      I2 => \i_I2C/SDAout\,
      I3 => SDAout_i_5_n_0,
      I4 => SDAout_i_6_n_0,
      I5 => \i_I2C/T\,
      O => SDAout_i_1_n_0
    );
SDAout_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFDFFFFFFFF"
    )
        port map (
      I0 => \sregOut[7]_i_6_n_0\,
      I1 => \sregOut[7]_i_5_n_0\,
      I2 => L(7),
      I3 => L(5),
      I4 => L(6),
      I5 => \i_I2C/FSM_onehot_state_reg_n_0_[0]\,
      O => SDAout_i_2_n_0
    );
SDAout_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEEEFFFFFFFFFFFF"
    )
        port map (
      I0 => \sregOut[7]_i_5_n_0\,
      I1 => \cntBits[3]_i_5_n_0\,
      I2 => L(6),
      I3 => L(7),
      I4 => L(8),
      I5 => SDAout_i_7_n_0,
      O => SDAout_i_3_n_0
    );
SDAout_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEFFFFF"
    )
        port map (
      I0 => \i_I2C/FSM_onehot_state_reg_n_0_[0]\,
      I1 => sregOut(7),
      I2 => \addrRd_rep[3]_i_3_n_0\,
      I3 => SDAout_i_8_n_0,
      I4 => \sregOut[7]_i_6_n_0\,
      O => \i_I2C/SDAout\
    );
SDAout_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => SDAout_i_8_n_0,
      I1 => \sregOut[7]_i_6_n_0\,
      I2 => \i_I2C/cntBits\,
      I3 => \i_I2C/FSM_onehot_state_reg_n_0_[0]\,
      O => SDAout_i_5_n_0
    );
SDAout_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000004440"
    )
        port map (
      I0 => \cntSCL[9]_i_5_n_0\,
      I1 => \i_I2C/FSM_onehot_state_reg_n_0_[0]\,
      I2 => SDAout_i_9_n_0,
      I3 => L(8),
      I4 => \cntSCL[9]_i_4_n_0\,
      I5 => \cntBits[3]_i_4_n_0\,
      O => SDAout_i_6_n_0
    );
SDAout_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000010000000000"
    )
        port map (
      I0 => L(1),
      I1 => L(0),
      I2 => L(2),
      I3 => \i_I2C/cntBits\,
      I4 => L(5),
      I5 => L(4),
      O => SDAout_i_7_n_0
    );
SDAout_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEF"
    )
        port map (
      I0 => NACK_i_6_n_0,
      I1 => L(9),
      I2 => \i_I2C/p_0_in\,
      I3 => L(6),
      I4 => L(7),
      I5 => L(5),
      O => SDAout_i_8_n_0
    );
SDAout_i_9: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => L(6),
      I1 => L(7),
      O => SDAout_i_9_n_0
    );
\addrROM[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \i_Master/addrROM_reg\(0),
      O => plusOp(0)
    );
\addrROM[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i_Master/addrROM_reg\(1),
      I1 => \i_Master/addrROM_reg\(0),
      O => plusOp(1)
    );
\addrROM[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \i_Master/addrROM_reg\(2),
      I1 => \i_Master/addrROM_reg\(0),
      I2 => \i_Master/addrROM_reg\(1),
      O => plusOp(2)
    );
\addrROM[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \i_Master/addrROM_reg__0\(3),
      I1 => \i_Master/addrROM_reg\(1),
      I2 => \i_Master/addrROM_reg\(0),
      I3 => \i_Master/addrROM_reg\(2),
      O => plusOp(3)
    );
\addrROM[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \i_Master/addrROM_reg__0\(4),
      I1 => \i_Master/addrROM_reg\(2),
      I2 => \i_Master/addrROM_reg\(0),
      I3 => \i_Master/addrROM_reg\(1),
      I4 => \i_Master/addrROM_reg__0\(3),
      O => plusOp(4)
    );
\addrROM[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001F0000F000001"
    )
        port map (
      I0 => \addrROM[5]_i_4_n_0\,
      I1 => I2C_FIFO_Full,
      I2 => \i_Master/state\(1),
      I3 => \i_Master/state\(0),
      I4 => \i_Master/state\(2),
      I5 => \i_Master/state\(3),
      O => \addrROM[5]_i_1_n_0\
    );
\addrROM[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000001"
    )
        port map (
      I0 => I2C_FIFO_Full,
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      O => \addrROM[5]_i_2_n_0\
    );
\addrROM[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \i_Master/addrROM_reg__0__0\(5),
      I1 => \i_Master/addrROM_reg__0\(4),
      I2 => \i_Master/addrROM_reg__0\(3),
      I3 => \i_Master/addrROM_reg\(2),
      I4 => \i_Master/addrROM_reg\(0),
      I5 => \i_Master/addrROM_reg\(1),
      O => plusOp(5)
    );
\addrROM[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF3FFFDFFFFFFFD"
    )
        port map (
      I0 => \addrROM[5]_i_5_n_0\,
      I1 => \i_Master/state\(3),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(1),
      I4 => \i_Master/state\(2),
      I5 => \addrROM[5]_i_6_n_0\,
      O => \addrROM[5]_i_4_n_0\
    );
\addrROM[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => \i_Master/addrROM_reg\(1),
      I1 => \i_Master/addrROM_reg\(0),
      I2 => \i_Master/addrROM_reg\(2),
      I3 => \i_Master/addrROM_reg__0\(4),
      I4 => \i_Master/addrROM_reg__0\(3),
      I5 => \i_Master/addrROM_reg__0__0\(5),
      O => \addrROM[5]_i_5_n_0\
    );
\addrROM[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => \i_Master/addrROM_reg\(1),
      I1 => \i_Master/addrROM_reg\(2),
      I2 => \i_Master/addrROM_reg__0__0\(5),
      I3 => \i_Master/addrROM_reg__0\(4),
      I4 => \i_Master/addrROM_reg__0\(3),
      I5 => \i_Master/addrROM_reg\(0),
      O => \addrROM[5]_i_6_n_0\
    );
\addrRd[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i_I2C/i_FIFO/addrRd_reg\(0),
      I1 => \i_I2C/i_FIFO/p_1_in\,
      O => \addrRd[0]_i_1_n_0\
    );
\addrRd[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \i_I2C/i_FIFO/addrRd_reg\(0),
      I1 => \i_I2C/i_FIFO/p_1_in\,
      I2 => \i_I2C/i_FIFO/addrRd_reg\(1),
      O => \addrRd[1]_i_1_n_0\
    );
\addrRd[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \i_I2C/i_FIFO/addrRd_reg\(1),
      I1 => \i_I2C/i_FIFO/addrRd_reg\(0),
      I2 => \i_I2C/i_FIFO/p_1_in\,
      I3 => \i_I2C/i_FIFO/addrRd_reg\(2),
      O => \addrRd[2]_i_1_n_0\
    );
\addrRd[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \i_I2C/i_FIFO/addrRd_reg\(2),
      I1 => \i_I2C/i_FIFO/addrRd_reg\(1),
      I2 => \i_I2C/i_FIFO/addrRd_reg\(0),
      I3 => \i_I2C/i_FIFO/p_1_in\,
      I4 => \i_I2C/i_FIFO/addrRd_reg\(3),
      O => \addrRd[3]_i_1_n_0\
    );
\addrRd_rep[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \i_I2C/i_FIFO/addrRd_reg\(0),
      O => \i_I2C/i_FIFO/plusOp0_in\(0)
    );
\addrRd_rep[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i_I2C/i_FIFO/addrRd_reg\(0),
      I1 => \i_I2C/i_FIFO/addrRd_reg\(1),
      O => \i_I2C/i_FIFO/plusOp0_in\(1)
    );
\addrRd_rep[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \i_I2C/i_FIFO/addrRd_reg\(2),
      I1 => \i_I2C/i_FIFO/addrRd_reg\(1),
      I2 => \i_I2C/i_FIFO/addrRd_reg\(0),
      O => \i_I2C/i_FIFO/plusOp0_in\(2)
    );
\addrRd_rep[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000400"
    )
        port map (
      I0 => \i_I2C/cntSCL\,
      I1 => \i_I2C/sclEnd\,
      I2 => I2C_FIFO_Empty,
      I3 => \i_I2C/p_0_in\,
      I4 => \addrRd_rep[3]_i_3_n_0\,
      O => \i_I2C/i_FIFO/p_1_in\
    );
\addrRd_rep[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \i_I2C/i_FIFO/addrRd_reg\(2),
      I1 => \i_I2C/i_FIFO/addrRd_reg\(1),
      I2 => \i_I2C/i_FIFO/addrRd_reg\(0),
      I3 => \i_I2C/i_FIFO/addrRd_reg\(3),
      O => \i_I2C/i_FIFO/plusOp0_in\(3)
    );
\addrRd_rep[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \i_I2C/cntBits_reg_n_0_[0]\,
      I1 => \i_I2C/cntBits_reg_n_0_[1]\,
      I2 => \i_I2C/cntBits_reg_n_0_[3]\,
      I3 => \i_I2C/cntBits_reg_n_0_[2]\,
      O => \addrRd_rep[3]_i_3_n_0\
    );
\addrWr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => addrWr_reg(0),
      O => \addrWr[0]_i_1_n_0\
    );
\addrWr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => addrWr_reg(1),
      I1 => addrWr_reg(0),
      O => \addrWr[1]_i_1_n_0\
    );
\addrWr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => addrWr_reg(2),
      I1 => addrWr_reg(0),
      I2 => addrWr_reg(1),
      O => \addrWr[2]_i_1_n_0\
    );
\addrWr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => addrWr_reg(3),
      I1 => addrWr_reg(1),
      I2 => addrWr_reg(0),
      I3 => addrWr_reg(2),
      O => \addrWr[3]_i_1_n_0\
    );
\cnt20b[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0024"
    )
        port map (
      I0 => \i_Master/state\(3),
      I1 => \i_Master/state\(2),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(1),
      O => \cnt20b[0]_i_1_n_0\
    );
\cnt20b[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \i_Master/state\(0),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(3),
      I3 => \i_Master/state\(2),
      I4 => I2C_FIFO_Full,
      O => \i_Master/cnt20b0\
    );
\cnt20b[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \i_Master/cnt20b_reg_n_0_[0]\,
      O => \cnt20b[0]_i_4_n_0\
    );
\cnt20b_reg[0]_i_3\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \cnt20b_reg[0]_i_3_n_0\,
      CO(6) => \cnt20b_reg[0]_i_3_n_1\,
      CO(5) => \cnt20b_reg[0]_i_3_n_2\,
      CO(4) => \cnt20b_reg[0]_i_3_n_3\,
      CO(3) => \cnt20b_reg[0]_i_3_n_4\,
      CO(2) => \cnt20b_reg[0]_i_3_n_5\,
      CO(1) => \cnt20b_reg[0]_i_3_n_6\,
      CO(0) => \cnt20b_reg[0]_i_3_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \cnt20b_reg[0]_i_3_n_8\,
      O(6) => \cnt20b_reg[0]_i_3_n_9\,
      O(5) => \cnt20b_reg[0]_i_3_n_10\,
      O(4) => \cnt20b_reg[0]_i_3_n_11\,
      O(3) => \cnt20b_reg[0]_i_3_n_12\,
      O(2) => \cnt20b_reg[0]_i_3_n_13\,
      O(1) => \cnt20b_reg[0]_i_3_n_14\,
      O(0) => \cnt20b_reg[0]_i_3_n_15\,
      S(7) => \i_Master/p_3_in\(0),
      S(6) => \i_Master/cnt20b_reg_n_0_[6]\,
      S(5) => \i_Master/cnt20b_reg_n_0_[5]\,
      S(4) => \i_Master/cnt20b_reg_n_0_[4]\,
      S(3) => \i_Master/cnt20b_reg_n_0_[3]\,
      S(2) => \i_Master/cnt20b_reg_n_0_[2]\,
      S(1) => \i_Master/cnt20b_reg_n_0_[1]\,
      S(0) => \cnt20b[0]_i_4_n_0\
    );
\cnt20b_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \cnt20b_reg[0]_i_3_n_0\,
      CI_TOP => '0',
      CO(7 downto 1) => \NLW_cnt20b_reg[8]_i_1_CO_UNCONNECTED\(7 downto 1),
      CO(0) => \cnt20b_reg[8]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 2) => \NLW_cnt20b_reg[8]_i_1_O_UNCONNECTED\(7 downto 2),
      O(1) => \cnt20b_reg[8]_i_1_n_14\,
      O(0) => \cnt20b_reg[8]_i_1_n_15\,
      S(7 downto 2) => B"000000",
      S(1 downto 0) => \i_Master/p_3_in\(2 downto 1)
    );
\cntBits[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FB"
    )
        port map (
      I0 => \i_I2C/cntBits_reg_n_0_[2]\,
      I1 => \i_I2C/cntBits_reg_n_0_[3]\,
      I2 => \i_I2C/cntBits_reg_n_0_[1]\,
      I3 => \i_I2C/cntBits_reg_n_0_[0]\,
      O => \cntBits[0]_i_1_n_0\
    );
\cntBits[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i_I2C/cntBits_reg_n_0_[1]\,
      I1 => \i_I2C/cntBits_reg_n_0_[0]\,
      O => \cntBits[1]_i_1_n_0\
    );
\cntBits[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \i_I2C/cntBits_reg_n_0_[2]\,
      I1 => \i_I2C/cntBits_reg_n_0_[0]\,
      I2 => \i_I2C/cntBits_reg_n_0_[1]\,
      O => \cntBits[2]_i_1_n_0\
    );
\cntBits[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000002000"
    )
        port map (
      I0 => L(5),
      I1 => L(4),
      I2 => \cntSCL[6]_i_2_n_0\,
      I3 => \cntBits[3]_i_3_n_0\,
      I4 => \cntBits[3]_i_4_n_0\,
      I5 => \cntBits[3]_i_5_n_0\,
      O => \i_I2C/sclEnd\
    );
\cntBits[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7E80"
    )
        port map (
      I0 => \i_I2C/cntBits_reg_n_0_[2]\,
      I1 => \i_I2C/cntBits_reg_n_0_[0]\,
      I2 => \i_I2C/cntBits_reg_n_0_[1]\,
      I3 => \i_I2C/cntBits_reg_n_0_[3]\,
      O => \cntBits[3]_i_2_n_0\
    );
\cntBits[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => L(6),
      I1 => L(7),
      I2 => L(8),
      O => \cntBits[3]_i_3_n_0\
    );
\cntBits[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEFEFEFFFFFEFF"
    )
        port map (
      I0 => L(13),
      I1 => L(14),
      I2 => L(12),
      I3 => L(9),
      I4 => L(10),
      I5 => L(11),
      O => \cntBits[3]_i_4_n_0\
    );
\cntBits[3]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEFFF"
    )
        port map (
      I0 => L(11),
      I1 => L(10),
      I2 => L(8),
      I3 => L(7),
      I4 => L(3),
      O => \cntBits[3]_i_5_n_0\
    );
\cntHeartbeat[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \i_Master/cntHeartbeat_reg_n_0_[0]\,
      O => \plusOp__1\(0)
    );
\cntHeartbeat[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i_Master/cntHeartbeat_reg_n_0_[1]\,
      I1 => \i_Master/cntHeartbeat_reg_n_0_[0]\,
      O => \plusOp__1\(1)
    );
\cntHeartbeat[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \i_Master/p_8_in\(0),
      I1 => \i_Master/cntHeartbeat_reg_n_0_[0]\,
      I2 => \i_Master/cntHeartbeat_reg_n_0_[1]\,
      O => \plusOp__1\(2)
    );
\cntHeartbeat[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \i_Master/cntHeartbeat_reg_n_0_[3]\,
      I1 => \i_Master/cntHeartbeat_reg_n_0_[1]\,
      I2 => \i_Master/cntHeartbeat_reg_n_0_[0]\,
      I3 => \i_Master/p_8_in\(0),
      O => \plusOp__1\(3)
    );
\cntHeartbeat[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \i_Master/cntHeartbeat_reg\(4),
      I1 => \i_Master/p_8_in\(0),
      I2 => \i_Master/cntHeartbeat_reg_n_0_[0]\,
      I3 => \i_Master/cntHeartbeat_reg_n_0_[1]\,
      I4 => \i_Master/cntHeartbeat_reg_n_0_[3]\,
      O => \plusOp__1\(4)
    );
\cntHeartbeat[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \i_Master/cntHeartbeat_reg\(5),
      I1 => \i_Master/cntHeartbeat_reg_n_0_[3]\,
      I2 => \i_Master/cntHeartbeat_reg_n_0_[1]\,
      I3 => \i_Master/cntHeartbeat_reg_n_0_[0]\,
      I4 => \i_Master/p_8_in\(0),
      I5 => \i_Master/cntHeartbeat_reg\(4),
      O => \plusOp__1\(5)
    );
\cntSCL[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => L(0),
      O => \i_I2C/cntSCL__0\(0)
    );
\cntSCL[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => L(10),
      I1 => L(6),
      I2 => \cntSCL[10]_i_2_n_0\,
      I3 => L(8),
      I4 => L(7),
      I5 => L(9),
      O => \i_I2C/cntSCL__0\(10)
    );
\cntSCL[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => L(1),
      I1 => L(0),
      I2 => L(2),
      I3 => L(5),
      I4 => L(3),
      I5 => L(4),
      O => \cntSCL[10]_i_2_n_0\
    );
\cntSCL[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => L(11),
      I1 => \cntSCL[11]_i_2_n_0\,
      I2 => L(8),
      I3 => L(7),
      I4 => L(9),
      I5 => L(10),
      O => \i_I2C/cntSCL__0\(11)
    );
\cntSCL[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => L(6),
      I1 => L(4),
      I2 => L(3),
      I3 => L(5),
      I4 => \cntSCL[6]_i_2_n_0\,
      O => \cntSCL[11]_i_2_n_0\
    );
\cntSCL[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => L(12),
      I1 => \cntSCL[14]_i_2_n_0\,
      I2 => L(11),
      O => \i_I2C/cntSCL__0\(12)
    );
\cntSCL[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => L(13),
      I1 => L(11),
      I2 => \cntSCL[14]_i_2_n_0\,
      I3 => L(12),
      O => \i_I2C/cntSCL__0\(13)
    );
\cntSCL[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => L(14),
      I1 => L(12),
      I2 => \cntSCL[14]_i_2_n_0\,
      I3 => L(11),
      I4 => L(13),
      O => \i_I2C/cntSCL__0\(14)
    );
\cntSCL[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => L(10),
      I1 => L(9),
      I2 => L(7),
      I3 => L(8),
      I4 => \cntSCL[10]_i_2_n_0\,
      I5 => L(6),
      O => \cntSCL[14]_i_2_n_0\
    );
\cntSCL[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => L(1),
      I1 => L(0),
      O => \i_I2C/cntSCL__0\(1)
    );
\cntSCL[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFEA"
    )
        port map (
      I0 => \cntSCL[8]_i_3_n_0\,
      I1 => L(1),
      I2 => L(0),
      I3 => L(2),
      O => \i_I2C/cntSCL__0\(2)
    );
\cntSCL[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEEEEEEEAAAAAAAA"
    )
        port map (
      I0 => \cntSCL[3]_i_2_n_0\,
      I1 => L(3),
      I2 => L(1),
      I3 => L(0),
      I4 => L(2),
      I5 => \cntSCL[8]_i_2_n_0\,
      O => \i_I2C/cntSCL__0\(3)
    );
\cntSCL[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rSCLin,
      I1 => \cntSCL[9]_i_3_n_0\,
      O => \cntSCL[3]_i_2_n_0\
    );
\cntSCL[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => L(4),
      I1 => L(1),
      I2 => L(0),
      I3 => L(3),
      I4 => L(2),
      O => \i_I2C/cntSCL__0\(4)
    );
\cntSCL[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEEEEEEEAAAAAAAA"
    )
        port map (
      I0 => \cntSCL[8]_i_3_n_0\,
      I1 => L(5),
      I2 => \cntSCL[6]_i_2_n_0\,
      I3 => L(3),
      I4 => L(4),
      I5 => \cntSCL[8]_i_2_n_0\,
      O => \i_I2C/cntSCL__0\(5)
    );
\cntSCL[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000006AAAAAAA"
    )
        port map (
      I0 => L(6),
      I1 => L(4),
      I2 => L(3),
      I3 => L(5),
      I4 => \cntSCL[6]_i_2_n_0\,
      I5 => \i_I2C/sclEnd\,
      O => \i_I2C/cntSCL__0\(6)
    );
\cntSCL[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => L(2),
      I1 => L(0),
      I2 => L(1),
      O => \cntSCL[6]_i_2_n_0\
    );
\cntSCL[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BEEEAAAA"
    )
        port map (
      I0 => \cntSCL[8]_i_3_n_0\,
      I1 => L(7),
      I2 => \cntSCL[10]_i_2_n_0\,
      I3 => L(6),
      I4 => \cntSCL[8]_i_2_n_0\,
      O => \i_I2C/cntSCL__0\(7)
    );
\cntSCL[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF2AAA8000"
    )
        port map (
      I0 => \cntSCL[8]_i_2_n_0\,
      I1 => L(6),
      I2 => L(7),
      I3 => \cntSCL[10]_i_2_n_0\,
      I4 => L(8),
      I5 => \cntSCL[8]_i_3_n_0\,
      O => \i_I2C/cntSCL__0\(8)
    );
\cntSCL[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \cntSCL[9]_i_3_n_0\,
      I1 => \i_I2C/sclEnd\,
      O => \cntSCL[8]_i_2_n_0\
    );
\cntSCL[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rSCLin,
      I1 => \cntSCL[9]_i_3_n_0\,
      O => \cntSCL[8]_i_3_n_0\
    );
\cntSCL[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09FF0900"
    )
        port map (
      I0 => \cntSCL[9]_i_2_n_0\,
      I1 => L(9),
      I2 => \i_I2C/sclEnd\,
      I3 => \cntSCL[9]_i_3_n_0\,
      I4 => rSCLin,
      O => \i_I2C/cntSCL__0\(9)
    );
\cntSCL[9]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => L(7),
      I1 => L(8),
      I2 => \cntSCL[10]_i_2_n_0\,
      I3 => L(6),
      O => \cntSCL[9]_i_2_n_0\
    );
\cntSCL[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFEFFF"
    )
        port map (
      I0 => \cntSCL[9]_i_4_n_0\,
      I1 => \cntSCL[9]_i_5_n_0\,
      I2 => L(6),
      I3 => L(9),
      I4 => NACK_i_6_n_0,
      O => \cntSCL[9]_i_3_n_0\
    );
\cntSCL[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => L(1),
      I1 => L(0),
      I2 => L(2),
      I3 => L(10),
      I4 => L(11),
      I5 => L(8),
      O => \cntSCL[9]_i_4_n_0\
    );
\cntSCL[9]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => L(5),
      I1 => L(7),
      I2 => L(4),
      I3 => L(3),
      O => \cntSCL[9]_i_5_n_0\
    );
\cntX[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \i_Master/cntX_reg_n_0_[0]\,
      O => \plusOp__0\(0)
    );
\cntX[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \i_Master/L\(1),
      I1 => \i_Master/cntX_reg_n_0_[0]\,
      O => \plusOp__0\(1)
    );
\cntX[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \i_Master/L\(1),
      I1 => \i_Master/cntX_reg_n_0_[0]\,
      I2 => \i_Master/L\(2),
      O => \plusOp__0\(2)
    );
\cntX[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \i_Master/L\(3),
      I1 => \i_Master/L\(1),
      I2 => \i_Master/cntX_reg_n_0_[0]\,
      I3 => \i_Master/L\(2),
      O => \plusOp__0\(3)
    );
\cntX[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \i_Master/cntX_reg_n_0_[4]\,
      I1 => \i_Master/L\(2),
      I2 => \i_Master/L\(3),
      I3 => \i_Master/cntX_reg_n_0_[0]\,
      I4 => \i_Master/L\(1),
      O => \plusOp__0\(4)
    );
\cntX[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \i_Master/cntX_reg_n_0_[5]\,
      I1 => \i_Master/L\(1),
      I2 => \i_Master/cntX_reg_n_0_[0]\,
      I3 => \i_Master/L\(3),
      I4 => \i_Master/L\(2),
      I5 => \i_Master/cntX_reg_n_0_[4]\,
      O => \plusOp__0\(5)
    );
\cntX[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \i_Master/cntX_reg_n_0_[6]\,
      I1 => \cntX[7]_i_4_n_0\,
      O => \plusOp__0\(6)
    );
\cntX[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \i_Master/state\(1),
      I1 => \i_Master/state\(0),
      I2 => \i_Master/state\(2),
      I3 => \i_Master/state\(3),
      O => \i_Master/cntHeartbeat0\
    );
\cntX[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => I2C_FIFO_Full,
      I1 => \i_Master/state\(0),
      I2 => \i_Master/state\(1),
      I3 => \i_Master/state\(3),
      I4 => \i_Master/state\(2),
      O => \cntX[7]_i_2_n_0\
    );
\cntX[7]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A6"
    )
        port map (
      I0 => \i_Master/p_0_in\,
      I1 => \i_Master/cntX_reg_n_0_[6]\,
      I2 => \cntX[7]_i_4_n_0\,
      O => \cntX[7]_i_3_n_0\
    );
\cntX[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \i_Master/cntX_reg_n_0_[4]\,
      I1 => \i_Master/L\(2),
      I2 => \i_Master/L\(3),
      I3 => \i_Master/cntX_reg_n_0_[0]\,
      I4 => \i_Master/L\(1),
      I5 => \i_Master/cntX_reg_n_0_[5]\,
      O => \cntX[7]_i_4_n_0\
    );
g0_b0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"012C4C4C"
    )
        port map (
      I0 => \i_Master/addrROM_reg\(0),
      I1 => \i_Master/addrROM_reg\(1),
      I2 => \i_Master/addrROM_reg\(2),
      I3 => \i_Master/addrROM_reg__0\(3),
      I4 => \i_Master/addrROM_reg__0\(4),
      O => g0_b0_n_0
    );
\g0_b0__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E7B9CEFB3E87388E"
    )
        port map (
      I0 => \g0_b0__0_i_1_n_0\,
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g0_b0__0_n_0\
    );
\g0_b0__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \i_Master/L\(1),
      I1 => \i_Master/regDI_reg_n_0_[28]\,
      O => \g0_b0__0_i_1_n_0\
    );
\g0_b0__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1EE1"
    )
        port map (
      I0 => \i_Master/regDI_reg_n_0_[28]\,
      I1 => \i_Master/L\(1),
      I2 => \i_Master/regDI_reg_n_0_[29]\,
      I3 => \i_Master/L\(2),
      O => sel(1)
    );
\g0_b0__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6696996699669969"
    )
        port map (
      I0 => \i_Master/L\(3),
      I1 => \i_Master/regDI_reg_n_0_[30]\,
      I2 => \i_Master/L\(1),
      I3 => \i_Master/regDI_reg_n_0_[28]\,
      I4 => \i_Master/L\(2),
      I5 => \i_Master/regDI_reg_n_0_[29]\,
      O => sel(2)
    );
\g0_b0__0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696969"
    )
        port map (
      I0 => \g0_b0__0_i_7_n_0\,
      I1 => \i_Master/regDI_reg_n_0_[31]\,
      I2 => \i_Master/regDI_reg_n_0_[29]\,
      I3 => \g0_b0__0_i_8_n_0\,
      I4 => \g0_b0__0_i_9_n_0\,
      O => sel(3)
    );
\g0_b0__0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"03C02B03FC3FD4FC"
    )
        port map (
      I0 => \g0_b0__0_i_9_n_0\,
      I1 => \i_Master/regDI_reg_n_0_[31]\,
      I2 => \i_Master/regDI_reg_n_0_[29]\,
      I3 => \g0_b0__0_i_8_n_0\,
      I4 => \g0_b0__0_i_7_n_0\,
      I5 => \i_Master/regDI_reg_n_0_[30]\,
      O => sel(4)
    );
\g0_b0__0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F70830FF00FF00"
    )
        port map (
      I0 => \g0_b0__0_i_9_n_0\,
      I1 => \g0_b0__0_i_8_n_0\,
      I2 => \g0_b0__0_i_7_n_0\,
      I3 => \i_Master/regDI_reg_n_0_[31]\,
      I4 => \i_Master/regDI_reg_n_0_[29]\,
      I5 => \i_Master/regDI_reg_n_0_[30]\,
      O => sel(5)
    );
\g0_b0__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A802"
    )
        port map (
      I0 => \i_Master/regDI_reg_n_0_[30]\,
      I1 => \i_Master/L\(2),
      I2 => \i_Master/L\(1),
      I3 => \i_Master/L\(3),
      O => \g0_b0__0_i_7_n_0\
    );
\g0_b0__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3BFB"
    )
        port map (
      I0 => \i_Master/L\(1),
      I1 => \i_Master/regDI_reg_n_0_[28]\,
      I2 => \i_Master/L\(2),
      I3 => \i_Master/regDI_reg_n_0_[29]\,
      O => \g0_b0__0_i_8_n_0\
    );
\g0_b0__0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"999999669FFFFF6F"
    )
        port map (
      I0 => \i_Master/L\(3),
      I1 => \i_Master/regDI_reg_n_0_[30]\,
      I2 => \i_Master/regDI_reg_n_0_[29]\,
      I3 => \i_Master/L\(1),
      I4 => \i_Master/L\(2),
      I5 => \i_Master/regDI_reg_n_0_[28]\,
      O => \g0_b0__0_i_9_n_0\
    );
g0_b1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01642B0C"
    )
        port map (
      I0 => \i_Master/addrROM_reg\(0),
      I1 => \i_Master/addrROM_reg\(1),
      I2 => \i_Master/addrROM_reg\(2),
      I3 => \i_Master/addrROM_reg__0\(3),
      I4 => \i_Master/addrROM_reg__0\(4),
      O => g0_b1_n_0
    );
\g0_b1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"18C6318882C8C4D1"
    )
        port map (
      I0 => \g0_b0__0_i_1_n_0\,
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g0_b1__0_n_0\
    );
g0_b2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01247804"
    )
        port map (
      I0 => \i_Master/addrROM_reg\(0),
      I1 => \i_Master/addrROM_reg\(1),
      I2 => \i_Master/addrROM_reg\(2),
      I3 => \i_Master/addrROM_reg__0\(3),
      I4 => \i_Master/addrROM_reg__0\(4),
      O => g0_b2_n_0
    );
\g0_b2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"18C631805EA84099"
    )
        port map (
      I0 => \g0_b0__0_i_1_n_0\,
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g0_b2__0_n_0\
    );
g0_b3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00240986"
    )
        port map (
      I0 => \i_Master/addrROM_reg\(0),
      I1 => \i_Master/addrROM_reg\(1),
      I2 => \i_Master/addrROM_reg\(2),
      I3 => \i_Master/addrROM_reg__0\(3),
      I4 => \i_Master/addrROM_reg__0\(4),
      O => g0_b3_n_0
    );
\g0_b3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"17C7CE43E0962095"
    )
        port map (
      I0 => \g0_b0__0_i_1_n_0\,
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g0_b3__0_n_0\
    );
g0_b4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00204B0C"
    )
        port map (
      I0 => \i_Master/addrROM_reg\(0),
      I1 => \i_Master/addrROM_reg\(1),
      I2 => \i_Master/addrROM_reg\(2),
      I3 => \i_Master/addrROM_reg__0\(3),
      I4 => \i_Master/addrROM_reg__0\(4),
      O => g0_b4_n_0
    );
\g0_b4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"18FE112461F81093"
    )
        port map (
      I0 => \g0_b0__0_i_1_n_0\,
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g0_b4__0_n_0\
    );
g0_b5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"006D3846"
    )
        port map (
      I0 => \i_Master/addrROM_reg\(0),
      I1 => \i_Master/addrROM_reg\(1),
      I2 => \i_Master/addrROM_reg\(2),
      I3 => \i_Master/addrROM_reg__0\(3),
      I4 => \i_Master/addrROM_reg__0\(4),
      O => g0_b5_n_0
    );
\g0_b5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"18C5112462888891"
    )
        port map (
      I0 => \g0_b0__0_i_1_n_0\,
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g0_b5__0_n_0\
    );
g0_b6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002049A8"
    )
        port map (
      I0 => \i_Master/addrROM_reg\(0),
      I1 => \i_Master/addrROM_reg\(1),
      I2 => \i_Master/addrROM_reg\(2),
      I3 => \i_Master/addrROM_reg__0\(3),
      I4 => \i_Master/addrROM_reg__0\(4),
      O => g0_b6_n_0
    );
\g0_b6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E7C4CE239C877DCE"
    )
        port map (
      I0 => \g0_b0__0_i_1_n_0\,
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => \g0_b6__0_n_0\
    );
g0_b7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0004F5CA"
    )
        port map (
      I0 => \i_Master/addrROM_reg\(0),
      I1 => \i_Master/addrROM_reg\(1),
      I2 => \i_Master/addrROM_reg\(2),
      I3 => \i_Master/addrROM_reg__0\(3),
      I4 => \i_Master/addrROM_reg__0\(4),
      O => g0_b7_n_0
    );
g1_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000FFCE"
    )
        port map (
      I0 => \g0_b0__0_i_1_n_0\,
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => g1_b0_n_0
    );
g1_b1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000853"
    )
        port map (
      I0 => \g0_b0__0_i_1_n_0\,
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => g1_b1_n_0
    );
g1_b3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000007BE2"
    )
        port map (
      I0 => \g0_b0__0_i_1_n_0\,
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => g1_b3_n_0
    );
g1_b4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000862"
    )
        port map (
      I0 => \g0_b0__0_i_1_n_0\,
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => g1_b4_n_0
    );
g1_b6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000FCE"
    )
        port map (
      I0 => \g0_b0__0_i_1_n_0\,
      I1 => sel(1),
      I2 => sel(2),
      I3 => sel(3),
      I4 => sel(4),
      I5 => sel(5),
      O => g1_b6_n_0
    );
iEmpty_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAEAEAAA"
    )
        port map (
      I0 => I2C_FIFO_Empty,
      I1 => \i_I2C/i_FIFO/p_1_in\,
      I2 => iEmpty_i_2_n_0,
      I3 => addrWr_reg(3),
      I4 => iEmpty_i_3_n_0,
      I5 => \i_I2C/i_FIFO/DoPush\,
      O => iEmpty_i_1_n_0
    );
iEmpty_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0120804010020804"
    )
        port map (
      I0 => addrWr_reg(1),
      I1 => addrWr_reg(0),
      I2 => \i_I2C/i_FIFO/addrRd_reg\(2),
      I3 => \i_I2C/i_FIFO/addrRd_reg\(1),
      I4 => \i_I2C/i_FIFO/addrRd_reg\(0),
      I5 => addrWr_reg(2),
      O => iEmpty_i_2_n_0
    );
iEmpty_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9555"
    )
        port map (
      I0 => \i_I2C/i_FIFO/addrRd_reg\(3),
      I1 => \i_I2C/i_FIFO/addrRd_reg\(0),
      I2 => \i_I2C/i_FIFO/addrRd_reg\(1),
      I3 => \i_I2C/i_FIFO/addrRd_reg\(2),
      O => iEmpty_i_3_n_0
    );
iFull_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AAEB"
    )
        port map (
      I0 => I2C_FIFO_Full,
      I1 => \addrWr[3]_i_1_n_0\,
      I2 => \i_I2C/i_FIFO/addrRd_reg\(3),
      I3 => iFull_i_2_n_0,
      I4 => \i_I2C/i_FIFO/p_1_in\,
      O => iFull_i_1_n_0
    );
iFull_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF96F6FF6"
    )
        port map (
      I0 => addrWr_reg(2),
      I1 => \i_I2C/i_FIFO/addrRd_reg\(2),
      I2 => \i_I2C/i_FIFO/addrRd_reg\(1),
      I3 => addrWr_reg(0),
      I4 => addrWr_reg(1),
      I5 => iFull_i_3_n_0,
      O => iFull_i_2_n_0
    );
iFull_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBAFEBAFEFFFF"
    )
        port map (
      I0 => I2C_FIFO_Full,
      I1 => \i_Master/state\(3),
      I2 => \i_Master/state\(0),
      I3 => \FSM_sequential_state[3]_i_10_n_0\,
      I4 => addrWr_reg(0),
      I5 => \i_I2C/i_FIFO/addrRd_reg\(0),
      O => iFull_i_3_n_0
    );
\i_I2C/FSM_onehot_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[5]_i_1_n_0\,
      D => \FSM_onehot_state[0]_i_1_n_0\,
      Q => \i_I2C/FSM_onehot_state_reg_n_0_[0]\,
      R => '0'
    );
\i_I2C/FSM_onehot_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[5]_i_1_n_0\,
      D => \FSM_onehot_state[1]_i_1_n_0\,
      Q => \i_I2C/cntSCL\,
      R => '0'
    );
\i_I2C/FSM_onehot_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[5]_i_1_n_0\,
      D => \FSM_onehot_state[3]_i_1_n_0\,
      Q => \i_I2C/p_0_in\,
      R => '0'
    );
\i_I2C/FSM_onehot_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[5]_i_1_n_0\,
      D => \i_I2C/cntSCL\,
      Q => \i_I2C/cntBits\,
      R => '0'
    );
\i_I2C/FSM_onehot_state_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_onehot_state[5]_i_1_n_0\,
      D => '0',
      Q => \i_I2C/FSM_onehot_state_reg_n_0_[5]\,
      R => '0'
    );
\i_I2C/IOBUF_SCL\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => OLED_SCL,
      O => \i_I2C/SCLin\,
      T => \i_I2C/SCLout_reg_n_0\
    );
\i_I2C/IOBUF_SDA\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => '0',
      IO => OLED_SDA,
      O => \i_I2C/SDAin\,
      T => \i_I2C/T\
    );
\i_I2C/NACK_reg\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => '1',
      D => NACK_i_1_n_0,
      Q => \^i2c_nack\,
      R => '0'
    );
\i_I2C/SCLout_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => SCLout_i_1_n_0,
      Q => \i_I2C/SCLout_reg_n_0\,
      R => '0'
    );
\i_I2C/SDAout_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => SDAout_i_1_n_0,
      Q => \i_I2C/T\,
      R => '0'
    );
\i_I2C/cntBits_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_I2C/sclEnd\,
      D => \cntBits[0]_i_1_n_0\,
      Q => \i_I2C/cntBits_reg_n_0_[0]\,
      R => \i_I2C/cntBits\
    );
\i_I2C/cntBits_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_I2C/sclEnd\,
      D => \cntBits[1]_i_1_n_0\,
      Q => \i_I2C/cntBits_reg_n_0_[1]\,
      R => \i_I2C/cntBits\
    );
\i_I2C/cntBits_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_I2C/sclEnd\,
      D => \cntBits[2]_i_1_n_0\,
      Q => \i_I2C/cntBits_reg_n_0_[2]\,
      R => \i_I2C/cntBits\
    );
\i_I2C/cntBits_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_I2C/sclEnd\,
      D => \cntBits[3]_i_2_n_0\,
      Q => \i_I2C/cntBits_reg_n_0_[3]\,
      R => \i_I2C/cntBits\
    );
\i_I2C/cntSCL_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/cntSCL__0\(0),
      Q => L(0),
      R => \i_I2C/cntSCL\
    );
\i_I2C/cntSCL_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/cntSCL__0\(10),
      Q => L(10),
      R => \i_I2C/cntSCL\
    );
\i_I2C/cntSCL_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/cntSCL__0\(11),
      Q => L(11),
      R => \i_I2C/cntSCL\
    );
\i_I2C/cntSCL_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/cntSCL__0\(12),
      Q => L(12),
      R => \i_I2C/cntSCL\
    );
\i_I2C/cntSCL_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/cntSCL__0\(13),
      Q => L(13),
      R => \i_I2C/cntSCL\
    );
\i_I2C/cntSCL_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/cntSCL__0\(14),
      Q => L(14),
      R => \i_I2C/cntSCL\
    );
\i_I2C/cntSCL_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/cntSCL__0\(1),
      Q => L(1),
      R => \i_I2C/cntSCL\
    );
\i_I2C/cntSCL_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/cntSCL__0\(2),
      Q => L(2),
      R => \i_I2C/cntSCL\
    );
\i_I2C/cntSCL_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/cntSCL__0\(3),
      Q => L(3),
      R => \i_I2C/cntSCL\
    );
\i_I2C/cntSCL_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/cntSCL__0\(4),
      Q => L(4),
      R => \i_I2C/cntSCL\
    );
\i_I2C/cntSCL_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/cntSCL__0\(5),
      Q => L(5),
      R => \i_I2C/cntSCL\
    );
\i_I2C/cntSCL_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/cntSCL__0\(6),
      Q => L(6),
      R => \i_I2C/cntSCL\
    );
\i_I2C/cntSCL_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/cntSCL__0\(7),
      Q => L(7),
      R => \i_I2C/cntSCL\
    );
\i_I2C/cntSCL_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/cntSCL__0\(8),
      Q => L(8),
      R => \i_I2C/cntSCL\
    );
\i_I2C/cntSCL_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/cntSCL__0\(9),
      Q => L(9),
      R => \i_I2C/cntSCL\
    );
\i_I2C/i_FIFO/RAM_reg_0_15_0_7\: unisim.vcomponents.RAM32M16
     port map (
      ADDRA(4) => '0',
      ADDRA(3 downto 0) => \i_I2C/i_FIFO/addrRd\(3 downto 0),
      ADDRB(4) => '0',
      ADDRB(3 downto 0) => \i_I2C/i_FIFO/addrRd\(3 downto 0),
      ADDRC(4) => '0',
      ADDRC(3 downto 0) => \i_I2C/i_FIFO/addrRd\(3 downto 0),
      ADDRD(4) => '0',
      ADDRD(3 downto 0) => \i_I2C/i_FIFO/addrRd\(3 downto 0),
      ADDRE(4) => '0',
      ADDRE(3 downto 0) => \i_I2C/i_FIFO/addrRd\(3 downto 0),
      ADDRF(4) => '0',
      ADDRF(3 downto 0) => \i_I2C/i_FIFO/addrRd\(3 downto 0),
      ADDRG(4) => '0',
      ADDRG(3 downto 0) => \i_I2C/i_FIFO/addrRd\(3 downto 0),
      ADDRH(4) => '0',
      ADDRH(3 downto 0) => addrWr_reg(3 downto 0),
      DIA(1 downto 0) => \i_Master/p_0_out\(1 downto 0),
      DIB(1 downto 0) => \i_Master/p_0_out\(3 downto 2),
      DIC(1 downto 0) => \i_Master/p_0_out\(5 downto 4),
      DID(1 downto 0) => \i_Master/p_0_out\(7 downto 6),
      DIE(1 downto 0) => B"00",
      DIF(1 downto 0) => B"00",
      DIG(1 downto 0) => B"00",
      DIH(1 downto 0) => B"00",
      DOA(1 downto 0) => DO(1 downto 0),
      DOB(1 downto 0) => DO(3 downto 2),
      DOC(1 downto 0) => DO(5 downto 4),
      DOD(1 downto 0) => DO(7 downto 6),
      DOE(1 downto 0) => \NLW_i_I2C/i_FIFO/RAM_reg_0_15_0_7_DOE_UNCONNECTED\(1 downto 0),
      DOF(1 downto 0) => \NLW_i_I2C/i_FIFO/RAM_reg_0_15_0_7_DOF_UNCONNECTED\(1 downto 0),
      DOG(1 downto 0) => \NLW_i_I2C/i_FIFO/RAM_reg_0_15_0_7_DOG_UNCONNECTED\(1 downto 0),
      DOH(1 downto 0) => \NLW_i_I2C/i_FIFO/RAM_reg_0_15_0_7_DOH_UNCONNECTED\(1 downto 0),
      WCLK => Clk_100MHz,
      WE => \i_I2C/i_FIFO/DoPush\
    );
\i_I2C/i_FIFO/addrRd_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \addrRd[0]_i_1_n_0\,
      Q => \i_I2C/i_FIFO/addrRd_reg\(0),
      R => '0'
    );
\i_I2C/i_FIFO/addrRd_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \addrRd[1]_i_1_n_0\,
      Q => \i_I2C/i_FIFO/addrRd_reg\(1),
      R => '0'
    );
\i_I2C/i_FIFO/addrRd_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \addrRd[2]_i_1_n_0\,
      Q => \i_I2C/i_FIFO/addrRd_reg\(2),
      R => '0'
    );
\i_I2C/i_FIFO/addrRd_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \addrRd[3]_i_1_n_0\,
      Q => \i_I2C/i_FIFO/addrRd_reg\(3),
      R => '0'
    );
\i_I2C/i_FIFO/addrRd_reg_rep[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_I2C/i_FIFO/p_1_in\,
      D => \i_I2C/i_FIFO/plusOp0_in\(0),
      Q => \i_I2C/i_FIFO/addrRd\(0),
      R => '0'
    );
\i_I2C/i_FIFO/addrRd_reg_rep[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_I2C/i_FIFO/p_1_in\,
      D => \i_I2C/i_FIFO/plusOp0_in\(1),
      Q => \i_I2C/i_FIFO/addrRd\(1),
      R => '0'
    );
\i_I2C/i_FIFO/addrRd_reg_rep[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_I2C/i_FIFO/p_1_in\,
      D => \i_I2C/i_FIFO/plusOp0_in\(2),
      Q => \i_I2C/i_FIFO/addrRd\(2),
      R => '0'
    );
\i_I2C/i_FIFO/addrRd_reg_rep[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_I2C/i_FIFO/p_1_in\,
      D => \i_I2C/i_FIFO/plusOp0_in\(3),
      Q => \i_I2C/i_FIFO/addrRd\(3),
      R => '0'
    );
\i_I2C/i_FIFO/addrWr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_I2C/i_FIFO/DoPush\,
      D => \addrWr[0]_i_1_n_0\,
      Q => addrWr_reg(0),
      R => '0'
    );
\i_I2C/i_FIFO/addrWr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_I2C/i_FIFO/DoPush\,
      D => \addrWr[1]_i_1_n_0\,
      Q => addrWr_reg(1),
      R => '0'
    );
\i_I2C/i_FIFO/addrWr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_I2C/i_FIFO/DoPush\,
      D => \addrWr[2]_i_1_n_0\,
      Q => addrWr_reg(2),
      R => '0'
    );
\i_I2C/i_FIFO/addrWr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_I2C/i_FIFO/DoPush\,
      D => \addrWr[3]_i_1_n_0\,
      Q => addrWr_reg(3),
      R => '0'
    );
\i_I2C/i_FIFO/iEmpty_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => iEmpty_i_1_n_0,
      Q => I2C_FIFO_Empty,
      R => '0'
    );
\i_I2C/i_FIFO/iFull_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => iFull_i_1_n_0,
      Q => I2C_FIFO_Full,
      R => '0'
    );
\i_I2C/rSCLin_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/SCLin\,
      Q => rSCLin,
      R => '0'
    );
\i_I2C/rSDAin_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => '1',
      D => \i_I2C/SDAin\,
      Q => \i_I2C/rSDAin\,
      R => '0'
    );
\i_I2C/sregOut[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFD"
    )
        port map (
      I0 => \i_I2C/cntBits_reg_n_0_[3]\,
      I1 => \i_I2C/cntBits_reg_n_0_[1]\,
      I2 => \i_I2C/cntBits_reg_n_0_[0]\,
      I3 => DO(0),
      I4 => \i_I2C/cntBits_reg_n_0_[2]\,
      O => \i_I2C/sregOut[0]_i_1_n_0\
    );
\i_I2C/sregOut[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAEAAAAAAA2"
    )
        port map (
      I0 => \i_I2C/sregOut_reg_n_0_[0]\,
      I1 => \i_I2C/cntBits_reg_n_0_[3]\,
      I2 => \i_I2C/cntBits_reg_n_0_[2]\,
      I3 => \i_I2C/cntBits_reg_n_0_[0]\,
      I4 => \i_I2C/cntBits_reg_n_0_[1]\,
      I5 => DO(1),
      O => \i_I2C/sregOut[1]_i_1_n_0\
    );
\i_I2C/sregOut[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAEAAAAAAA2"
    )
        port map (
      I0 => \i_I2C/sregOut_reg_n_0_[1]\,
      I1 => \i_I2C/cntBits_reg_n_0_[3]\,
      I2 => \i_I2C/cntBits_reg_n_0_[2]\,
      I3 => \i_I2C/cntBits_reg_n_0_[0]\,
      I4 => \i_I2C/cntBits_reg_n_0_[1]\,
      I5 => DO(2),
      O => \i_I2C/sregOut[2]_i_1_n_0\
    );
\i_I2C/sregOut[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAEAAAAAAA2"
    )
        port map (
      I0 => \i_I2C/sregOut_reg_n_0_[2]\,
      I1 => \i_I2C/cntBits_reg_n_0_[3]\,
      I2 => \i_I2C/cntBits_reg_n_0_[2]\,
      I3 => \i_I2C/cntBits_reg_n_0_[0]\,
      I4 => \i_I2C/cntBits_reg_n_0_[1]\,
      I5 => DO(3),
      O => \i_I2C/sregOut[3]_i_1_n_0\
    );
\i_I2C/sregOut[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAEAAAAAAA2"
    )
        port map (
      I0 => \i_I2C/sregOut_reg_n_0_[3]\,
      I1 => \i_I2C/cntBits_reg_n_0_[3]\,
      I2 => \i_I2C/cntBits_reg_n_0_[2]\,
      I3 => \i_I2C/cntBits_reg_n_0_[0]\,
      I4 => \i_I2C/cntBits_reg_n_0_[1]\,
      I5 => DO(4),
      O => \i_I2C/sregOut[4]_i_1_n_0\
    );
\i_I2C/sregOut[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAEAAAAAAA2"
    )
        port map (
      I0 => \i_I2C/sregOut_reg_n_0_[4]\,
      I1 => \i_I2C/cntBits_reg_n_0_[3]\,
      I2 => \i_I2C/cntBits_reg_n_0_[2]\,
      I3 => \i_I2C/cntBits_reg_n_0_[0]\,
      I4 => \i_I2C/cntBits_reg_n_0_[1]\,
      I5 => DO(5),
      O => \i_I2C/sregOut[5]_i_1_n_0\
    );
\i_I2C/sregOut[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAEAAAAAAA2"
    )
        port map (
      I0 => \i_I2C/sregOut_reg_n_0_[5]\,
      I1 => \i_I2C/cntBits_reg_n_0_[3]\,
      I2 => \i_I2C/cntBits_reg_n_0_[2]\,
      I3 => \i_I2C/cntBits_reg_n_0_[0]\,
      I4 => \i_I2C/cntBits_reg_n_0_[1]\,
      I5 => DO(6),
      O => \i_I2C/sregOut[6]_i_1_n_0\
    );
\i_I2C/sregOut[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAEAAAAAAA2"
    )
        port map (
      I0 => \i_I2C/sregOut_reg_n_0_[6]\,
      I1 => \i_I2C/cntBits_reg_n_0_[3]\,
      I2 => \i_I2C/cntBits_reg_n_0_[2]\,
      I3 => \i_I2C/cntBits_reg_n_0_[0]\,
      I4 => \i_I2C/cntBits_reg_n_0_[1]\,
      I5 => DO(7),
      O => \i_I2C/sregOut[7]_i_3_n_0\
    );
\i_I2C/sregOut_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_I2C/sregOut[0]_i_1_n_0\,
      Q => \i_I2C/sregOut_reg_n_0_[0]\,
      R => \i_I2C/RdNotWr0\
    );
\i_I2C/sregOut_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_I2C/sregOut[1]_i_1_n_0\,
      Q => \i_I2C/sregOut_reg_n_0_[1]\,
      R => \i_I2C/RdNotWr0\
    );
\i_I2C/sregOut_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_I2C/sregOut[2]_i_1_n_0\,
      Q => \i_I2C/sregOut_reg_n_0_[2]\,
      R => \i_I2C/RdNotWr0\
    );
\i_I2C/sregOut_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_I2C/sregOut[3]_i_1_n_0\,
      Q => \i_I2C/sregOut_reg_n_0_[3]\,
      S => \i_I2C/RdNotWr0\
    );
\i_I2C/sregOut_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_I2C/sregOut[4]_i_1_n_0\,
      Q => \i_I2C/sregOut_reg_n_0_[4]\,
      S => \i_I2C/RdNotWr0\
    );
\i_I2C/sregOut_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_I2C/sregOut[5]_i_1_n_0\,
      Q => \i_I2C/sregOut_reg_n_0_[5]\,
      S => \i_I2C/RdNotWr0\
    );
\i_I2C/sregOut_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_I2C/sregOut[6]_i_1_n_0\,
      Q => \i_I2C/sregOut_reg_n_0_[6]\,
      S => \i_I2C/RdNotWr0\
    );
\i_I2C/sregOut_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \sregOut[7]_i_2_n_0\,
      D => \i_I2C/sregOut[7]_i_3_n_0\,
      Q => sregOut(7),
      R => \i_I2C/RdNotWr0\
    );
\i_Master/FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_sequential_state[3]_i_1_n_0\,
      D => \FSM_sequential_state[0]_i_1_n_0\,
      Q => \i_Master/state\(0),
      R => '0'
    );
\i_Master/FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_sequential_state[3]_i_1_n_0\,
      D => \i_Master/next_state\(1),
      Q => \i_Master/state\(1),
      R => '0'
    );
\i_Master/FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_sequential_state[3]_i_1_n_0\,
      D => \i_Master/next_state\(2),
      Q => \i_Master/state\(2),
      R => '0'
    );
\i_Master/FSM_sequential_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => Clk_100MHz,
      CE => \FSM_sequential_state[3]_i_1_n_0\,
      D => \i_Master/next_state\(3),
      Q => \i_Master/state\(3),
      R => '0'
    );
\i_Master/addrROM_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \addrROM[5]_i_2_n_0\,
      D => plusOp(0),
      Q => \i_Master/addrROM_reg\(0),
      R => \addrROM[5]_i_1_n_0\
    );
\i_Master/addrROM_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \addrROM[5]_i_2_n_0\,
      D => plusOp(1),
      Q => \i_Master/addrROM_reg\(1),
      R => \addrROM[5]_i_1_n_0\
    );
\i_Master/addrROM_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \addrROM[5]_i_2_n_0\,
      D => plusOp(2),
      Q => \i_Master/addrROM_reg\(2),
      R => \addrROM[5]_i_1_n_0\
    );
\i_Master/addrROM_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \addrROM[5]_i_2_n_0\,
      D => plusOp(3),
      Q => \i_Master/addrROM_reg__0\(3),
      R => \addrROM[5]_i_1_n_0\
    );
\i_Master/addrROM_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \addrROM[5]_i_2_n_0\,
      D => plusOp(4),
      Q => \i_Master/addrROM_reg__0\(4),
      R => \addrROM[5]_i_1_n_0\
    );
\i_Master/addrROM_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \addrROM[5]_i_2_n_0\,
      D => plusOp(5),
      Q => \i_Master/addrROM_reg__0__0\(5),
      R => \addrROM[5]_i_1_n_0\
    );
\i_Master/cnt20b_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cnt20b0\,
      D => \cnt20b_reg[0]_i_3_n_15\,
      Q => \i_Master/cnt20b_reg_n_0_[0]\,
      R => \cnt20b[0]_i_1_n_0\
    );
\i_Master/cnt20b_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cnt20b0\,
      D => \cnt20b_reg[0]_i_3_n_14\,
      Q => \i_Master/cnt20b_reg_n_0_[1]\,
      R => \cnt20b[0]_i_1_n_0\
    );
\i_Master/cnt20b_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cnt20b0\,
      D => \cnt20b_reg[0]_i_3_n_13\,
      Q => \i_Master/cnt20b_reg_n_0_[2]\,
      R => \cnt20b[0]_i_1_n_0\
    );
\i_Master/cnt20b_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cnt20b0\,
      D => \cnt20b_reg[0]_i_3_n_12\,
      Q => \i_Master/cnt20b_reg_n_0_[3]\,
      R => \cnt20b[0]_i_1_n_0\
    );
\i_Master/cnt20b_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cnt20b0\,
      D => \cnt20b_reg[0]_i_3_n_11\,
      Q => \i_Master/cnt20b_reg_n_0_[4]\,
      R => \cnt20b[0]_i_1_n_0\
    );
\i_Master/cnt20b_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cnt20b0\,
      D => \cnt20b_reg[0]_i_3_n_10\,
      Q => \i_Master/cnt20b_reg_n_0_[5]\,
      R => \cnt20b[0]_i_1_n_0\
    );
\i_Master/cnt20b_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cnt20b0\,
      D => \cnt20b_reg[0]_i_3_n_9\,
      Q => \i_Master/cnt20b_reg_n_0_[6]\,
      R => \cnt20b[0]_i_1_n_0\
    );
\i_Master/cnt20b_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cnt20b0\,
      D => \cnt20b_reg[0]_i_3_n_8\,
      Q => \i_Master/p_3_in\(0),
      R => \cnt20b[0]_i_1_n_0\
    );
\i_Master/cnt20b_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cnt20b0\,
      D => \cnt20b_reg[8]_i_1_n_15\,
      Q => \i_Master/p_3_in\(1),
      R => \cnt20b[0]_i_1_n_0\
    );
\i_Master/cnt20b_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cnt20b0\,
      D => \cnt20b_reg[8]_i_1_n_14\,
      Q => \i_Master/p_3_in\(2),
      R => \cnt20b[0]_i_1_n_0\
    );
\i_Master/cntHeartbeat_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cntHeartbeat0\,
      D => \plusOp__1\(0),
      Q => \i_Master/cntHeartbeat_reg_n_0_[0]\,
      R => '0'
    );
\i_Master/cntHeartbeat_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cntHeartbeat0\,
      D => \plusOp__1\(1),
      Q => \i_Master/cntHeartbeat_reg_n_0_[1]\,
      R => '0'
    );
\i_Master/cntHeartbeat_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cntHeartbeat0\,
      D => \plusOp__1\(2),
      Q => \i_Master/p_8_in\(0),
      R => '0'
    );
\i_Master/cntHeartbeat_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cntHeartbeat0\,
      D => \plusOp__1\(3),
      Q => \i_Master/cntHeartbeat_reg_n_0_[3]\,
      R => '0'
    );
\i_Master/cntHeartbeat_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cntHeartbeat0\,
      D => \plusOp__1\(4),
      Q => \i_Master/cntHeartbeat_reg\(4),
      R => '0'
    );
\i_Master/cntHeartbeat_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \i_Master/cntHeartbeat0\,
      D => \plusOp__1\(5),
      Q => \i_Master/cntHeartbeat_reg\(5),
      R => '0'
    );
\i_Master/cntX_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cntX[7]_i_2_n_0\,
      D => \plusOp__0\(0),
      Q => \i_Master/cntX_reg_n_0_[0]\,
      R => \i_Master/cntHeartbeat0\
    );
\i_Master/cntX_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cntX[7]_i_2_n_0\,
      D => \plusOp__0\(1),
      Q => \i_Master/L\(1),
      R => \i_Master/cntHeartbeat0\
    );
\i_Master/cntX_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cntX[7]_i_2_n_0\,
      D => \plusOp__0\(2),
      Q => \i_Master/L\(2),
      R => \i_Master/cntHeartbeat0\
    );
\i_Master/cntX_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cntX[7]_i_2_n_0\,
      D => \plusOp__0\(3),
      Q => \i_Master/L\(3),
      R => \i_Master/cntHeartbeat0\
    );
\i_Master/cntX_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cntX[7]_i_2_n_0\,
      D => \plusOp__0\(4),
      Q => \i_Master/cntX_reg_n_0_[4]\,
      R => \i_Master/cntHeartbeat0\
    );
\i_Master/cntX_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cntX[7]_i_2_n_0\,
      D => \plusOp__0\(5),
      Q => \i_Master/cntX_reg_n_0_[5]\,
      R => \i_Master/cntHeartbeat0\
    );
\i_Master/cntX_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cntX[7]_i_2_n_0\,
      D => \plusOp__0\(6),
      Q => \i_Master/cntX_reg_n_0_[6]\,
      R => \i_Master/cntHeartbeat0\
    );
\i_Master/cntX_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => Clk_100MHz,
      CE => \cntX[7]_i_2_n_0\,
      D => \cntX[7]_i_3_n_0\,
      Q => \i_Master/p_0_in\,
      R => \i_Master/cntHeartbeat0\
    );
\i_Master/ib.iChar_ROM/RAM_reg_0_15_0_7_i_12\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b0__0_n_0\,
      I1 => g1_b0_n_0,
      O => \i_Master/ib.iChar_ROM/RAM_reg_0_15_0_7_i_12_n_0\,
      S => sel(6)
    );
\i_Master/ib.iChar_ROM/RAM_reg_0_15_0_7_i_26\: unisim.vcomponents.MUXF7
     port map (
      I0 => \g0_b6__0_n_0\,
      I1 => g1_b6_n_0,
      O => \i_Master/ib.iChar_ROM/RAM_reg_0_15_0_7_i_26_n_0\,
      S => sel(6)
    );
\i_Master/regBlank_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regBlank(0),
      Q => \i_Master/regBlank_reg_n_0_[0]\,
      R => '0'
    );
\i_Master/regBlank_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regBlank(1),
      Q => \i_Master/regBlank_reg_n_0_[1]\,
      R => '0'
    );
\i_Master/regBlank_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regBlank(2),
      Q => \i_Master/regBlank_reg_n_0_[2]\,
      R => '0'
    );
\i_Master/regBlank_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regBlank(3),
      Q => \i_Master/regBlank_reg_n_0_[3]\,
      R => '0'
    );
\i_Master/regBlank_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regBlank(4),
      Q => \i_Master/regBlank_reg_n_0_[4]\,
      R => '0'
    );
\i_Master/regBlank_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regBlank(5),
      Q => \i_Master/regBlank_reg_n_0_[5]\,
      R => '0'
    );
\i_Master/regBlank_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regBlank(6),
      Q => \i_Master/regBlank_reg_n_0_[6]\,
      R => '0'
    );
\i_Master/regBlank_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regBlank(7),
      Q => \i_Master/regBlank_reg_n_0_[7]\,
      R => '0'
    );
\i_Master/regDI_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(0),
      Q => \i_Master/regDI_reg_n_0_[0]\,
      R => '0'
    );
\i_Master/regDI_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(10),
      Q => \i_Master/regDI_reg_n_0_[10]\,
      R => '0'
    );
\i_Master/regDI_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(11),
      Q => \i_Master/regDI_reg_n_0_[11]\,
      R => '0'
    );
\i_Master/regDI_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(12),
      Q => \i_Master/regDI_reg_n_0_[12]\,
      R => '0'
    );
\i_Master/regDI_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(13),
      Q => \i_Master/regDI_reg_n_0_[13]\,
      R => '0'
    );
\i_Master/regDI_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(14),
      Q => \i_Master/regDI_reg_n_0_[14]\,
      R => '0'
    );
\i_Master/regDI_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(15),
      Q => \i_Master/regDI_reg_n_0_[15]\,
      R => '0'
    );
\i_Master/regDI_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(16),
      Q => \i_Master/regDI_reg_n_0_[16]\,
      R => '0'
    );
\i_Master/regDI_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(17),
      Q => \i_Master/regDI_reg_n_0_[17]\,
      R => '0'
    );
\i_Master/regDI_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(18),
      Q => \i_Master/regDI_reg_n_0_[18]\,
      R => '0'
    );
\i_Master/regDI_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(19),
      Q => \i_Master/regDI_reg_n_0_[19]\,
      R => '0'
    );
\i_Master/regDI_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(1),
      Q => \i_Master/regDI_reg_n_0_[1]\,
      R => '0'
    );
\i_Master/regDI_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(20),
      Q => \i_Master/regDI_reg_n_0_[20]\,
      R => '0'
    );
\i_Master/regDI_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(21),
      Q => \i_Master/regDI_reg_n_0_[21]\,
      R => '0'
    );
\i_Master/regDI_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(22),
      Q => \i_Master/regDI_reg_n_0_[22]\,
      R => '0'
    );
\i_Master/regDI_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(23),
      Q => \i_Master/regDI_reg_n_0_[23]\,
      R => '0'
    );
\i_Master/regDI_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(24),
      Q => \i_Master/regDI_reg_n_0_[24]\,
      R => '0'
    );
\i_Master/regDI_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(25),
      Q => \i_Master/regDI_reg_n_0_[25]\,
      R => '0'
    );
\i_Master/regDI_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(26),
      Q => \i_Master/regDI_reg_n_0_[26]\,
      R => '0'
    );
\i_Master/regDI_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(27),
      Q => \i_Master/regDI_reg_n_0_[27]\,
      R => '0'
    );
\i_Master/regDI_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(28),
      Q => \i_Master/regDI_reg_n_0_[28]\,
      R => '0'
    );
\i_Master/regDI_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(29),
      Q => \i_Master/regDI_reg_n_0_[29]\,
      R => '0'
    );
\i_Master/regDI_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(2),
      Q => \i_Master/regDI_reg_n_0_[2]\,
      R => '0'
    );
\i_Master/regDI_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(30),
      Q => \i_Master/regDI_reg_n_0_[30]\,
      R => '0'
    );
\i_Master/regDI_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(31),
      Q => \i_Master/regDI_reg_n_0_[31]\,
      R => '0'
    );
\i_Master/regDI_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(3),
      Q => \i_Master/regDI_reg_n_0_[3]\,
      R => '0'
    );
\i_Master/regDI_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(4),
      Q => \i_Master/regDI_reg_n_0_[4]\,
      R => '0'
    );
\i_Master/regDI_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(5),
      Q => \i_Master/regDI_reg_n_0_[5]\,
      R => '0'
    );
\i_Master/regDI_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(6),
      Q => \i_Master/regDI_reg_n_0_[6]\,
      R => '0'
    );
\i_Master/regDI_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(7),
      Q => \i_Master/regDI_reg_n_0_[7]\,
      R => '0'
    );
\i_Master/regDI_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(8),
      Q => \i_Master/regDI_reg_n_0_[8]\,
      R => '0'
    );
\i_Master/regDI_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDI(9),
      Q => \i_Master/regDI_reg_n_0_[9]\,
      R => '0'
    );
\i_Master/regDecPts_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDecPts(0),
      Q => \i_Master/regDecPts_reg_n_0_[0]\,
      R => '0'
    );
\i_Master/regDecPts_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDecPts(1),
      Q => \i_Master/regDecPts_reg_n_0_[1]\,
      R => '0'
    );
\i_Master/regDecPts_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDecPts(2),
      Q => \i_Master/regDecPts_reg_n_0_[2]\,
      R => '0'
    );
\i_Master/regDecPts_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDecPts(3),
      Q => \i_Master/regDecPts_reg_n_0_[3]\,
      R => '0'
    );
\i_Master/regDecPts_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDecPts(4),
      Q => \i_Master/regDecPts_reg_n_0_[4]\,
      R => '0'
    );
\i_Master/regDecPts_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDecPts(5),
      Q => \i_Master/regDecPts_reg_n_0_[5]\,
      R => '0'
    );
\i_Master/regDecPts_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDecPts(6),
      Q => \i_Master/regDecPts_reg_n_0_[6]\,
      R => '0'
    );
\i_Master/regDecPts_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => Clk_100MHz,
      CE => \i_Master/regDI\,
      D => regDecPts(7),
      Q => in100,
      R => '0'
    );
\regBlank[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Blank(0),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regBlank_reg_n_0_[7]\,
      O => regBlank(0)
    );
\regBlank[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Blank(1),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regBlank_reg_n_0_[0]\,
      O => regBlank(1)
    );
\regBlank[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Blank(2),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regBlank_reg_n_0_[1]\,
      O => regBlank(2)
    );
\regBlank[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Blank(3),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regBlank_reg_n_0_[2]\,
      O => regBlank(3)
    );
\regBlank[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Blank(4),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regBlank_reg_n_0_[3]\,
      O => regBlank(4)
    );
\regBlank[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Blank(5),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regBlank_reg_n_0_[4]\,
      O => regBlank(5)
    );
\regBlank[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Blank(6),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regBlank_reg_n_0_[5]\,
      O => regBlank(6)
    );
\regBlank[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \i_Master/cntHeartbeat0\,
      I1 => \i_Master/L\(2),
      I2 => \i_Master/L\(3),
      I3 => \i_Master/cntX_reg_n_0_[0]\,
      I4 => \i_Master/L\(1),
      I5 => \cntX[7]_i_2_n_0\,
      O => \i_Master/regDI\
    );
\regBlank[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Blank(7),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regBlank_reg_n_0_[6]\,
      O => regBlank(7)
    );
\regDI[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(0),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[28]\,
      O => regDI(0)
    );
\regDI[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(10),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[6]\,
      O => regDI(10)
    );
\regDI[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(11),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[7]\,
      O => regDI(11)
    );
\regDI[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(12),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[8]\,
      O => regDI(12)
    );
\regDI[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(13),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[9]\,
      O => regDI(13)
    );
\regDI[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(14),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[10]\,
      O => regDI(14)
    );
\regDI[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(15),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[11]\,
      O => regDI(15)
    );
\regDI[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(16),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[12]\,
      O => regDI(16)
    );
\regDI[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(17),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[13]\,
      O => regDI(17)
    );
\regDI[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(18),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[14]\,
      O => regDI(18)
    );
\regDI[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(19),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[15]\,
      O => regDI(19)
    );
\regDI[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(1),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[29]\,
      O => regDI(1)
    );
\regDI[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(20),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[16]\,
      O => regDI(20)
    );
\regDI[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(21),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[17]\,
      O => regDI(21)
    );
\regDI[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(22),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[18]\,
      O => regDI(22)
    );
\regDI[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(23),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[19]\,
      O => regDI(23)
    );
\regDI[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(24),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[20]\,
      O => regDI(24)
    );
\regDI[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(25),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[21]\,
      O => regDI(25)
    );
\regDI[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(26),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[22]\,
      O => regDI(26)
    );
\regDI[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(27),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[23]\,
      O => regDI(27)
    );
\regDI[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(28),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[24]\,
      O => regDI(28)
    );
\regDI[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(29),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[25]\,
      O => regDI(29)
    );
\regDI[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(2),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[30]\,
      O => regDI(2)
    );
\regDI[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(30),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[26]\,
      O => regDI(30)
    );
\regDI[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(31),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[27]\,
      O => regDI(31)
    );
\regDI[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(3),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[31]\,
      O => regDI(3)
    );
\regDI[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(4),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[0]\,
      O => regDI(4)
    );
\regDI[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(5),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[1]\,
      O => regDI(5)
    );
\regDI[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(6),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[2]\,
      O => regDI(6)
    );
\regDI[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(7),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[3]\,
      O => regDI(7)
    );
\regDI[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(8),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[4]\,
      O => regDI(8)
    );
\regDI[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => Line(9),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDI_reg_n_0_[5]\,
      O => regDI(9)
    );
\regDecPts[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => DecPts(0),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => in100,
      O => regDecPts(0)
    );
\regDecPts[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => DecPts(1),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDecPts_reg_n_0_[0]\,
      O => regDecPts(1)
    );
\regDecPts[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => DecPts(2),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDecPts_reg_n_0_[1]\,
      O => regDecPts(2)
    );
\regDecPts[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => DecPts(3),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDecPts_reg_n_0_[2]\,
      O => regDecPts(3)
    );
\regDecPts[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => DecPts(4),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDecPts_reg_n_0_[3]\,
      O => regDecPts(4)
    );
\regDecPts[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => DecPts(5),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDecPts_reg_n_0_[4]\,
      O => regDecPts(5)
    );
\regDecPts[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => DecPts(6),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDecPts_reg_n_0_[5]\,
      O => regDecPts(6)
    );
\regDecPts[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => DecPts(7),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(2),
      I4 => \i_Master/state\(3),
      I5 => \i_Master/regDecPts_reg_n_0_[6]\,
      O => regDecPts(7)
    );
\sregOut[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40260000"
    )
        port map (
      I0 => \i_Master/state\(2),
      I1 => \i_Master/state\(1),
      I2 => \i_Master/state\(0),
      I3 => \i_Master/state\(3),
      I4 => \i_I2C/cntSCL\,
      O => \i_I2C/RdNotWr0\
    );
\sregOut[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55000C00"
    )
        port map (
      I0 => \sregOut[7]_i_4_n_0\,
      I1 => \i_I2C/sclEnd\,
      I2 => I2C_FIFO_Empty,
      I3 => \i_I2C/p_0_in\,
      I4 => \addrRd_rep[3]_i_3_n_0\,
      O => \sregOut[7]_i_2_n_0\
    );
\sregOut[7]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFFFF"
    )
        port map (
      I0 => L(6),
      I1 => L(5),
      I2 => L(7),
      I3 => \sregOut[7]_i_5_n_0\,
      I4 => \sregOut[7]_i_6_n_0\,
      O => \sregOut[7]_i_4_n_0\
    );
\sregOut[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFEFEFFFE"
    )
        port map (
      I0 => L(13),
      I1 => L(14),
      I2 => L(12),
      I3 => L(9),
      I4 => L(10),
      I5 => L(11),
      O => \sregOut[7]_i_5_n_0\
    );
\sregOut[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => L(2),
      I1 => L(0),
      I2 => L(1),
      I3 => L(3),
      I4 => NACK_i_3_n_0,
      I5 => L(4),
      O => \sregOut[7]_i_6_n_0\
    );
end STRUCTURE;
