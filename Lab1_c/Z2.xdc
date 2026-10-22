## Z2: X(3:0) <- PL_USER_SW(3:0), Y(3:0) -> PL_USER_LED(3:0)  (linie z ZU3.xdc)

set_property PACKAGE_PIN AB1 [get_ports {X[0]}]
set_property PACKAGE_PIN AF1 [get_ports {X[1]}]
set_property PACKAGE_PIN AE3 [get_ports {X[2]}]
set_property PACKAGE_PIN AC2 [get_ports {X[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports X*]

set_property PACKAGE_PIN AF5 [get_ports {Y[0]}]
set_property PACKAGE_PIN AE7 [get_ports {Y[1]}]
set_property PACKAGE_PIN AH2 [get_ports {Y[2]}]
set_property PACKAGE_PIN AE5 [get_ports {Y[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports Y*]
