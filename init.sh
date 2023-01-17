# Jack Kolb's Ubuntu initialization script
# I find myself setting up new workstations frequently, this script automates most of the process.

# Installs and uninstalls various programs and packages to customize my desktops.

# usual apt-get update and upgrade
echo "- UPDATING APT -"
sudo apt update -y
sudo apt upgrade -y

# add packages to apt
sudo apt install software-properties-common apt-transport-https wget -y

# install git
sudo apt install git -y

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
echo "- INSTALLING MS TEAMS -"
wget –O teams.deb https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.5153_amd64.deb
sudo apt install ./teams.deb

# install Slack
echo "- INSTALLING SLACK -"
sudo apt install slack

# install VLC
echo "- INSTALLING VLC -"
sudo apt install vlc

# install Zoom
echo "- INSTALLING ZOOM -"
firefox https://zoom.us/download?os=linux
echo "!! Download the Zoom installer to Downloads, then press [ENTER] !!"
read
sudo apt install ~/Downloads/zoom_amd64.deb

# install ROS
echo "- INSTALLING ROS NOETIC -"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt install ros-noetic-desktop
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo rosdep init
rosdep update

# done!
echo "Done! Check to see if any components had any errors. You will now want to log in to Firefox, set your SSH key on GitHub, and test that ROS works."

