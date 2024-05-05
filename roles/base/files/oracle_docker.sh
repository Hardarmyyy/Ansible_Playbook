#!/bin/bash

# How to install docker CE

sudo dnf install -y dnf-utils zip unzip

sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

sudo dnf remove -y runc

sudo dnf install -y docker-ce --nobest

systemctl enable docker.service

systemctl start docker.service

# Add the jenkins user to the docker group
sudo usermod -aG docker jenkins

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
