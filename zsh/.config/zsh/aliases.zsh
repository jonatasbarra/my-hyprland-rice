# ── Substitutos modernos ───────────────────────────────
alias ls='eza --icons --group-directories-first'
alias ll='eza --icons --group-directories-first -la'
alias lt='eza --icons --tree --level=2'
alias cat='bat --paging=never'
alias find='fd'
alias grep='rg'
alias du='dust'

# ── Git shortcuts ──────────────────────────────────────
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias lg='lazygit'

# ── Sistema ────────────────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'
alias mkdir='mkdir -p'
alias rf='rm -rf'
alias cls='clear'

# ── Pacman ────────────────────────────────────────────
alias pacs='sudo pacman -S'
alias pacr='sudo pacman -Rs'
alias pacu='sudo pacman -Syu'
alias pacq='pacman -Ss'
