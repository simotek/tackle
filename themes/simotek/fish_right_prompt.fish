# simotek prompt theme, by Simon Lees <http://github.com/simotek/>
#
# If a git directory uses https://github.com/magicmonty/bash-git-prompt
#   to display the prompt otherwise displays the date
function fish_right_prompt --description 'Write out the right-hand prompt'

    if not set -q __GIT_PROMPT_DIR
        set __GIT_PROMPT_DIR ~/src/config/bash-git-prompt
    end

    # Colors
    # Reset
    set ResetColor (set_color normal)       # Text Reset

    # Regular Colors
    set Red (set_color red)                 # Red
    set BrightYellow (set_color -o yellow); # Yellow
    set Blue (set_color blue)               # Blue
    set WHITE (set_color white)
    set Green (set_color green)

    # Bold
    set BGreen (set_color -o green)         # Green

    # High Intensty
    set IBlack (set_color -o black)         # Black

    # Bold High Intensty
    set Magenta (set_color magenta)       # Purple
    set BrightMagenta (set_color -o magenta) # Purple
    set BrightCyan (set_color -o cyan)       # Purple


    # Default values for the appearance of the prompt. Configure at will.
    set GIT_PROMPT_CONFLICTS "$Red✖ "
    set GIT_PROMPT_REMOTE " "
    set GIT_PROMPT_STASHED "⚑ "
    set GIT_PROMPT_CLEAN "$BGreen✔"
    
    set GIT_PROMPT_BRANCH "$Green"
    set GIT_PROMPT_UNTRACKED " $BrightYellow…"
    set GIT_PROMPT_CHANGED "$BrightCyan✚"
    set GIT_PROMPT_STAGED "$BrightMagenta●"
  
    set GIT_PROMPT_PREFIX "$Magenta [$ResetColor"                 # start of the git info string
    set GIT_PROMPT_SUFFIX "$Magenta]$ResetColor"                 # the end of the git info string
    set GIT_PROMPT_SEPARATOR "$Magenta|$ResetColor"              # separates each item
    
    
    if git rev-parse --is-inside-work-tree > /dev/null ^ /dev/null
        
        # These are blank for the right hand prompt
        set PROMPT_START ""
	set PROMPT_END ""

	set -e __CURRENT_GIT_STATUS
	set gitstatus "$__GIT_PROMPT_DIR/gitstatus.py"

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
    
        set STATUS " $GIT_PROMPT_PREFIX$GIT_PROMPT_BRANCH$GIT_BRANCH$ResetColor"

        if set -q GIT_REMOTE
            set STATUS "$STATUS$GIT_PROMPT_REMOTE$GIT_REMOTE$ResetColor"
        end

        set STATUS "$STATUS$GIT_PROMPT_SEPARATOR"

        if [ "$GIT_STAGED" != "0" ]
            set STATUS "$STATUS$GIT_PROMPT_STAGED$GIT_STAGED$ResetColor"
        end
        
        if [ "$GIT_CONFLICTS" != "0" ]
            set STATUS "$STATUS$GIT_PROMPT_CONFLICTS$GIT_CONFLICTS$ResetColor"
        end

        if [ "$GIT_CHANGED" != "0" ]
            set STATUS "$STATUS$GIT_PROMPT_CHANGED$GIT_CHANGED$ResetColor"
        end

        if [ "$GIT_UNTRACKED" != "0" ]
            set STATUS "$STATUS$GIT_PROMPT_UNTRACKED$GIT_UNTRACKED$ResetColor"
        end
        
        if [ "$GIT_STASHED" != "0" ]
            set STATUS "$STATUS$GIT_PROMPT_STASHED$GIT_STASHED$ResetColor"
        end

        if [ "$GIT_CLEAN" = "1" ]
            set STATUS "$STATUS$GIT_PROMPT_CLEAN"
        end

        set STATUS "$STATUS$ResetColor$GIT_PROMPT_SUFFIX"

        echo -e "$PROMPT_START$STATUS$PROMPT_END"
    else
        printf ' %s%s%s' (set_color 585858) (date) (set_color normal)
    end
end
