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

## DIAGNOSTYKA: Dbg -> LD1..LD6
## LD1..LD3 = stan Q0..Q2, LD4 = X (BTN2), LD5 = Rst (BTN3), LD6 = CE (SW0)
set_property PACKAGE_PIN AE7 [get_ports {Dbg[0]}]
set_property PACKAGE_PIN AH2 [get_ports {Dbg[1]}]
set_property PACKAGE_PIN AE5 [get_ports {Dbg[2]}]
set_property PACKAGE_PIN AH1 [get_ports {Dbg[3]}]
set_property PACKAGE_PIN AE4 [get_ports {Dbg[4]}]
set_property PACKAGE_PIN AG1 [get_ports {Dbg[5]}]
set_property IOSTANDARD LVCMOS12 [get_ports {Dbg[*]}]
