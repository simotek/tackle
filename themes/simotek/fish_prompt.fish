# simotek prompt theme, by Simon Lees <http://github.com/simotek/>
function _simotek_theme_user --description 'Print user name'
    switch $USER
        case "*$smtk_user_1*"
            printf "$smtk_clr_green_hb%s" $USER
        case "*$smtk_user_2*"
            printf "$smtk_clr_cyan_hb%s" $USER
        case "*$smtk_user_3*"
            printf "$smtk_clr_purple_hb%s" $USER
        case "*$smtk_user_4*"
            printf "$smtk_clr_red_hb%s" $USER
        case '*'
            printf "$smtk_clr_yellow_b%s" $USER
    end
end

function _simotek_theme_hostname --description 'Print the hostname'
    set -l __host_pretty (hostname|cut -d . -f 1)
    switch $__host_pretty
        case "*$smtk_host_1*"
            printf "$smtk_clr_blue_hb%s" $__host_pretty
        case "*$smtk_host_2*"
            printf "$smtk_clr_cyan_hb%s" $__host_pretty
        case "*$smtk_host_3*"
            printf "$smtk_clr_green_hb%s" $__host_pretty
        case "*$smtk_host_4*"
            printf "$smtk_clr_purple_hb%s" $__host_pretty
        case "*$smtk_host_5*"
            printf "$smtk_clr_yellow%s" $__host_pretty
        case '*'
            printf "$smtk_clr_yellow_b%s" $__host_pretty
    end
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

    __tacklebox_load_env_file "$tacklebox_path/themes/simotek/simotek_theme_colors.en"
    __tacklebox_load_env_file "$tacklebox_path/themes/simotek/simotek_theme.conf"

    set -l __left_arrow_glyph        \uE0B0

    # print the prompt
    set -l ___at (printf "$smtk_clr_red_hb@")
    set -l ___host (printf '%s%s%s' (_simotek_theme_user) $___at (_simotek_theme_hostname))
    set -l ___cwd (_simotek_theme_cwd)
    #set -l ___vcs (printf '%s%s' (_simotek_theme_vcs))
    set -l ___prompt_char (printf "$smtk_clr_red_hb ➤ %s$smtk_clr_black%s%s "  (set_color normal) $__left_arrow_glyph (set_color normal))

    printf "$smtk_clr_back%s %s%s %s" $___host $___cwd $___vcs $___prompt_char

    __tacklebox_load_env_file "$tacklebox_path/themes/simotek/simotek_theme.conf"
    __tacklebox_unload_env_file "$tacklebox_path/themes/simotek/simotek_theme_colors.en"
end
