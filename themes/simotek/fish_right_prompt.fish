# urdh prompt theme, by Simon Sigurdhsson <http://github.com/urdh/>
function fish_right_prompt --description 'Write out the right-hand prompt'
    printf ' %s%s%s' (set_color 585858) (date) (set_color normal)
end
