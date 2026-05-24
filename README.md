<div align="center">

# 🌃 my-hyprland-rice

**[ [English](#english) · [Português](#português) ]**

![Hyprland](https://img.shields.io/badge/WM-Hyprland-blue?style=flat-square&logo=linux)
![Theme](https://img.shields.io/badge/Theme-Tokyo%20Night-7aa2f7?style=flat-square)
![Arch](https://img.shields.io/badge/OS-Arch%20Linux-1793d1?style=flat-square&logo=archlinux)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)

</div>

---

## English

<details open>
<summary><strong>Table of Contents</strong></summary>

- [Overview](#overview)
- [Screenshots](#screenshots)
- [Components](#components)
- [Hardware](#hardware)
- [Installation](#installation)
- [Key Bindings](#key-bindings)
- [Font & Theme](#font--theme)
- [File Structure](#file-structure)
- [Credits](#credits)

</details>

### Overview

A clean, functional Arch Linux + Hyprland setup built around the **Tokyo Night** color palette. Designed as a full developer workstation — aesthetically consistent across every component, from the terminal to the file manager.

**Philosophy:** every config is version-controlled, portable, and reproducible via a single bootstrap script.

### Screenshots

> Screenshots coming soon

<!-- Add screenshots here:
![Desktop](docs/screenshots/desktop.png)
![Terminal](docs/screenshots/terminal.png)
![Editor](docs/screenshots/editor.png)
-->

### Components

| Role | Package |
|---|---|
| **Window Manager** | [Hyprland](https://hyprland.org) + [uwsm](https://github.com/Vladimir-csp/uwsm) |
| **Bar** | [Waybar](https://github.com/Alexays/Waybar) |
| **Launcher** | [Rofi](https://github.com/lbonn/rofi) (wayland fork) |
| **Notifications** | [Swaync](https://github.com/ErikReider/SwayNotificationCenter) |
| **Lock screen** | [Hyprlock](https://github.com/hyprwm/hyprlock) |
| **Idle daemon** | [Hypridle](https://github.com/hyprwm/hypridle) |
| **Wallpaper** | [awww](https://github.com/itepastra/awww) (swww fork) |
| **Terminal** | [Kitty](https://sw.kovidgoyal.net/kitty) |
| **Shell** | [Zsh](https://www.zsh.org) + [zinit](https://github.com/zdharma-continuum/zinit) |
| **Prompt** | [Starship](https://starship.rs) |
| **Multiplexer** | [Tmux](https://github.com/tmux/tmux) + tpm |
| **Editor** | [VSCode](https://code.visualstudio.com) · [LazyVim](https://www.lazyvim.org) · [Zed](https://zed.dev) |
| **File Manager** | [Thunar](https://docs.xfce.org/xfce/thunar/start) |
| **Browser** | [Google Chrome](https://www.google.com/chrome) |
| **Screenshot** | [Grim](https://sr.ht/~emersion/grim) + [Slurp](https://github.com/emersion/slurp) + [Swappy](https://github.com/jtheoof/swappy) |
| **Clipboard** | [Cliphist](https://github.com/sentriz/cliphist) + wl-clipboard |
| **Color picker** | [Hyprpicker](https://github.com/hyprwm/hyprpicker) |
| **GTK Theme** | [Tokyonight-Dark](https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme) |
| **Icons** | [Papirus-Dark](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) + tokyo folders |
| **Cursor** | [Bibata-Modern-Ice](https://github.com/ful1e5/Bibata_Cursor) |
| **Fonts** | JetBrains Mono Nerd Font · Inter |

### Hardware

Tested on an **ASUS Zenbook 14 UX3405CA** (Intel Lunar Lake, 2025):

- CPU: Intel Core Ultra Series 2 (requires kernel 6.10+)
- GPU: Intel Arc 140T (Xe2/Battlemage) — mesa, fully Wayland-native
- RAM: 32 GB LPDDR5X
- Storage: 1 TB NVMe
- Display: 14" 1920×1200 @ 60Hz, touch screen

### Installation

> ⚠️ This script is designed for a **fresh Arch Linux install**. Do not run on an existing system without reviewing each step.

**Prerequisites:**
- Fresh Arch Linux install (kernel `linux-zen` recommended)
- Internet connection
- Regular user with `sudo` access

**Bootstrap:**

```bash
# 1. Clone the repository
git clone https://github.com/jonatasbarra/my-hyprland-rice ~/dotfiles

# 2. Run the bootstrap script
cd ~/dotfiles && bash install.sh
```

The script will:
1. Install `paru` (AUR helper) if not present
2. Install all packages from `packages.txt` via pacman
3. Install all AUR packages from `packages-aur.txt` via paru
4. Apply all dotfiles via GNU Stow
5. Print remaining manual steps

**After running the script, follow the printed manual steps**, which include:
- Setting zsh as your default shell
- Creating `~/.gitconfig.local` with your git identity
- Setting up your SSH key for GitHub
- Configuring auto-login (optional)

### Key Bindings

> See [docs/keybinds.md](docs/keybinds.md) for the full list.

| Keybind | Action |
|---|---|
| `Super + Enter` | Open terminal (Kitty) |
| `Super` | Open launcher (Rofi) |
| `Super + D` | App launcher (Rofi drun) |
| `Super + Q` | Close active window |
| `Super + F` | Toggle fullscreen |
| `Super + V` | Clipboard history |
| `Super + L` | Lock screen |
| `Super + E` | File manager (Thunar) |
| `Super + C` | Browser (Chrome) |
| `Super + N` | Notification center |
| `Super + ←→↑↓` | Navigate workspaces |
| `Super + Shift + ←→↑↓` | Move window to workspace |
| `Print` | Screenshot (region) |
| `Shift + Print` | Screenshot (fullscreen) |

### Font & Theme

| Role | Choice |
|---|---|
| **Color palette** | [Tokyo Night](https://github.com/enkia/tokyo-night-vscode-theme) |
| **Monospace font** | JetBrains Mono Nerd Font |
| **System font** | Inter |
| **Terminal opacity** | 0.92 with blur |
| **Border radius** | 10px |
| **Border** | Animated gradient `#7aa2f7` → `#bb9af7` |

### File Structure

```
~/dotfiles/
├── install.sh              # Bootstrap script
├── packages.txt            # pacman packages
├── packages-aur.txt        # AUR packages
├── hypr/                   # Hyprland config
├── waybar/                 # Bar config + style
├── kitty/                  # Terminal config
├── zsh/                    # Shell config (modular)
├── starship/               # Prompt config
├── tmux/                   # Multiplexer config
├── nvim/                   # LazyVim config
├── vscode/                 # VSCode settings
├── zed/                    # Zed editor settings
├── rofi/                   # Launcher theme
├── swaync/                 # Notification style
├── hyprlock/               # Lock screen config
├── hypridle/               # Idle daemon config
├── git/                    # Git config (public)
├── mise/                   # Version manager config
├── fontconfig/             # Font rendering
├── gtk/                    # GTK3 theme settings
├── qt5ct/ qt6ct/           # Qt theme settings
├── swappy/                 # Screenshot annotator
└── scripts/                # Personal scripts
    └── .local/bin/
        ├── screenshot
        ├── osd-volume
        ├── osd-brightness
        └── wallpaper
```

### Credits

Inspired by the work of:
- [end-4/dots-hyprland](https://github.com/end-4/dots-hyprland)
- [JaKooLit/Arch-Hyprland](https://github.com/JaKooLit/Arch-Hyprland)
- [prasanthrangan/hyprdots](https://github.com/prasanthrangan/HyDE)
- [r/unixporn](https://www.reddit.com/r/unixporn) community

---

## Português

<details>
<summary><strong>Índice</strong></summary>

- [Visão Geral](#visão-geral)
- [Screenshots](#screenshots-1)
- [Componentes](#componentes)
- [Hardware](#hardware-1)
- [Instalação](#instalação)
- [Atalhos de Teclado](#atalhos-de-teclado)
- [Fonte e Tema](#fonte-e-tema)
- [Estrutura de Arquivos](#estrutura-de-arquivos)
- [Créditos](#créditos)

</details>

### Visão Geral

Uma configuração limpa e funcional de Arch Linux + Hyprland construída em torno da paleta de cores **Tokyo Night**. Projetada como uma estação de trabalho completa para desenvolvimento — visualmente consistente em todos os componentes, do terminal ao gerenciador de arquivos.

**Filosofia:** toda configuração é versionada, portátil e reproduzível via um único script de bootstrap.

### Screenshots

> Screenshots em breve

### Componentes

| Função | Pacote |
|---|---|
| **Gerenciador de janelas** | [Hyprland](https://hyprland.org) + [uwsm](https://github.com/Vladimir-csp/uwsm) |
| **Barra** | [Waybar](https://github.com/Alexays/Waybar) |
| **Launcher** | [Rofi](https://github.com/lbonn/rofi) (fork Wayland) |
| **Notificações** | [Swaync](https://github.com/ErikReider/SwayNotificationCenter) |
| **Tela de bloqueio** | [Hyprlock](https://github.com/hyprwm/hyprlock) |
| **Daemon de idle** | [Hypridle](https://github.com/hyprwm/hypridle) |
| **Wallpaper** | [awww](https://github.com/itepastra/awww) (fork do swww) |
| **Terminal** | [Kitty](https://sw.kovidgoyal.net/kitty) |
| **Shell** | [Zsh](https://www.zsh.org) + [zinit](https://github.com/zdharma-continuum/zinit) |
| **Prompt** | [Starship](https://starship.rs) |
| **Multiplexador** | [Tmux](https://github.com/tmux/tmux) + tpm |
| **Editor** | [VSCode](https://code.visualstudio.com) · [LazyVim](https://www.lazyvim.org) · [Zed](https://zed.dev) |
| **Gerenciador de arquivos** | [Thunar](https://docs.xfce.org/xfce/thunar/start) |
| **Navegador** | [Google Chrome](https://www.google.com/chrome) |
| **Screenshot** | [Grim](https://sr.ht/~emersion/grim) + [Slurp](https://github.com/emersion/slurp) + [Swappy](https://github.com/jtheoof/swappy) |
| **Clipboard** | [Cliphist](https://github.com/sentriz/cliphist) + wl-clipboard |
| **Seletor de cor** | [Hyprpicker](https://github.com/hyprwm/hyprpicker) |
| **Tema GTK** | [Tokyonight-Dark](https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme) |
| **Ícones** | [Papirus-Dark](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) + pastas tokyo |
| **Cursor** | [Bibata-Modern-Ice](https://github.com/ful1e5/Bibata_Cursor) |
| **Fontes** | JetBrains Mono Nerd Font · Inter |

### Hardware

Testado em um **ASUS Zenbook 14 UX3405CA** (Intel Lunar Lake, 2025):

- CPU: Intel Core Ultra Series 2 (requer kernel 6.10+)
- GPU: Intel Arc 140T (Xe2/Battlemage) — mesa, totalmente nativo no Wayland
- RAM: 32 GB LPDDR5X
- Armazenamento: 1 TB NVMe
- Tela: 14" 1920×1200 @ 60Hz, touch screen

### Instalação

> ⚠️ Este script foi projetado para uma **instalação limpa do Arch Linux**. Não execute em um sistema existente sem revisar cada etapa.

**Pré-requisitos:**
- Arch Linux recém-instalado (kernel `linux-zen` recomendado)
- Conexão com a internet
- Usuário comum com acesso `sudo`

**Bootstrap:**

```bash
# 1. Clone o repositório
git clone https://github.com/jonatasbarra/my-hyprland-rice ~/dotfiles

# 2. Execute o script de bootstrap
cd ~/dotfiles && bash install.sh
```

O script irá:
1. Instalar o `paru` (AUR helper) se não estiver presente
2. Instalar todos os pacotes do `packages.txt` via pacman
3. Instalar todos os pacotes AUR do `packages-aur.txt` via paru
4. Aplicar todos os dotfiles via GNU Stow
5. Exibir os passos manuais restantes

**Após executar o script, siga os passos manuais exibidos**, que incluem:
- Definir o zsh como shell padrão
- Criar `~/.gitconfig.local` com sua identidade git
- Configurar sua chave SSH para o GitHub
- Configurar login automático (opcional)

### Atalhos de Teclado

> Veja [docs/keybinds.md](docs/keybinds.md) para a lista completa.

| Atalho | Ação |
|---|---|
| `Super + Enter` | Abrir terminal (Kitty) |
| `Super` | Abrir launcher (Rofi) |
| `Super + D` | Launcher de apps (Rofi drun) |
| `Super + Q` | Fechar janela ativa |
| `Super + F` | Alternar tela cheia |
| `Super + V` | Histórico de clipboard |
| `Super + L` | Bloquear tela |
| `Super + E` | Gerenciador de arquivos (Thunar) |
| `Super + C` | Navegador (Chrome) |
| `Super + N` | Central de notificações |
| `Super + ←→↑↓` | Navegar entre workspaces |
| `Super + Shift + ←→↑↓` | Mover janela para workspace |
| `Print` | Screenshot (região) |
| `Shift + Print` | Screenshot (tela cheia) |

### Fonte e Tema

| Função | Escolha |
|---|---|
| **Paleta de cores** | [Tokyo Night](https://github.com/enkia/tokyo-night-vscode-theme) |
| **Fonte monoespaçada** | JetBrains Mono Nerd Font |
| **Fonte do sistema** | Inter |
| **Opacidade do terminal** | 0.92 com blur |
| **Raio de borda** | 10px |
| **Borda** | Gradiente animado `#7aa2f7` → `#bb9af7` |

### Estrutura de Arquivos

```
~/dotfiles/
├── install.sh              # Script de bootstrap
├── packages.txt            # Pacotes pacman
├── packages-aur.txt        # Pacotes AUR
├── hypr/                   # Config do Hyprland
├── waybar/                 # Config + estilo da barra
├── kitty/                  # Config do terminal
├── zsh/                    # Config do shell (modular)
├── starship/               # Config do prompt
├── tmux/                   # Config do multiplexador
├── nvim/                   # Config do LazyVim
├── vscode/                 # Settings do VSCode
├── zed/                    # Settings do Zed
├── rofi/                   # Tema do launcher
├── swaync/                 # Estilo das notificações
├── hyprlock/               # Config da tela de bloqueio
├── hypridle/               # Config do daemon de idle
├── git/                    # Config do git (pública)
├── mise/                   # Config do gerenciador de versões
├── fontconfig/             # Renderização de fontes
├── gtk/                    # Configurações do tema GTK3
├── qt5ct/ qt6ct/           # Configurações de tema Qt
├── swappy/                 # Anotador de screenshots
└── scripts/                # Scripts pessoais
    └── .local/bin/
        ├── screenshot
        ├── osd-volume
        ├── osd-brightness
        └── wallpaper
```

### Créditos

Inspirado pelo trabalho de:
- [end-4/dots-hyprland](https://github.com/end-4/dots-hyprland)
- [JaKooLit/Arch-Hyprland](https://github.com/JaKooLit/Arch-Hyprland)
- [prasanthrangan/hyprdots](https://github.com/prasanthrangan/HyDE)
- Comunidade [r/unixporn](https://www.reddit.com/r/unixporn)

---

<div align="center">
<sub>Built with ❤️ on Arch Linux</sub>
</div>