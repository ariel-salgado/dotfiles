#!/bin/bash

# Dotfiles installation script with GNU Stow
# Usage: ./install.sh

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on Arch Linux
check_arch() {
    if [[ ! -f /etc/arch-release ]]; then
        log_warning "This script is designed for Arch Linux. Continuing anyway..."
    fi
}

# Check if GNU Stow is installed
check_stow() {
    log_info "Checking for GNU Stow..."
    
    if command -v stow &> /dev/null; then
        log_success "GNU Stow is already installed"
        return 0
    else
        log_info "GNU Stow not found. Installing..."
        install_stow
    fi
}

# Install GNU Stow using pacman
install_stow() {
    if command -v pacman &> /dev/null; then
        log_info "Installing GNU Stow with pacman..."
        sudo pacman -S --noconfirm stow
        log_success "GNU Stow installed successfully"
    else
        log_error "pacman not found. Please install GNU Stow manually."
        exit 1
    fi
}

# Stow dotfiles directories
stow_dotfiles() {
    local dotfiles_dir="$PWD"
    log_info "Stowing dotfiles from: $dotfiles_dir"
    
    # Get all directories in the current path (excluding hidden dirs and common non-config dirs)
    local dirs=$(find . -maxdepth 1 -type d -name "*" ! -name "." ! -name ".git" ! -name ".github" ! -name "scripts" | sed 's|^\./||')
    
    if [[ -z "$dirs" ]]; then
        log_warning "No directories found to stow"
        return 0
    fi
    
    log_info "Found directories to stow: $(echo $dirs | tr '\n' ' ')"
    
    # Stow each directory
    for dir in $dirs; do
        if [[ -d "$dir" ]]; then
            log_info "Stowing $dir..."
            
            # Use stow with verbose output and simulate first to check for conflicts
            if stow --simulate --verbose "$dir" 2>/dev/null; then
                stow --verbose "$dir"
                log_success "Successfully stowed $dir"
            else
                log_error "Failed to stow $dir (conflicts or errors detected)"
                log_info "You may need to manually resolve conflicts for $dir"
            fi
        fi
    done
}

# Install Zinit
install_zinit() {
    log_info "Installing Zinit..."
    
    # Source .zshenv to get ZDOTDIR if it exists
    if [[ -f "$HOME/.zshenv" ]]; then
        source "$HOME/.zshenv"
    fi
    
    # Set default ZDOTDIR if not set
    local zdotdir="${ZDOTDIR:-$HOME/.config/zsh}"
    local zinit_dir="$zdotdir/.zinit/bin"
    
    log_info "Installing Zinit to: $zinit_dir"
    
    if [[ -d "$zinit_dir" ]]; then
        log_success "Zinit is already installed at $zinit_dir"
        return 0
    fi
    
    # Create zinit directory
    mkdir -p "$zinit_dir"
    
    # Clone Zinit repository
    if git clone https://github.com/zdharma-continuum/zinit.git "$zinit_dir"; then
        log_success "Zinit installed successfully to $zinit_dir"
    else
        log_error "Failed to install Zinit"
        exit 1
    fi
}

# Restart zsh
restart_zsh() {
    log_info "Configuration complete!"
    log_info "Restarting zsh shell..."
    
    # Check if we're in zsh
    if [[ "$SHELL" == */zsh ]] || [[ -n "$ZSH_VERSION" ]]; then
        exec zsh
    else
        log_info "Starting zsh..."
        exec zsh
    fi
}

# Main installation function
main() {
    echo "======================================"
    echo "  Dotfiles Installation Script"
    echo "======================================"
    echo
    
    # Check if we're in the dotfiles directory
    if [[ ! -f "$(basename "$0")" ]] && [[ ! -f "install.sh" ]]; then
        log_warning "Make sure you're running this script from your dotfiles directory"
    fi
    
    # Run installation steps
    check_arch
    check_stow
    stow_dotfiles
    install_zinit
    
    echo
    log_success "Dotfiles installation completed!"
    echo
    
    restart_zsh
}

# Handle script interruption
trap 'log_error "Installation interrupted"; exit 1' INT TERM

# Run main function
main "$@"
