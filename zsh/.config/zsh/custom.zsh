# 1. zinit
source "$ZINIT_DIR/zinit.zsh"

# 2. zsh completions
autoload -U compinit
compinit

# 3. zinit plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# direnv + zoxide
command -v zoxide &> /dev/null && eval "$(zoxide init zsh --cmd cd)"
command -v direnv &> /dev/null && eval "$(direnv hook zsh)"

# starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
eval "$(starship init zsh)"

# 5. custom aliases
alias ls='eza --icons --group-directories-first -1'
