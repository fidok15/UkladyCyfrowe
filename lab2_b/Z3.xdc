## Lab 2 Z3 (diagram blokowy): licznik na 100 MHz, CE i UPnDN z enkodera.
## Zegara CLK_100MHz_* tu NIE opisujemy -- robi to Clocking Wizard.

## Enkoder obrotowy (plyta rozszerzajaca, linie z ZU3_Exp.xdc)
set_property PACKAGE_PIN AA8 [get_ports {ROT_A}]
set_property PACKAGE_PIN Y9  [get_ports {ROT_B}]
set_property IOSTANDARD LVCMOS33 [get_ports ROT_*]

## Rst <- PB3
set_property PACKAGE_PIN AC6 [get_ports {Rst}]
set_property IOSTANDARD LVCMOS12 [get_ports {Rst}]

## Q(2:0) -> LED2..LED0
set_property PACKAGE_PIN AF5 [get_ports {Q[0]}]
set_property PACKAGE_PIN AE7 [get_ports {Q[1]}]
set_property PACKAGE_PIN AH2 [get_ports {Q[2]}]
set_property IOSTANDARD LVCMOS12 [get_ports Q*]
