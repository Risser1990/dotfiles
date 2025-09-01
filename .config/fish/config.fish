# Disable greeting
set -g fish_greeting ""

# Interactive session tools
if status is-interactive
    starship init fish | source
    zoxide init fish | source
end

printf '\n\n\n'
fastfetch --logo-type kitty --logo ~/Pictures/Wallpapers/archicon.png --logo-padding-top 3

#fastfetch

# Aliases
alias nano='micro'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cat='bat'
alias cd='z'

# Ensure ~/.local/bin is in path
if not contains $HOME/.local/bin $fish_user_paths
    set -U fish_user_paths $HOME/.local/bin $fish_user_paths
end
