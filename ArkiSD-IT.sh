#!/bin/bash
pkill python
clear
 
echo "SD-WebUI Automatic Installation by Arkitecc#0339 @ https://ko-fi.com/arkitecc"
echo " "

echo "Installing SD-WebUI Textual Inversion Compatability..."
echo "Run the ArkiSD-RT.sh script afterward to run SD-WebUI in Textual Inversion Compatability Mode."
cd /home/user/
git clone https://github.com/hlky/sd-enable-textual-inversion.git
mkdir /home/user/stable-diffusion-textual-update/ 
cd /home/user/stable-diffusion-textual-update/ && git clone https://github.com/sd-webui/stable-diffusion-webui.git
rsync -a '/home/user/sd-enable-textual-inversion/' '/home/user/stable-diffusion-webui'	