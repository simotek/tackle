function ipshow -d "shows ipv4 address for each interface"
    ip addr show $argv | grc -c $tacklebox_path/plugins/grc/conf.ipshow grep "inet "
end
