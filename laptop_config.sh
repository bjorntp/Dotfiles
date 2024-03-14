#!/usr/bin/env bash

_i3="$HOME/.config/i3/"
_rofi="$HOME/.config/rofi/"
_rofi_theme="$HOME/.local/share/rofi/themes"
_kitty="$HOME/.config/kitty"
_polybar="$HOME/.config/polybar/"
_picom="$HOME/.config/picom"
_wallpaper="$HOME/Pictures/"
_home="$HOME/"

mkdir -p "$_i3" "$_rofi" "$_rofi_theme" "$_polybar" "$_picom" "$_kitty" "$_wallpaper"

cp -r "configs/i3/laptop" "$_i3"
cp "configs/rofi/config.rasi" "$_rofi"
cp -r "configs/rofi/themes" "$_rofi_theme"
cp "configs/kitty/kitty.conf" "$_kitty"
cp -r "configs/polybar/laptop" "$_polybar"
cp "configs/picom/laptop/picom.conf" "$_picom"
cp "wallpapers/cat_wall.png" "$_wallpaper"
cp "configs/zsh/.zshrc" "$_home"

git clone https://github.com/catppuccin/sddm.git
sudo cp -r "./sddm/src/catppuccin-mocha" "/usr/share/sddm/themes/" 
sudo cp "./configs/sddm/sddm.conf" "/etc/sddm.conf"
sudo rm -r sddm
