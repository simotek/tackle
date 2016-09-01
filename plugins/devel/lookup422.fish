function lookup422 -d "Where does a leap packages come from"
  osc -A https://api.opensuse.org cat openSUSE:Leap:42.2:Update 00Meta lookup.yml | grep $argv
end