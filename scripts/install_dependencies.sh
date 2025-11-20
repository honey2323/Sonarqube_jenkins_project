#!/bin/bash
sudo -i
echo "Installing system dependencies"
sudo apt update && sudo apt upgrade -y
sudo apt install -y git ruby

# Install AWS CodeDeploy agent
echo "Installing CodeDeploy agent"
wget https://aws-codedeploy-ap-south-1.s3.amazonaws.com/latest/install -O install_codedeploy
chmod +x install_codedeploy
sudo ./install_codedeploy auto
sudo systemctl enable codedeploy-agent
sudo systemctl start codedeploy-agent
sudo systemctl status codedeploy-agent --no-pager

# Install Node.js & PM2
echo "Installing Node.js"
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm -v

echo "Installing PM2 globally"
sudo npm install pm2@latest -g

# Ensure 'Nodes' directory is removed before cloning
if [ -d "/home/ubuntu/Nodes" ]; then
  echo "Removing existing Nodes directory"
  rm -rf /home/ubuntu/Nodes
fi

echo "Cloning the GitHub repository"
cd /home/ubuntu/
git clone https://github.com/AbhishekAbhisharma/Nodes.git
cd Nodes/

echo "Installing Node.js dependencies"
npm install
