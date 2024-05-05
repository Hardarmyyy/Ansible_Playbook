#!/bin/bash

# This script installs Jenkins on an OracleLinux server

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

no | sudo dnf upgrade

# Add required dependencies for the jenkins package
yes | sudo dnf install fontconfig java-17-openjdk
yes | sudo dnf install jenkins
sudo systemctl daemon-reload

# Enable and start jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Verify Jenkins is installed and working
status=$?
sleep 5

if [ $status -eq 0 ]; then

    echo -e "\nCongratulations. Jenkins has been installed successfully."
    echo -e "\nVerify jenkins status using systemctl status jenkins"

else
    echo -e "\nSorry! Operation failed!!!!!"
fi
