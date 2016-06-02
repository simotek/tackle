# simotek prompt theme, by Simon Lees <http://github.com/simotek/>
#
# If a git directory uses https://github.com/magicmonty/bash-git-prompt
#   to display the prompt otherwise displays the date
function fish_right_prompt --description 'Write out the right-hand prompt'
    
    __tacklebox_load_env_file "$tacklebox_path/themes/simotek/simotek_theme_colors.en"
    
    set -l _display_status $status

    if not set -q __GIT_PROMPT_DIR
        set __GIT_PROMPT_DIR ~/src/config/bash-git-prompt
    end

    # Colors
    # Reset
    set ResetColor (set_color normal)       # Text Reset

    # Default values for the appearance of the prompt. Configure at will.
    set GIT_PROMPT_CONFLICTS "$smtk_clr_red_b✖ "
    set GIT_PROMPT_REMOTE " "
    set GIT_PROMPT_STASHED "⚑ "
    set GIT_PROMPT_CLEAN "$smtk_clr_green_hb✔"

    set GIT_PROMPT_BRANCH "$smtk_clr_green_hb"
    set GIT_PROMPT_UNTRACKED " $smtk_clr_yellow_hb…"
    set GIT_PROMPT_CHANGED "$smtk_clr_cyan_hb✚"
    set GIT_PROMPT_STAGED "$smtk_clr_purple_hb●"

    # This doesn't use a env var in order to not conflict with the following bracket
    set GIT_PROMPT_PREFIX " \e[0;31;40m["                 # start of the git info string
    set GIT_PROMPT_SUFFIX "$smtk_clr_red_b]$ResetColor"                 # the end of the git info string
    set GIT_PROMPT_SEPARATOR "$smtk_clr_red_b|"              # separates each item


    if git rev-parse --is-inside-work-tree > /dev/null ^ /dev/null

        # These are blank for the right hand prompt
        set PROMPT_START ""
    	set PROMPT_END ""

    	set -e __CURRENT_GIT_STATUS
    	set gitstatus "gitstatus.py"

    	set _GIT_STATUS (python $gitstatus)
    	set __CURRENT_GIT_STATUS $_GIT_STATUS

    	set __CURRENT_GIT_STATUS_PARAM_COUNT (count $__CURRENT_GIT_STATUS)

    	if not test "0" -eq $__CURRENT_GIT_STATUS_PARAM_COUNT
    	    set GIT_BRANCH $__CURRENT_GIT_STATUS[1]
    	    set GIT_REMOTE "$__CURRENT_GIT_STATUS[2]"
    	    if contains "." "$GIT_REMOTE"
    		set -e GIT_REMOTE
    	    end
    	    set GIT_STAGED $__CURRENT_GIT_STATUS[3]
    	    set GIT_CONFLICTS $__CURRENT_GIT_STATUS[4]
    	    set GIT_CHANGED $__CURRENT_GIT_STATUS[5]
    	    set GIT_UNTRACKED $__CURRENT_GIT_STATUS[6]
    	    set GIT_STASHED $__CURRENT_GIT_STATUS[7]
    	    set GIT_CLEAN $__CURRENT_GIT_STATUS[8]
    	end

        set STATUS " $GIT_PROMPT_PREFIX$GIT_PROMPT_BRANCH$GIT_BRANCH$smtk_clr_white_b"

        if set -q GIT_REMOTE
            set STATUS "$STATUS$GIT_PROMPT_REMOTE$GIT_REMOTE"
        end

        set STATUS "$STATUS$GIT_PROMPT_SEPARATOR"

        if [ "$GIT_STAGED" != "0" ]
            set STATUS "$STATUS$GIT_PROMPT_STAGED$GIT_STAGED"
        end

        if [ "$GIT_CONFLICTS" != "0" ]
            set STATUS "$STATUS$GIT_PROMPT_CONFLICTS$GIT_CONFLICTS"
        end

        if [ "$GIT_CHANGED" != "0" ]
            set STATUS "$STATUS$GIT_PROMPT_CHANGED$GIT_CHANGED"
        end

        if [ "$GIT_UNTRACKED" != "0" ]
            set STATUS "$STATUS$GIT_PROMPT_UNTRACKED$GIT_UNTRACKED"
        end

        if [ "$GIT_STASHED" != "0" ]
            set STATUS "$STATUS$GIT_PROMPT_STASHED$GIT_STASHED"
        end

        if [ "$GIT_CLEAN" = "1" ]
            set STATUS "$STATUS$GIT_PROMPT_CLEAN"
        end

        set STATUS "$STATUS$GIT_PROMPT_SUFFIX"

        echo -e "$PROMPT_START$STATUS$PROMPT_END"
    else if test -r "$PWD/series" -a -d "$PWD/.pc/"
        # Get current patch name 
        if test -r "$PWD/.pc/applied-patches"
            set -l __tmp (tail -1 .pc/applied-patches)
            set __quilt_current_patch_name (echo -e "$smtk_clr_green_hb$__tmp")
            set __quilt_current_patch_number (cat .pc/applied-patches | wc -l)
        else
            set __quilt_current_patch_name (printf "$smtk_clr_yellow_b%s" "No patches applied")
            set __quilt_current_patch_number "0"
        end
        
        set -l __file_count (cat series | wc -l)
        # There is 4 lines of comments at the start of the file
        set -l __patch_count (echo "$__file_count-4" | bc)
        printf "\x1b[40m\x1b[91m[%s$smtk_clr_red_hb|$smtk_clr_blue_b%s$smtk_clr_yellow_b/$smtk_clr_green_hb%s$smtk_clr_red_hb]%s" $__quilt_current_patch_name $__quilt_current_patch_number $__patch_count (set_color normal)
    else
        printf " \x1b[40m\x1b[91m[%s%s$smtk_clr_red_hb|%s%s$smtk_clr_red_hb]%s" (set_color (offwhite_alt)) (date) (set_color 777) $_display_status (set_color normal)
    end
    
    __tacklebox_unload_env_file "$tacklebox_path/themes/simotek/simotek_theme_colors.en"

end
