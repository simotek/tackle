# simotek prompt theme, by Simon Lees <http://github.com/simotek/>
function fish_greeting --description 'Print the shell greeting'
    colors

    set -l location (printf "%sWelcome to %s%s" $smtk_clr_blue_h $smtk_clr_purple_h (hostname))
    set -l system (printf "%sRunning %s%s%s on %s%s"  $smtk_clr_blue_h $smtk_clr_purple_h (uname -mrs)  $smtk_clr_blue_h $smtk_clr_purple_h (tty | sed -e 's/.*tty\(.*\)/\1/'))
    set -l datetime (printf "%sIt is %s%s%s (%s) on %s%s"  $smtk_clr_blue_h $smtk_clr_purple_h (date +%T)  $smtk_clr_blue_h (date +%Z) $smtk_clr_purple_h (date +%F))

    printf "\n  %s\n  %s\n  %s\n\n" $location $system $datetime
    
end
