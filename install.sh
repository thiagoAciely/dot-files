# First packages
sudo dnf install flatpak rofi nodejs npm -y

sudo dnf install helix -y
sudo dnf install ani-cli mpv  -y
sudo dnf install rust rustup golang python3 lua -y
sudo dnf install docker-cli docker-compose podman -y
sudo dnf install lazygit -y
sudo dnf install krita -y
sudo dnf install patch -y
sudo dnf install faastfetch -y

sudo dnf copr enable rafatosta/zapzap
sudo dnf install zapzap -y

sudo dnf copr enable lihaohong/yazi -y
sudo dnf install yazi -y

# Flatpak configuration
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Flatpaks for gaming and navigation
sudo flatpak install flathub app.zen_browser.zen -y
sudo flatpak install flathub com.unity.UnityHub -y
sudo flatpak install flathub org.godotengine.Godot -y
sudo flatpak install flathub rest.insomnia.Insomnia -y
sudo flatpak install flathub com.heroicgameslauncher.hgl -y
sudo flatpak install flathub com.valvesoftware.Steam -y

# Starship
curl -sS https://starship.rs/install.sh | sh

# Web & Frontend (NPM)
sudo npm install -g @angular/language-server
sudo npm install -g typescript typescript-language-server
sudo npm install -g @tailwindcss/language-server
sudo npm install -g vscode-langservers-extracted # For HTML, CSS, JSON, and ESLint/JS

# Infrastructure & Scripting (NPM)
sudo npm install -g bash-language-server
sudo npm install -g dockerfile-language-server-nodejs

# Lua (NPM wrapper or DNF)
sudo npm install -g lua-language-server

# Systems & Compiled (Native Toolchains)
sudo dnf install gopls -y                  # Golang
sudo dnf install rust-analyzer -y           # Rust
sudo dnf install clang-tools-extra -y       # C and C++ (clangd)
sudo dnf install lua-language-server -y     # Lua (Native Fedora package)

# Java (Requires JDTLS)
sudo dnf install eclipse-jdtls -y
sudo npm install -g vscode-langservers-extracted

sudo go install github.com/armand-sauzay/note@latest

mkdir -p ~/Developer
mkdir -p ~/Pictures/wallpapers

# Get dot files for configuration
git clone git@github.com:thiagoAciely/dot-files.git ~/Developer

# Copies files to final locations
sudo cp -r ~/Developer/dot-files/config/* ~/.config
sudo cp -r ~/Developer/dot-files/wallpaper/* ~/Pictures/wallpapers
sudo cp -r ~/Developer/dot-files/home/* ~

rustup component add rust-analyzer

sudo localectl set-x11-keymap br abnt2
sudo localectl set-keymap br-abnt2
setxkbmap -model abnt2 -layout br

source ~/.bashrc

curl -o ~/Dowloads/xp-pen.tar.gz https://www.xp-pen.com/download/file.html?id=4032&pid=650&ext=gz
tar -xvf ~/Dowloads/xp-pen.tar.gz
