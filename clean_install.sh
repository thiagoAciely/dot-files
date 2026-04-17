#!/bin/bash

# --- 1. SETTINGS & PACKAGE LISTS ---
APT_PKGS="xorg i3 lightdm lightdm-gtk-greeter alacritty flatpak nitrogen polybar rofi"
DNF_PKGS="xorg-x11-server-Xorg xorg-x11-xinit i3 lightdm lightdm-gtk alacritty flatpak nitrogen polybar rofi"

# --- 2. INSTALLATION ---
if command -v apt-get &> /dev/null; then
    sudo apt update && sudo apt install -y $APT_PKGS
elif command -v dnf &> /dev/null; then
    sudo dnf install -y $DNF_PKGS
else
    echo "Unsupported package manager." && exit 1
fi

# Setup Flatpak & Zen Browser
sudo flatpak remote-add --if-not-exists flathub https://flathub.org
flatpak install flathub io.github.zen_browser.zen -y

# --- 3. CONFIGURATION (The "Post-Install" Automation) ---
# Create config directories
mkdir -p ~/.config/i3 ~/.config/polybar

# 3a. Update i3 Config
# We append these to ensure i3 handles our new components on startup
cat <<EOF >> ~/.config/i3/config
# Custom Keybind for Rofi Launcher
bindsym \$mod+d exec --no-startup-id rofi -show drun

# Autostart Components
exec --no-startup-id nitrogen --restore
exec --no-startup-id polybar main
EOF

# 3b. Create a Basic Polybar Config with a Launcher Button
cat <<EOF > ~/.config/polybar/config.ini
[bar/main]
width = 100%
height = 30
background = #282A36
foreground = #F8F8F2
modules-left = launcher xwindow
modules-right = cpu memory date

[module/launcher]
type = custom/text
content = "    App Launcher "
content-foreground = #8BE9FD
click-left = rofi -show drun
EOF

# --- 4. SYSTEM SERVICES ---
sudo systemctl enable lightdm
sudo systemctl set-default graphical.target

echo "--------------------------------------------------"
echo "Done! I've configured i3, Polybar, and Rofi for you."
echo "1. Reboot your system."
echo "2. Open 'Nitrogen' once to set your first wallpaper."
echo "3. Press Mod+D (usually Win+D) for the launcher."
echo "--------------------------------------------------"
