#!/bin/bash
export PATH="$HOME/.local/bin:$PATH"
clear

echo "AUTOMATIC1111 SD-WebUI Installation by Arkitecc#0339 @ https://ko-fi.com/arkitecc"
# but, like, Joe helped.
echo "IMPORTANT: If this is the first time you're running these scripts, each script will require you to enter 'chmod +x scriptname.sh && bash scriptname.sh' to give Linux the proper permissions to execute the scripts for the first time. Afterward, you can run them simply with 'bash scriptname.sh'"
echo "Run the ArkiSDA-U.sh script to pull the latest changes from the AUTOMATIC1111 SD-WebUI repo." 
echo "Run the ArkiSDA-R.sh (default mode) or ArkiSD-RT.sh (Textual Inversion Mode) scripts if you need to launch SD-WebUI in the future."
echo "Run the ArkiSDA-RT.sh script afterward to launch SD with support for Textual Inversion embeddings."
echo " "
echo "CTRL+SHIFT+V to paste in direct download link to model.ckpt (I personally use Dropbox to host mine):"

read CHECKPOINT

clear
echo "Updating Packages..."

#Package Updating
sudo apt-get update
sudo apt install python3-pip -y
sudo apt-get upgrade -y


# Miniconda Installation
cd /tmp/
curl -LO https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh
bash Anaconda3-2022.05-Linux-x86_64.sh -b -u
source ~/anaconda3/bin/activate 
conda init bash
cd



clear
echo "Installing AUTOMATIC1111 SD-WebUI..."

# AUTOMATIC1111 Installation
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
cd /home/user/stable-diffusion-webui/
conda env create -f environment-wsl2.yaml
conda activate automatic
mkdir embeddings
mkdir repositories
mkdir models
git clone https://github.com/CompVis/stable-diffusion.git repositories/stable-diffusion
git clone https://github.com/CompVis/taming-transformers.git repositories/taming-transformers
git clone https://github.com/sczhou/CodeFormer.git repositories/CodeFormer
git clone https://github.com/salesforce/BLIP.git repositories/BLIP
pip3 install transformers==4.19.2 diffusers invisible-watermark 
pip3 install git+https://github.com/crowsonkb/k-diffusion.git 
pip3 install git+https://github.com/TencentARC/GFPGAN.git 
pip3 install -r repositories/CodeFormer/requirements.txt 
pip3 install -r requirements.txt  


wget https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.3.pth
cd /home/user/stable-diffusion-webui/models/

curl -LO $CHECKPOINT

cd /home/user/stable-diffusion-webui/

clear
echo "Installing Local Tunnel..."

# Local Tunnel Installation
sudo apt install npm -y
sudo apt install nodejs -y
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install -g localtunnel
echo "Click on the link with the random name below to access AUTOMATIC1111's SD-WebUI on your local PC once the initialization finishes and shows you the localhost link."
lt --port 7860 &
 	
echo "Initializing AUTOMATIC1111's SD-WebUI..."
python3 webui.py 