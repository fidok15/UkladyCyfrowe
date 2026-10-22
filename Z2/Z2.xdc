## Z2: Z1 + OLED. Linie wziete z ZU3.xdc i ZU3_Exp.xdc (szablony z przedmiotu).

## 100MHz SYS_CLK -- potrzebne, bo zegar buforowany w VHDL (IBUFDS + BUFG), bez Clocking Wizard
set_property PACKAGE_PIN D7  [get_ports {CLK_100MHz_P}]
set_property PACKAGE_PIN D6  [get_ports {CLK_100MHz_N}]
set_property IOSTANDARD LVDS [get_ports CLK_100MHz_*]
create_clock -period 10.000 -name Clk_100MHz [get_ports CLK_100MHz_P]

## SW(3:0) -> X
set_property PACKAGE_PIN AB1 [get_ports {SW[0]}]
set_property PACKAGE_PIN AF1 [get_ports {SW[1]}]
set_property PACKAGE_PIN AE3 [get_ports {SW[2]}]
set_property PACKAGE_PIN AC2 [get_ports {SW[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports SW*]

## SW7 -> AUTO
set_property PACKAGE_PIN AD2 [get_ports {AUTO}]
set_property IOSTANDARD LVCMOS12 [get_ports AUTO]

## LED(7:4) = X, LED(3:0) = Y
set_property PACKAGE_PIN AF5 [get_ports {LED[0]}]
set_property PACKAGE_PIN AE7 [get_ports {LED[1]}]
set_property PACKAGE_PIN AH2 [get_ports {LED[2]}]
set_property PACKAGE_PIN AE5 [get_ports {LED[3]}]
set_property PACKAGE_PIN AH1 [get_ports {LED[4]}]
set_property PACKAGE_PIN AE4 [get_ports {LED[5]}]
set_property PACKAGE_PIN AG1 [get_ports {LED[6]}]
set_property PACKAGE_PIN AF2 [get_ports {LED[7]}]
set_property IOSTANDARD LVCMOS12 [get_ports LED*]

## OLED IIC (plyta rozszerzajaca)
set_property PACKAGE_PIN AE12 [get_ports {OLED_SCL}]
set_property PACKAGE_PIN AF12 [get_ports {OLED_SDA}]
set_property IOSTANDARD LVCMOS33 [get_ports OLED_*]
