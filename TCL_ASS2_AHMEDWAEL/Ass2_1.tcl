
puts "****Writing Verilog Block Interface****\n"


set modname "Up_Dn_Counter"

set in_ports [list IN Load Up Down CLK]


set in_ports_width [list 4 1 1 1 1]


set out_ports [list High Counter Low]


set out_ports_width [list 1 4 1]



puts "module $modname ("

set port_lines {}


foreach port $in_ports width $in_ports_width {
    if {$width > 1} {
        set msb [expr {$width - 1}]
        lappend port_lines "input \[${msb}:0\] $port"
    } else {
        lappend port_lines "input $port"
    }
}


foreach port $out_ports width $out_ports_width {
    if {$width > 1} {
        set msb [expr {$width - 1}]
        lappend port_lines "output \[${msb}:0\] $port"
    } else {
        lappend port_lines "output $port"
    }
}

puts [join $port_lines ",\n"]


puts ");"