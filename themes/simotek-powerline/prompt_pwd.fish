function prompt_pwd --description 'Print the current working directory, NOT shortened to fit the prompt'
     printf "%s" (echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|" -e "s|home:simotek:branches|h:s:b|")
end
