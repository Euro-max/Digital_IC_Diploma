
set designs [list]


set fp [open "rtl.txt" r]


set file_data [read $fp]


close $fp


foreach line [split $file_data "\n"] {

    set line [string trim $line]
    

    if {$line ne ""} {

        set filename [file tail $line]
        

        lappend designs $filename
    }
}


puts "{$designs}"