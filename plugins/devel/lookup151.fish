function lookup151 -d "Where does a leap packages come from"
  osc -A https://api.opensuse.org cat openSUSE:Leap:15.1:Update 00Meta lookup.yml | grep $argv
end
