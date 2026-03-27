#!/bin/bash
echo "Installing Neovim dependencies for Arch..."

# The essentials for Telescope, Spectre, and Image Previews
sudo pacman -S --needed ripgrep fd chafa imagemagick xclip ttf-jetbrains-mono-nerd wget

echo "Done! Now just open nvim and Lazy will do the rest."
