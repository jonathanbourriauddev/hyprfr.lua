# ===========================
# FISH CONFIG — DRACULA WARM
# ===========================


# Désactive le message de bienvenue
set -g fish_greeting ""

# Fastfetch au démarrage
if status is-interactive
    fastfetch
end

# Zellij au démarrage — désactivé pour V1
# if set -q KITTY_WINDOW_ID
#     and not set -q ZELLIJ
#     zellij
# end

# Starship comme prompt
starship init fish | source

# Variables d'environnement
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx TERMINAL kitty
set -gx BROWSER firefox

# PATH
fish_add_path ~/.local/bin
fish_add_path ~/dotfiles/scripts

# ===========================
# ALIASES
# ===========================
alias ls    'eza --icons --group-directories-first'
alias ll    'eza -la --icons --group-directories-first'
alias lt    'eza --tree --icons --level=2'
alias cat   'bat'
alias grep  'grep --color=auto'
alias vim   'nvim'

# Git
alias gs    'git status'
alias ga    'git add'
alias gc    'git commit -m'
alias gp    'git push'
alias gl    'git log --oneline'

# Dotfiles
alias dots  'cd ~/dotfiles'

# Système
alias update  'sudo pacman -Syu'
alias cleanup 'sudo pacman -Rns $(pacman -Qtdq)'
