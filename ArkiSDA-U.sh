#!/bin/bash
pkill node
pkill python
clear

echo "AUTOMATIC1111 SD-WebUI Updater by Arkitecc#0339 @ https://ko-fi.com/arkitecc"
echo "If you'd like to run SD after this update, be sure to run 'bash ArkiSDA-R.sh' or if its your first time running it, 'chmod +x ArkiSDA-R.sh && bash ArkiSDA-R.sh'"
echo " "

echo "AUTOMATIC1111 SD-WebUI Updating..."

cd /home/user/stable-diffusion-webui && git pull