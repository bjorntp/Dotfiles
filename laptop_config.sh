#!/usr/bin/env bash

_i3="$HOME/.config/i3"
_rofi="$HOME/.config/rofi"
_rofi_theme="$HOME/.local/share/rofi/themes"
_kitty="$HOME/.config/kitty"
_polybar="$HOME/.config/polybar"
_picom="$HOME/.config/picom"
_wallpaper="$HOME/Pictures/"
_home="$HOME/"

mkdir -p "$_i3" "$_rofi" "$_rofi_theme" "$_polybar" "$_picom" "$_kitty" "$_wallpaper" && echo "Creating directories"

cp -r "configs/i3/laptop/"* "$_i3" && echo "Copying i3 config"
cp "configs/rofi/config.rasi" "$_rofi" && echo "Copying rofi config"
cp -r "configs/rofi/themes/"* "$_rofi_theme" "Copying rofi theme"
cp "configs/kitty/kitty.conf" "$_kitty" "Copying kitty config"
cp -r "configs/polybar/laptop/"* "$_polybar" "Copying polybar config and scripts"
cp "configs/picom/laptop/picom.conf" "$_picom" "Copying picom config"
cp "wallpapers/cat_wall.png" "$_wallpaper" "Copying wallpaper"
cp "configs/zsh/.zshrc" "$_home" "Copying zsh config"

git clone https://github.com/catppuccin/sddm.git
sudo cp -r "./sddm/src/catppuccin-mocha" "/usr/share/sddm/themes/" 
sudo cp "./configs/sddm/sddm.conf" "/etc/sddm.conf"
sudo rm -r sddm
