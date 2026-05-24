# ╔══════════════════════════════════════════════════════╗
# ║              .zshrc — jon-zenbook                    ║
# ╚══════════════════════════════════════════════════════╝

# ── Zinit ──────────────────────────────────────────────
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ── Módulos ────────────────────────────────────────────
source "$ZDOTDIR/exports.zsh"
source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/aliases.zsh"

# ── Opções do Zsh ──────────────────────────────────────
setopt AUTO_CD              # cd sem digitar cd
setopt HIST_IGNORE_DUPS     # não duplica histórico consecutivo
setopt HIST_IGNORE_ALL_DUPS # remove duplicatas antigas do histórico
setopt SHARE_HISTORY        # compartilha histórico entre sessões
setopt HIST_VERIFY          # mostra comando antes de executar do histórico

# ── Histórico ──────────────────────────────────────────
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# ── Completion ─────────────────────────────────────────
autoload -Uz compinit
compinit -d "$HOME/.cache/zsh/zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # case-insensitive

# ── Prompt ─────────────────────────────────────────────
eval "$(starship init zsh)"
