function ll -d "ls -l with extra color"
    _colorize ls -lah --color=always $argv
end
