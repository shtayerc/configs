set fish_greeting
function fish_prompt
    echo (prompt_pwd)' $ '
end
source ~/.config/fish/local.fish 2> /dev/null
bind \cX 'edit_command_buffer'
