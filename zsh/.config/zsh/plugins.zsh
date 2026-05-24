# ── Plugins via zinit ──────────────────────────────────

# Completions extras (deve vir antes do compinit)
zinit light zsh-users/zsh-completions

# Syntax highlighting (deve vir antes de autosuggestions)
zinit light zdharma-continuum/fast-syntax-highlighting

# Autosuggestions do histórico
zinit light zsh-users/zsh-autosuggestions

# Configuração das autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#565f89"  # cor Tokyo Night comment
ZSH_AUTOSUGGEST_STRATEGY=(history completion)  # histórico primeiro, completion depois
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20            # não sugere comandos muito longos

# ── Integrações ────────────────────────────────────────
# fzf: Ctrl+R (histórico), Ctrl+T (arquivos), Alt+C (diretórios)
eval "$(fzf --zsh)"

# zoxide: substitui cd com inteligência de frequência/recência
eval "$(zoxide init zsh --cmd cd)"

# tealdeer: atualizar cache na primeira vez
# tldr --update  # rodar manualmente uma vez
