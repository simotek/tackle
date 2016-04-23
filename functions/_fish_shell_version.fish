function _fish_shell_version
  printf "%s\n" (fish -v 2>| sed 's/^.*[^0-9]\([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/' | sed -e 's:\.::g')
end