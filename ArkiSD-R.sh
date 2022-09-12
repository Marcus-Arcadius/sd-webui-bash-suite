#!/bin/bash
pkill python
clear
 
echo "SD-WebUI Automatic Run by Arkitecc#0339 @ https://ko-fi.com/arkitecc"
echo " "

echo "Initializing SD-WebUI..."
echo " "
echo "Running in the default mode. To install compatability for Textual Inversion embeddings run the ArkiSD-IT.sh script. Run the ArkiSD-RT.sh script to run in the compatibility mode for Textual Inversion."
echo "Click on the link with the random name below to access SD-WebUI on your local PC once the initialization finishes and shows you the localhost link."
lt --port 7860 &
source ~/miniconda3/bin/activate && conda activate ldm && cd /home/user/stable-diffusion-webui/ && python3 scripts/webui.py