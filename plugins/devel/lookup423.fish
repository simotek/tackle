function lookup432 -d "Where does a leap packages come from"
  osc -A https://api.opensuse.org cat openSUSE:Leap:42.3:Update 00Meta lookup.yml | grep $argv
end