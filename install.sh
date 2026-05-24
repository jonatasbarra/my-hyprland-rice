#!/usr/bin/env bash
# =============================================================================
# install.sh — Bootstrap script for my-hyprland-rice
# https://github.com/jonatasbarra/my-hyprland-rice
#
# Usage:
#   git clone https://github.com/jonatasbarra/my-hyprland-rice ~/dotfiles
#   cd ~/dotfiles && bash install.sh
#
# What it does:
#   1. Installs paru (AUR helper) if not present
#   2. Installs pacman packages from packages.txt
#   3. Installs AUR packages from packages-aur.txt
#   4. Applies all stow packages
#   5. Prints manual steps that cannot be automated
#
# Idempotent: safe to run multiple times
# =============================================================================

set -euo pipefail

# --- Colors ------------------------------------------------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m'

info()    { echo -e "${BLUE}==>${NC} ${BOLD}$*${NC}"; }
success() { echo -e "${GREEN}✓${NC} $*"; }
warning() { echo -e "${YELLOW}⚠${NC} $*"; }
error()   { echo -e "${RED}✗${NC} $*"; exit 1; }

# --- Checks ------------------------------------------------------------------
[[ "$EUID" -eq 0 ]] && error "Do not run as root. Run as your regular user."
[[ ! -f "$(pwd)/packages.txt" ]] && error "Run this script from the ~/dotfiles directory."

DOTFILES_DIR="$(pwd)"
info "Dotfiles directory: $DOTFILES_DIR"

# --- 1. Install paru ---------------------------------------------------------
info "Checking for paru (AUR helper)..."
if ! command -v paru &>/dev/null; then
    warning "paru not found. Installing..."
    sudo pacman -S --needed --noconfirm git base-devel
    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/paru.git "$tmpdir/paru"
    (cd "$tmpdir/paru" && makepkg -si --noconfirm)
    rm -rf "$tmpdir"
    success "paru installed."
else
    success "paru already installed. Skipping."
fi

# --- 2. Install pacman packages ----------------------------------------------
info "Installing pacman packages from packages.txt..."
# Filter out comments and blank lines
PACMAN_PKGS=$(grep -v '^\s*#' "$DOTFILES_DIR/packages.txt" | grep -v '^\s*$')
sudo pacman -S --needed --noconfirm $PACMAN_PKGS
success "Pacman packages installed."

# --- 3. Install AUR packages -------------------------------------------------
info "Installing AUR packages from packages-aur.txt..."
AUR_PKGS=$(grep -v '^\s*#' "$DOTFILES_DIR/packages-aur.txt" | grep -v '^\s*$')
paru -S --needed --noconfirm $AUR_PKGS
success "AUR packages installed."

# --- 4. Apply stow packages --------------------------------------------------
info "Applying stow packages..."

# List of all stow packages (directories with .config/ structure)
STOW_PACKAGES=(
    fontconfig
    git
    gtk
    hypr
    hypridle
    hyprlock
    kitty
    mise
    nvim
    qt5ct
    qt6ct
    rofi
    scripts
    starship
    swappy
    swaync
    tmux
    vscode
    waybar
    zed
    zsh
)

for pkg in "${STOW_PACKAGES[@]}"; do
    if [[ -d "$DOTFILES_DIR/$pkg" ]]; then
        stow --dir="$DOTFILES_DIR" --target="$HOME" --restow "$pkg"
        success "Stowed: $pkg"
    else
        warning "Package not found, skipping: $pkg"
    fi
done

# --- 5. Manual steps ---------------------------------------------------------
echo ""
echo -e "${BOLD}============================================================${NC}"
echo -e "${BOLD}  Manual steps required after install${NC}"
echo -e "${BOLD}============================================================${NC}"
echo ""
echo -e "${YELLOW}1. Set zsh as default shell:${NC}"
echo "   chsh -s \$(which zsh)"
echo ""
echo -e "${YELLOW}2. Create ~/.gitconfig.local with your identity:${NC}"
echo "   cat > ~/.gitconfig.local << 'EOF'"
echo "   [user]"
echo "       name = Your Name"
echo "       email = your@email.com"
echo "   EOF"
echo ""
echo -e "${YELLOW}3. Create ~/.zshenv to point to ZDOTDIR:${NC}"
echo "   echo 'export ZDOTDIR=~/.config/zsh' >> ~/.zshenv"
echo ""
echo -e "${YELLOW}4. Set up SSH key for GitHub:${NC}"
echo "   ssh-keygen -t ed25519 -C 'your@email.com'"
echo "   cat ~/.ssh/id_ed25519.pub  # add to GitHub"
echo ""
echo -e "${YELLOW}5. Configure auto-login (optional):${NC}"
echo "   See docs/post-install.md for systemd getty override"
echo ""
echo -e "${YELLOW}6. Install TPM plugins (Tmux):${NC}"
echo "   Start tmux, then press prefix + I"
echo ""
echo -e "${GREEN}Done! Reboot or re-login to start Hyprland.${NC}"
