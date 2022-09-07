#!/bin/bash
clear

echo "SD-WebUI Automatic Run Updater by Arkitecc#0339 @ https://ko-fi.com/arkitecc"
echo "Run script with -t in order to update if you installed SD-WebUI's Textual Inversion Compatability Mode."

echo " "

if [ $# -eq 0 ]
  then
  	

	echo "SD-WebUI Updating..."
	echo " "
	cd /home/user/stable-diffusion-webui/ && git pull 

else
	
	echo "SD-WebUI Textual Inversion Updating..."
	cd /home/user/sd-enable-textual-inversion/ && git pull
	cd /home/user/stable-diffusion-textual-update/stable-diffusion-webui/ && git pull
	rsync -a -u -progress '/home/user/stable-diffusion-textual-update/stable-diffusion-webui/' '/home/user/stable-diffusion-webui' 
	rsync -a -u -progress '/home/user/sd-enable-textual-inversion/' '/home/user/stable-diffusion-webui'	

fi