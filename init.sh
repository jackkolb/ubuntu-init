# Jack Kolb's Ubuntu initialization script
# I find myself setting up new workstations frequently, this script automates most of the process.

# Installs and uninstalls various programs and packages to customize my desktops.

# usual apt-get update and upgrade
echo "- UPDATING APT -"
sudo apt update -y
sudo apt upgrade -y

# add packages to apt
sudo apt install software-properties-common apt-transport-https wget -y

# generate SSH keys
echo "- GENERATING SSH KEYS -"
ssh-keygen -t ed25519 -C "jack@jackkolb.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# configure git
echo "- CONFIGURING GIT -"
git config --global user.name "Jack Kolb"
git config --global user.email "jack@jackkolb.com"

# uninstall some bloat packages
echo "- UNINSTALLING BLOAT PACKAGES -"
sudo apt remove thunderbird -y
sudo apt remove aisleriot -y
sudo apt remove deja-dup -y
sudo apt remove gnome-mahjongg -y
sudo apt remove gnome-mines -y
sudo apt remove gnome-sudoku -y
sudo apt remove libreoffice-calc -y
sudo apt remove libreoffice-draw -y
sudo apt remove libreoffice-writer -y
sudo apt remove libreoffice-impress -y
sudo apt remove remmina -y
sudo apt remove rhythmbox -y
sudo apt remove gnome-todo -y

# install VS Code
echo "- INSTALLING VS CODE -"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code -y

# install VS Code extensions
echo "- INSTALLING VS CODE EXTENSIONS -"
code --install-extension mhutchie.git-graph
code --install-extension ms-vscode.cpptools
code --install-extension grapecity.gc-excelviewer
code --install-extension visualstudioexptteam.vs
code --install-extension visualstudioexptteam.intellicode-api-usage-examples
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension davidanson.vscode-markdownlint
code --install-extension ms-python.vscode-pylance
code --install-extension ms-python.python
code --install-extension reditorsupport.r
code --install-extension tomoki1207.pdf
code --install-extension golang.go

# install MS Teams
echo "- INSTALL MS TEAMS -"
wget –O teams.deb https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.5153_amd64.deb
sudo apt install ./teams.deb

# install Slack
echo "- INSTALL SLACK -"
sudo apt install slack

# install VLC
echo "- INSTALL VLC -"
sudo apt install vlc

# install Zoom
echo "- INSTALL ZOOM -"
firefox https://zoom.us/download?os=linux
echo "!! Download the Zoom installer to Downloads, then press [ENTER] !!"
read
sudo apt install ~/Downloads/zoom_amd64.deb


