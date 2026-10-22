## Z3/Z4 (diagram blokowy): nazwy portow jak w diagramie.
## Zegara CLK_100MHz_* tu NIE opisujemy -- robi to Clocking Wizard.

## Przelaczniki SW(3:0) -> port PL_USER_SW[3:0]
set_property PACKAGE_PIN AB1 [get_ports {PL_USER_SW[0]}]
set_property PACKAGE_PIN AF1 [get_ports {PL_USER_SW[1]}]
set_property PACKAGE_PIN AE3 [get_ports {PL_USER_SW[2]}]
set_property PACKAGE_PIN AC2 [get_ports {PL_USER_SW[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports PL_USER_SW*]

## LED7 <- NACK (swieci = blad komunikacji z OLED)
set_property PACKAGE_PIN AF2 [get_ports {NACK}]
set_property IOSTANDARD LVCMOS12 [get_ports NACK]

## OLED IIC (plyta rozszerzajaca, linie z ZU3_Exp.xdc)
set_property PACKAGE_PIN AE12 [get_ports {OLED_SCL}]
set_property PACKAGE_PIN AF12 [get_ports {OLED_SDA}]
set_property IOSTANDARD LVCMOS33 [get_ports OLED_*]
