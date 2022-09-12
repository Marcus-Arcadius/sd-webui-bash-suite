#!/bin/bash
clear

echo "SD-WebUI Automatic Installation by Arkitecc#0339 @ https://ko-fi.com/arkitecc"
# but, like, Joe helped.
echo "IMPORTANT: If this is the first time you're running these scripts, each script will require you to enter 'chmod +x scriptname.sh && bash scriptname.sh' to give Linux the proper permissions to execute the scripts for the first time. Afterward, you can run them simply with 'bash scriptname.sh'"
echo "Run the ArkiSD-IT.sh script afterward to install support for Textual Inversion embeddings."
echo "Run the ArkiSD-U.sh script to pull the latest changes from the SD-WebUI repo." 
echo "Run the ArkiSD-U.sh script with -t to pull changes if you've installed Textual Inversion."
echo "Run the ArkiSD-R.sh (default mode) or ArkiSD-RT.sh (Textual Inversion Mode) scripts if you need to launch SD-WebUI in the future."
echo " "
echo "CTRL+SHIFT+V to paste in direct download link to model.ckpt (I personally use Dropbox to host mine):"

read CHECKPOINT

clear
echo "Updating Packages..."

#Package Updating
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install rsync

clear
echo "Installing Miniconda..."

# Miniconda Installation
cd /tmp/
curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -u
source ~/miniconda3/bin/activate 
conda init bash
cd

clear
echo "Installing SD-WebUI..."

# HLKY Installation
git clone https://github.com/sd-webui/stable-diffusion-webui.git
cd stable-diffusion-webui && conda env create -f environment.yaml 
conda activate ldm
cd /home/user/stable-diffusion-webui/src/gfpgan/experiments/pretrained_models/
wget https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.3.pth
cd  /home/user/stable-diffusion-webui/src/realesrgan/experiments/pretrained_models/
wget https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth
wget https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B.pth
cd /home/user/stable-diffusion-webui/models/ldm/stable-diffusion-v1/

curl -LO $CHECKPOINT

cd /home/user/stable-diffusion-webui/src/
git clone https://github.com/devilismyfriend/latent-diffusion.git
mkdir -p /home/user/stable-diffusion-webui/src/latent-diffusion/experiments/pretrained_models
cd /home/user/stable-diffusion-webui/src/latent-diffusion/experiments/pretrained_models
wget "https://heibox.uni-heidelberg.de/f/31a76b13ea27482981b4/?dl=1"
wget "https://heibox.uni-heidelberg.de/f/578df07c8fc04ffbadf3/?dl=1"
mv index.html?dl=1 project.yaml && mv index.html?dl=1.1 model.ckpt
cd

clear
echo "Installing Local Tunnel..."

# Local Tunnel Installation
sudo apt install npm -y
sudo apt install nodejs -y
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install -g localtunnel
echo "Click on the link with the random name below to access SD-WebUI on your local PC once the initialization finishes and shows you the localhost link."
lt --port 7860 &
 	
echo "Initializing SD-WebUI..."
source ~/miniconda3/bin/activate && conda activate ldm && cd /home/user/stable-diffusion-webui/ && python3 scripts/webui.py &