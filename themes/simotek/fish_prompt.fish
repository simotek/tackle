# simotek prompt theme, by Simon Lees <http://github.com/simotek/>
function _simotek_theme_user --description 'Print user name'
    switch $USER
        case root
            printf '\x1b[91m%s' $USER
        case '*'
            printf '\x1b[92m%s' $USER
    end
end

function _simotek_theme_hostname --description 'Print the hostname'
    printf '\x1b[94m%s' (hostname|cut -d . -f 1)
end

function _simotek_theme_cwd --description 'Print current working directory'
    printf '\x1b[95m%s' (prompt_pwd)
end

function fish_prompt --description 'Write out the prompt'

    set -l __left_arrow_glyph        \uE0B0

    # print the prompt
    set -l ___at (printf '\x1b[91m@')
    set -l ___host (printf '%s%s%s' (_simotek_theme_user) $___at (_simotek_theme_hostname))
    set -l ___cwd (_simotek_theme_cwd)
    #set -l ___vcs (printf '%s%s' (_simotek_theme_vcs))
    set -l ___prompt_char (printf '\x1b[91m ➤ %s\x1b[30m%s%s '  (set_color normal) $__left_arrow_glyph (set_color normal))

    printf '\x1b[40m%s %s%s %s' $___host $___cwd $___vcs $___prompt_char
end
