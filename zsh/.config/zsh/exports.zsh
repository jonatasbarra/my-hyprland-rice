# Variáveis de ambiente
export EDITOR="nano"       # trocar para nvim/code na F7
export VISUAL="$EDITOR"
export PAGER="less"
export LESS="-R --use-color"
eval "$(mise activate zsh)"

# Android SDK
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
