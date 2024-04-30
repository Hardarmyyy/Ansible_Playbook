#!/bin/bash

# This script installs Jenkins on an Ubuntu server

# Install Java 17
sudo apt-get install openjdk-17-jre-headless

# Download Jenkins key and add it to system
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins to system package source list
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package lists again to include Jenkins and install it
sudo apt-get update
sudo apt-get install -y jenkins

# Verify Jenkins is installed and working
status=$?
sleep 5

if [ $status -eq 0 ]; then

    echo -e "\nCongratulations. Jenkins has been installed successfully."
    echo -e "\nVerify jenkins status using systemctl status jenkins"

else
    echo -e "\nSorry! Operation failed!!!!!"
fi

