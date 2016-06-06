function color_test -d "Prints colors in there color for test purpose"
    printf "%sblack\t %s bold\t %sbright\t %sbrbold%s\n" (set_color black) (set_color -o black) (set_color normal)
    printf "%sred\t %s bold\t %sbright\t %sbrbold%s\n" (set_color red) (set_color -o red) (set_color brred) (set_color -o brred) (set_color normal)
    printf "%sgreen\t %s bold\t %sbright\t %sbrbold%s\n" (set_color green) (set_color -o green) (set_color brgreen) (set_color -o brgreen) (set_color normal)
    printf "%syellow\t %s bold\t %sbright\t %sbrbold%s\n" (set_color yellow) (set_color -o yellow) (set_color bryellow) (set_color -o bryellow) (set_color normal)
    printf "%sblue\t %s bold\t %sbright\t %sbrbold%s\n" (set_color blue) (set_color -o blue) (set_color brblue) (set_color -o brblue) (set_color normal)
    printf "%spurple\t %s bold\t %sbright\t %sbrbold%s\n" (set_color purple) (set_color -o purple) (set_color brpurple) (set_color -o brpurple) (set_color normal)
    printf "%scyan\t %s bold\t %sbright\t %sbrbold%s\n" (set_color cyan) (set_color -o cyan) (set_color brcyan) (set_color -o brcyan) (set_color normal)
    printf "%sgrey\t %s bold\t %sbright\t %sbrbold%s\n" (set_color grey) (set_color -o grey) (set_color brgrey) (set_color -o brgrey) (set_color normal)
    printf "%white\t %s bold\n" (set_color white) (set_color -o white) (set_color normal)
    printf "%snormal\t %s bold%s\n" (set_color normal) (set_color normal) (set_color normal)
end