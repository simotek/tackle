# simotek prompt theme, by Simon Lees <http://github.com/simotek/>
function _simotek_theme_user --description 'Print user name'
    switch $USER
        case root
            printf "$smtk_clr_red_hb%s" $USER
        case '*'
            printf "$smtk_clr_green_hb%s" $USER
    end
end

function _simotek_theme_hostname --description 'Print the hostname'
    printf "$smtk_clr_blue_hb%s" (hostname|cut -d . -f 1)
end

function _simotek_theme_cwd --description 'Print current working directory'
    set -l prompt_pwd_local (prompt_pwd)
    set -l char_1 (string sub -s 1 -l 1 $prompt_pwd_local)
    if test "$char_1" = "~"
        printf "$smtk_clr_purple_hb%s" (prompt_pwd)
    else  
        printf "$smtk_clr_yellow_b%s" (prompt_pwd)
    end
end

function fish_prompt --description 'Write out the prompt'

    set -l __left_arrow_glyph        \uE0B0

    # print the prompt
    set -l ___at (printf "$smtk_clr_red_hb@")
    set -l ___host (printf '%s%s%s' (_simotek_theme_user) $___at (_simotek_theme_hostname))
    set -l ___cwd (_simotek_theme_cwd)
    #set -l ___vcs (printf '%s%s' (_simotek_theme_vcs))
    set -l ___prompt_char (printf "$smtk_clr_red_hb ➤ %s$smtk_clr_black%s%s "  (set_color normal) $__left_arrow_glyph (set_color normal))

    printf "$smtk_clr_back%s %s%s %s" $___host $___cwd $___vcs $___prompt_char
end
