# Disable greeting
set -g fish_greeting ""

# Interactive session tools
if status is-interactive
    starship init fish | source
    zoxide init fish | source
end

set -Ux FZF_DEFAULT_OPTS '--height=60% --preview "set mime (file --mime-type {} 2>/dev/null | cut -d: -f2 | tr -d \" \"); switch \$mime; case \"image/*\"; echo \"Image: {}\"; kitten icat --clear --transfer-mode=memory --stdin=no --place=60x30@0x0 {} 2>/dev/null; case \"*\"; bat --color=always --style=numbers --line-range=:50 {} 2>/dev/null; end" --preview-window=right:70% --bind "esc:execute(kitten icat --clear)+abort" --bind "ctrl-c:execute(kitten icat --clear)+abort"'

#fastfetch

# Aliases
alias nano='micro'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias cat='bat'
alias cd='z'
alias man='batman'
alias fastfetch='fastfetch --logo-type kitty --logo ~/Pictures/Wallpapers/archicon.png --logo-padding-top 3'


# Ensure ~/.local/bin is in path
if not contains $HOME/.local/bin $fish_user_paths
    set -U fish_user_paths $HOME/.local/bin $fish_user_paths
end
