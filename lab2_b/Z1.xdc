## Lab 2 Z1 (diagram blokowy): nazwy portow jak w diagramie.
## Zegara CLK_100MHz_* tu NIE opisujemy -- robi to Clocking Wizard.

## CE <- SW0, UPnDN <- SW1
set_property PACKAGE_PIN AB1 [get_ports {CE}]
set_property PACKAGE_PIN AF1 [get_ports {UPnDN}]
set_property IOSTANDARD LVCMOS12 [get_ports {CE UPnDN}]

## Rst <- PB3
set_property PACKAGE_PIN AC6 [get_ports {Rst}]
set_property IOSTANDARD LVCMOS12 [get_ports {Rst}]

## Q(2:0) -> LED2..LED0
set_property PACKAGE_PIN AF5 [get_ports {Q[0]}]
set_property PACKAGE_PIN AE7 [get_ports {Q[1]}]
set_property PACKAGE_PIN AH2 [get_ports {Q[2]}]
set_property IOSTANDARD LVCMOS12 [get_ports Q*]

## Clk_1Hz -> LED7
set_property PACKAGE_PIN AF2 [get_ports {Clk_1Hz}]
set_property IOSTANDARD LVCMOS12 [get_ports {Clk_1Hz}]
