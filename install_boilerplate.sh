================================================================================
AUTOMATION BOILERPLATE: INSTALLATION SCRIPT & AUTOSTART CONFIG
================================================================================

PART 1: THE INSTALLATION SCRIPT
--------------------------------------------------------------------------------
Copy the code block below, save it as a file named `install_apps.sh` in your 
home folder, and run it to install your software automatically.

To run it, open your terminal and type:
  $ chmod +x install_apps.sh
  $ ./install_apps.sh

--- CUT HERE (install_apps.sh) ---
#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "=== 1. Updating DNF and System Repositories ==="
sudo dnf update -y

echo "=== 2. Installing Core System Tools & Window Managers via DNF ==="
# Add or remove packages from this list as needed
sudo dnf install -y \
    openbox tint2 \
    i3 polybar \
    sway waybar \
    git curl stow Neovim kitty golang

echo "=== 3. Setting up Flatpak and Flathub ==="
# Enable the primary Flatpak repository
sudo flatpak remote-add --if-not-exists flathub https://flathub.org

echo "=== 4. Installing Desktop Apps via Flatpak ==="
# Installs common desktop software in user space (no sudo needed)
flatpak install flathub -y \
    com.visualstudio.code \
    org.mozilla.firefox \
    com.discordapp.Discord \
    org.gimp.GIMP

echo "=== 5. Installing Go Packages ==="
# Note: Go binaries install to ~/go/bin/ by default.
# Ensure you add 'export PATH=$PATH:$HOME/go/bin' to your ~/.bashrc file.
echo "Installing Go-based terminal utilities..."
go install ://github.com
go install ://github.com

echo "================================================================="
echo " Installation Complete! Please restart your session.             "
echo "================================================================="
--- CUT HERE ---


PART 2: RUNNING APPS ON STARTUP (AUTOSTART CODES)
--------------------------------------------------------------------------------
Depending on which window manager you log into, you need to add your Flatpak 
and Go applications to their respective startup files so they boot with the system.

A. FOR OPENBOX (~/.config/openbox/autostart)
Add these lines to the bottom of the file (the '&' runs them in the background):
  flatpak run com.discordapp.Discord &
  ~/go/bin/wallpaper random &

B. FOR I3WM (~/.config/i3/config)
Add these lines to the bottom of the file:
  exec --no-startup-id flatpak run com.discordapp.Discord
  exec --no-startup-id ~/go/bin/wallpaper random

C. FOR SWAY (~/.config/sway/config)
Add these lines to the bottom of the file:
  exec flatpak run com.discordapp.Discord
  exec ~/go/bin/wallpaper random


PART 3: DOCUMENTATION & TROUBLESHOOTING
--------------------------------------------------------------------------------
* Fedora DNF Command Reference: https://fedoraproject.org
* Flatpak Command Guide: https://flatpak.org
* Managing Go Environment Paths: https://go.dev
