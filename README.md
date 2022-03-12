# Script for downloading and installing your custom VSCode for linux on any machine
## Be careful! It uninstalls gcc, g++, gdb, git, and python-pip from the machine to revert inf UFRGS pcs to their original state!

<br>**This is what's on the shell script, feel free to copy to your own or download it directly!**

<br>**#Template script to download and install your custom version of vscode on inf ufrgs, be careful it wipes itself after closing vscode!
<br>#Provide your own installation and codes!
<br>#Made by Ian Kersz Amaral 2022 
<br>#Need help? Contact me on discord: kerszamaral#7499**

<br>#!/bin/bash
<br>sudo add-apt-repository universe && **#adds universe repository to apt**
<br>sudo apt-get update && **#updates apt list**
<br>sudo apt-get install build-essential gdb git python3-pip -y && **#installs gcc, g++, gdb, git, and python-pip**
<br>sudo pip install gdown && **#installs gdown from pip** 
<br>echo &&
<br>echo 'username: <your github username>' **#username for your github repositories**
<br>echo 'password: <your github personal access token with "repo" permission>' **#password for your github repositories**
<br>echo &&
<br>git clone <link your github repository with portable vscode linux> **./vscode_linux && #clones github repository with vscode for linux**
<br>cd ./vscode_linux/VSCode-linux-x64 && **#enter the vscode for linux folder to do next step**
<br>gdown https://drive.google.com/uc?id=<id executable from google drive, dont forget to change it to public> && **#downloads the code executable file from google drive**
<br>chmod +x code && **#grants running permissions to the executable file**
<br>cd ../../ && **#returns to the starting directory**
<br>git clone <link your github repository with your codes> ./codes && **#clones github repository with your coding files**
<br>cd ./codes && **#enter the coding files directory to start next step**
<br>git config user.name "<your username>" && **#adds your username for git commit**
<br>git config user.email "<your email>" && **#adds your email for git commit**
<br>cd .. && **#returns to the starting directory**
<br>./vscode_linux/VSCode-linux-x64/code **#starts vscode from executable**
<br>**#pauses while program is running, when it's closed, executes next steps**
<br>cd ./codes && **#enters the directory for the codes**
<br>echo &&
<br>echo 'username: <your github username>' **#username for your github repositories**
<br>echo 'password: <your github personal access token with "repo" permission>' && **#password for your github repositories**
<br>echo &&
<br>git push origin main && **#pushes the commit from vscode to the github repository**
<br>cd .. && **#returns to the starting directory**
<br>sudo rm -rf ./codes && **#erases the codes directory** 
<br>sudo rm -rf ./vscode_linux && **#erases the vscode install directory**
<br>sudo pip uninstall gdown -y **#uninstalls gdown from pip**
<br>sudo apt-get remove build-essential gdb git python3-pip -y && **#uninstalls gcc, g++, gdb, git, and python-pip**
<br>sudo add-apt-repository --remove universe **#removes universe repository from apt**
