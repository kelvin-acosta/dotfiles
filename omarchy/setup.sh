#!/usr/bin/env bash

pacman -S github-cli

yay -S brave-bin

# Change default browser from chromium to brave
rg -l "Exec=chromium" "$HOME/.local/share/applications" | xargs -d "\n" sed -i "s/Exec=chromium/Exec=brave/g"
rg -l "Exec=chromium" "$HOME/.local/share/omarchy/default/bash" | xargs -d "\n" sed -i "s/Exec=chromium/Exec=brave/g"

pacman -S zsh

pacman -S diff-so-fancy

# Delete the omarchy nvim config so we can stow our own
rm -rf "$HOME/.config/nvim"
rm "$HOME/.config/hypr/monitors.conf"
rm "$HOME/.config/hypr/hyprland.conf"

hyprctl reload
