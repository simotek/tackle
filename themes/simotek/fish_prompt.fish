# simotek prompt theme, by Simon Sigsimoteksson <http://github.com/simotek/>
function _simotek_theme_user --description 'Print user name'
    switch $USER
        case root
            printf '%s%s%s' (set_color red) $USER (set_color normal)
        case '*'
            printf '%s%s%s' (set_color 5fff5f) $USER (set_color normal)
    end
end

function _simotek_theme_hostname --description 'Print the hostname'
    printf '%s%s%s' (set_color 515fff) (hostname|cut -d . -f 1) (set_color normal)
end

function _simotek_theme_cwd --description 'Print current working directory'
    printf '%s%s%s' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

#function _simotek_theme_vcs --description 'Write out the VCS prompt'
#    set -l ___vcs (vcprompt -f '%n')
#    if test -n "$___vc"
#        switch $___vcs
#            case 'git*'
#                set -g __fish_git_prompt_color_branch 'black' '--bold'
#                set -g __fish_git_prompt_color_merging 'red' '--bold'
#                __fish_git_prompt ' %s'
#            case 'hg*'
#                printf ' %s%s%s' (set_color -o black) (vcprompt -f '%b') (set_color normal)
#        end
#    end
#end

function fish_prompt --description 'Write out the prompt'
   
    set -l ___symbol_color af0087   
 
    # print the prompt
    set -l ___at (printf '%s@%s' (set_color $___symbol_color) (set_color normal))
    set -l ___arrow (printf '%s@%s' (set_color 870087) (set_color normal))
    set -l ___host (printf '%s%s%s' (_simotek_theme_user) $___at (_simotek_theme_hostname))
    set -l ___cwd (_simotek_theme_cwd)
    #set -l ___vcs (printf '%s%s' (_simotek_theme_vcs))
    set -l ___prompt_char (printf '%s➤ %s' (set_color $___symbol_color) (set_color normal))  

    printf '%s %s%s %s' $___host $___cwd $___vcs $___prompt_char
end
