function lookup152 -d "Where does a leap packages come from"
  osc -A https://api.opensuse.org cat openSUSE:Leap:15.2:Update 00Meta lookup.yml | grep $argv
end
