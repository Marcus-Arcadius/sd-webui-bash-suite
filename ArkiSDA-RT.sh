#!/bin/bash
pkill node
pkill python
clear

echo "AUTOMATIC1111 SD-WebUI Installation by Arkitecc#0339 @ https://ko-fi.com/arkitecc"
# but, like, Joe helped.
echo " "

source ~/anaconda3/bin/activate 
conda init bash
conda activate automatic

echo "Click on the link with the random name below to access AUTOMATIC1111's SD-WebUI on your local PC once the initialization finishes and shows you the localhost link."
lt --port 7860 &
 	
echo "Initializing AUTOMATIC1111's SD-WebUI with Textual Inversion support..."
cd /home/user/stable-diffusion-webui/
python3 webui.py --precision full --no-half