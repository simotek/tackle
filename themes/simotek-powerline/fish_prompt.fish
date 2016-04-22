# simotek prompt theme, by Simon Lees <http://github.com/simotek/>
function _simotek_theme_user --description 'Print user name'
    set -l __left_arrow_glyph        \uE0B0
    switch $USER
        case root
            printf '%s%s%s' (set_color -b (red)) $USER (set_color normal)
        case 'simon'
            printf '\x1b[44m\x1b[30m%s \x1b[m%s' $USER $__left_arrow_glyph
        case '*'
            printf '%s%s%s' (set_color -b (cyan)) $USER (set_color normal)
    end
end

function _simotek_theme_hostname --description 'Print the hostname'

    set -l __left_arrow_glyph        \uE0B1
    printf '%s%s%s%s' (set_color -b (purple)) (hostname|cut -d . -f 1) $__left_arrow_glyph (set_color normal)
end

function _simotek_theme_cwd --description 'Print current working directory'
    set -l __left_arrow_glyph2        \uE0B1

    printf '\x1b[30m%s\x1b[0m\x1b[35m' (prompt_pwd | sed s~/~''~g)
end

function fish_prompt --description 'Write out the prompt'

    set -l ___symbol_color (red)
    
    set -l __left_arrow_glyph        \uE0B0
    switch $USER
        case root
            set -x ___user (printf '%s%s%s' (set_color -b (red)) $USER (set_color normal))
        case 'simon'
            set -x ___user (printf '\x1b[44m\x1b[30m%s\x1b[34m' $USER )
        case '*'
            set -x ___user (printf '%s%s%s' (set_color -b (cyan)) $USER (set_color normal))
    end
    
    set -l ___hostname (hostname|cut -d . -f 1)

    switch $___hostname
        case tek-top
           set -x ___host (printf '\x1b[42m%s\x1b[30m%s\x1b[32m' $__left_arrow_glyph $___hostname)

    end

    set -l ___pre_cwd (printf '\x1b[45m%s\x1b[30m ' $__left_arrow_glyph)

    # print the prompt
    set -l ___at (printf '%s@%s' (set_color $___symbol_color) (set_color normal))
    set -l ___arrow (printf '%s@%s' (set_color $___symbol_color) (set_color normal))
    #set -l ___host (printf '%s%s%s' (_simotek_theme_user) $___at (_simotek_theme_hostname))
    set -l ___cwd (_simotek_theme_cwd)
    #set -l ___vcs (printf '%s%s' (_simotek_theme_vcs))
    set -l ___prompt_char (printf '%s ➤ %s' (set_color $___symbol_color) (set_color normal))

    printf '%s%s%s%s%s' $___user $___host $___pre_cwd $___cwd $__left_arrow_glyph
    
    set -e ___user
    set -e ___host 
end
