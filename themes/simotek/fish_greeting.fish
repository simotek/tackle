# urdh prompt theme, by Simon Sigurdhsson <http://github.com/urdh/>
function fish_greeting --description 'Print the shell greeting'
    colors

    set -l c_n '\x1b[92m'
    set -l c_w '\x1b[93m'

    set -l location (printf "\x1b[92mWelcome to \x1b[93m%s" (hostname))
    set -l system (printf "\x1b[92mRunning \x1b[93m%s\x1b[92m on \x1b[93m%s" (uname -mrs) (tty | sed -e 's/.*tty\(.*\)/\1/'))
    set -l datetime (printf "\x1b[92mIt is \x1b[93m%s\x1b[92m (%s) on \x1b[93m%s" (date +%T) (date +%Z) (date +%F))

    printf "\n  %s\n  %s\n  %s\n\n" $location $system $datetime
    
    
end
