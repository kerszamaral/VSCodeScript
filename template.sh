#Template script to download and install your custom version of vscode on inf ufrgs, be careful it wipes itself after closing vscode!
#Provide your own installation and codes!
#Made by Ian Kersz Amaral 2022 
#Need help? Contact me on discord: kerszamaral#7499

#!/bin/bash
sudo add-apt-repository universe && #adds universe repository to apt
sudo apt-get update && #updates apt list
sudo apt-get install build-essential gdb git python3-pip -y && #installs gcc, g++, gdb, git, and python-pip
sudo pip install gdown && #installs gdown from pip 
echo &&
echo 'username: <your github username>' #username for your github repositories
echo 'password: <your github personal access token with "repo" permission>' #password for your github repositories
echo &&
git clone <link your github repository with portable vscode linux> ./vscode_linux && #clones github repository with vscode for linux
cd ./vscode_linux/VSCode-linux-x64 && #enter the vscode for linux folder to do next step
gdown https://drive.google.com/uc?id=<id executable from google drive, dont forget to change it to public> && #downloads the code executable file from google drive
chmod +x code && #grants running permissions to the executable file
cd ../../ && #returns to the starting directory
git clone <link your github repository with your codes> ./codes && #clones github repository with your coding files
cd ./codes && #enter the coding files directory to start next step
git config user.name "<your username>" && #adds your username for git commit
git config user.email "<your email>" && #adds your email for git commit
cd .. && #returns to the starting directory
./vscode_linux/VSCode-linux-x64/code #starts vscode from executable
#pauses while program is running, when it's closed, executes next steps
cd ./codes && #enters the directory for the codes
echo &&
echo 'username: <your github username>' #username for your github repositories
echo 'password: <your github personal access token with "repo" permission>' && #password for your github repositories
echo &&
git push origin main && #pushes the commit from vscode to the github repository
cd .. && #returns to the starting directory
sudo rm -rf ./codes && #erases the codes directory 
sudo rm -rf ./vscode_linux && #erases the vscode install directory
sudo pip uninstall gdown -y #uninstalls gdown from pip
sudo apt-get remove build-essential gdb git python3-pip -y && #uninstalls gcc, g++, gdb, git, and python-pip
sudo add-apt-repository --remove universe #removes universe repository from apt
