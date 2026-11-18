## Lab 3 Z1 (diagram blokowy): nazwy portow jak w diagramie.
## Zegara CLK_100MHz_* tu NIE opisujemy -- robi to Clocking Wizard.

## X <- PB2, Rst <- PB3
set_property PACKAGE_PIN AB2 [get_ports {X}]
set_property PACKAGE_PIN AC6 [get_ports {Rst}]
set_property IOSTANDARD LVCMOS12 [get_ports {X Rst}]

## CE <- SW0
set_property PACKAGE_PIN AB1 [get_ports {CE}]
set_property IOSTANDARD LVCMOS12 [get_ports {CE}]

## Y -> LED0, Clk_1Hz -> LED7
set_property PACKAGE_PIN AF5 [get_ports {Y}]
set_property PACKAGE_PIN AF2 [get_ports {Clk_1Hz}]
set_property IOSTANDARD LVCMOS12 [get_ports {Y Clk_1Hz}]
