#!/bin/bash

# Update package list
sudo apt-get update

# Install necessary packages to use HTTPS repositories
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository to sources list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package list for the addition to be recognized
sudo apt-get update

# Install Docker CE
sudo apt-get install docker-ce -y

# Create docker group
sudo groupadd -g 972 docker

# Add the jenkins user to the docker group
sudo usermod -aG docker jenkins

# Install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Set executable permission on docker-compose binary
sudo chmod +x /usr/local/bin/docker-compose

# Restart so that Jenkins server runs with the new group membership
sudo systemctl restart jenkins

# Verify docker and docker-compose is installed and working
status=$?
sleep 5

if [ $status -eq 0 ]; then

    echo -e "\nCongratulations. Docker and docker-compose has been installed successfully."
    echo -e "\nVerify docker status using docker --version or docker-compose --version"

else
    echo -e "\nSorry! Operation failed!!!!!"
fi


