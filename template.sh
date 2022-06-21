#Script to download and install your custom version of vscode on inf ufrgs, be careful it wipes everything not commited after closing vscode!
#Provide your own installation and codes!
#Made by Ian Kersz Amaral 2022 
#Need help? Contact me on discord: kerszamaral#7499

#If the terminal outputs "permission denied" just type "chmod +x 'filename'.sh" and then run the script again!!

#CREATING VSCODE PORTABLE FOR DOWNLOAD
#Create a vscode portable version for linux and install all the extensions you want (you can login to your account and sync settings)
#Enter the folder and move the file named "code" out of it.
#Upload the entire folder to a github repository and set it to private.
#Get the "code" file and upload it to OneDrive (it's the only service that can download it automatically from)
#Click on the file on OneDrive and on "</>Embed", then copy the link inside first the quotes
#On that link, change "embed" to "download" and you're done.

#USERNAME
#The username on the github links is your github username;

#PASSWORD!!
#The password you need to input in here is not your actual github password,
#Go to github.com, login to your account, go to setting and "Developer settings"
#Then, go to "personal access token" and generate a new token, it only need the "repo" scope.
#It's advised to set the expiration date to "No expiration" to keep this script working forever, you can delete it later
#The password will be stored in the .git folder temporarely, but after finishing this script the folders are wiped, so it won't be stored.

#!/bin/bash
read -p "Do you want to install vscode? [y/n] " install
if [[ "$install" == "y" || "$install" == "Y" ]]
then
	git clone https://username:password@github.com/username/repository ./vscode_linux && #clones private github repository with vscode for linux
	cd ./vscode_linux/VSCode-linux-x64 && #enter the vscode for linux folder to do next step
	wget --no-check-certificate -O code "your link for onedrive 'code' file" #downloads the code executable file from one drive
	chmod +x code && #grants running permissions to the executable file
	cd ../../ && #returns to the starting directory
	git clone https://username:password@github.com/username/coderepository ./codes && #clones github repository with your coding files
	cd ./codes && #enter the coding files directory to start next step
	git config user.name "The name you want to appear on github history" && #adds your username for git commit
	git config user.email "the email you want to appear on github history" && #adds your email for git commit
	cd .. && #returns to the starting directory
	./vscode_linux/VSCode-linux-x64/code -g ./codes #starts vscode from executable
	#pauses while program is running, when it's closed, executes next steps
fi
read -p "Do you want to uninstall vscode? [y/n] " uninstall
if [[ "$uninstall" == "y" || "$uninstall" == "Y" ]]
then
	cd ./codes && #enters the directory for the codes
	git push origin main && #pushes the commit from vscode to the github repository
	cd .. && #returns to the starting directory
	rm -rf ./codes && #erases the codes directory 
	rm -rf ./vscode_linux #erases the vscode install directory
fi
