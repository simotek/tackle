function l -d "ls -l with extra color"
    _colorize ls -lh --color=always $argv
end
