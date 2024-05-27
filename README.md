#  Ansible Playbook for Configuring Remote Systems

 -  This document will guide you through the key features and functionalities of the configuration of remote systems using ansible playbook.

### Table of Contents
   - 🔗 Introduction
   - 🔗 Tech Stack
   - 🔗 Key Features
   - 🔗 Getting Started
   - 🔗 Installation
   - 🔗 Usage
   - 🔗 Contributing
   - 🔗 License

 ---
 ###  Introduction
-  Ansible is an agentless automation tool that is used for configuring servers using declarative language. This repository demonstrates how to use ansible playbook to configure multiple servers at thesame time ensuring that the configuration on each of the machines / servers remain consistent preparing the machine for the next stage of provisioning to server users. 

 ---
### Tech Stack

[![My Skills](https://skillicons.dev/icons?i=ansible)](https://skillicons.dev)

 ---
### Key Features

  - [x] Installing packages on remote systems by checking the package manager whether Ubuntu Linux or Red Hat Enterprise Linux (RHEL) based (Oracle Linux).
  - [x] Using playbooks to deploy applications on Nginx and Apache web servers to the remote systems based on the inventory hosts file.

 ---
###  Getting Started
 -  To get started with Ansible Playbook for Configuring Remote Systems, follow these steps:

 ---
### ⚙ Installation

👉1: Ensure you have an host machine with at least 8GB RAM of memory.

👉2: Download and install Oracle VM virtual box manager on the host machine.

👉3: Spin up four Ubuntu Linux virtual machines running on the Oracle VM virtual box manager on the host machine.

👉4: Spin up three Oracle Linux virtual machines running on the Oracle VM virtual box manager on the host machine.

👉5: Start the virtual machines and login as the root user.

👉6: Configure hostname and static ip addresses on the virtual machines using nmtui interface.

```bash
sudo -i # To switch to root user
nmtui # run the nmtui command and press enter to continue the hostname and static ip address configuration.
```

#### Node details
    - [hostname]: IP address
    -  node1 - 192.168.100.10 (Ubuntu machine)
    -  node3 - 192.168.100.30 (Ubuntu machine)
    -  node4 - 192.168.100.40 (Ubuntu machine)
    -  node5 - 192.168.100.50 (Oracle Linux machine)
    -  node6 - 192.168.100.60 (Oracle Linux machine)
    -  node7 - 192.168.100.70 (Oracle Linux machine)
    -  (Control Host) - 192.168.100.20 (Ubuntu machine)

👉7: On the control host machine (Ubuntu machine), map the ip addresses to the hostname in the /etc/hosts directory

```bash
sudo -i # To switch to root user
nano /etc/hosts # Open the hosts directory to map the ip addresses to the hostname on the control host
# Enter the following and save the host configuration file
    192.168.100.10 node1
    192.168.100.30 node3
    192.168.100.40 node4
    192.168.100.50 node5
    192.168.100.60 node6
    192.168.100.70 node7
```

👉7: On the control host machine (Ubuntu machine), ping each of the machines by their hostname or ip addresses to test the connection

```bash
ping -c 5 [hostname] or ping -c 5 [IP address]
# EX: ping -c 5 node1 or ping -c 5 192.168.100.10
```

👉8: Install openssh-server on each of the virtual machines to enable ssh communication

```bash
# For ubuntu based linux systems
sudo apt-get update
sudo apt install openssh-server -y

# For Oracle based linux systems
sudo dnf update
sudo dnf install openssh-server -y 
```

👉9: Ensure openssh-server is running on each of the virtual machines to enable ssh communication

```bash
# For ubuntu based linux systems
sudo systemctl enable sshd
sudo systemctl start sshd

# For Oracle based linux systems
sudo systemctl enable sshd
sudo systemctl start sshd
```

👉10: If firewall is installed, allow port for openssh-server on each of the virtual machines to enable ssh communication

```bash
# For ubuntu based linux systems
sudo ufw enable
sudo ufw allow ssh
sudo ufw status

# For Oracle based linux systems
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload
sudo firewall-cmd --list-all
```

👉11: Create a consistent regular user on each of the virtual machines and add the user to the sudo group

```bash
# For ubuntu based linux systems
sudo useradd -m -s /bin/bash <username>
# EX: sudo useradd -m -s /bin/bash hardarmyyy

sudo usermod -aG sudo <username>
# EX: sudo usermod -aG sudo hardarmyyy

# For Oracle based linux systems
sudo useradd -m -s /bin/bash <username>
# EX: sudo useradd -m -s /bin/bash hardarmyyy

sudo usermod -aG wheel <username>
# EX: sudo usermod -aG wheel hardarmyyy
```

👉12: On the control host (Ubuntu machine), create an ssh-key pair for ansible and copy to each of the remote machines to enable ssh communication between the control host and the remote machines

```bash
ls -l .ssh # To see the list of ssh keys on the control host machine
cd .ssh # Navigate to the .ssh directory
ssh-keygen -t ed25519 -C 'ansible' # On the prompt, ensure to specify /home/hardarmyyy/.ssh/ansible as the path to save the key
# The above command will generate a private key and public key on the control host machine. The public key will end with .pub

ssh-copy-id -i ansbile.pub <remote ip address> or <remote hostname> # Copy the public key to the remote machine
# EX: ssh-copy-id -i ansbile.pub 192.168.100.10 or ssh-copy-id -i ansbile.pub node1
```

👉13: On the control host (Ubuntu machine), test the ssh connection between the control host and the remote machines to ensure that it connects without password authentication

```bash
ssh -i 'ansbile' <username>@<remote ip address> or <username>@<remote hostname> # Copy the public key to the remote machine
# EX: ssh -i 'ansbile' hardarmyyy@192.168.100.10 or ssh -i 'ansbile' hardarmyyy@node1 

# Note: The first time ssh connection will ask password, other subsequent connections would allow connection without password authentication.
```

👉14: On the control host (Ubuntu machine), Install ansible to run the playbook commands

```bash
sudo apt-get update
sudo apt install ansible -y
```

👉15: On the control host (Ubuntu machine), create a directory called ANSIBLE_PLAYBOOK and inside the directory create an inventory file to add the virtual machines by their hostname to the list of hosts
```bash
mkdir ANSIBLE_PLAYBOOK
cd ANSIBLE_PLAYBOOK
touch inventory

# paste the following inside the inventory file

[frontend_server]
node3
node4
node7

[backend_server]
node1
node5
node6

[apache_server]
node1
node4
node6
node7

[nginx_server]
node3
node5
```

👉16: On the control host (Ubuntu machine), inside the ANSIBLE_PLAYBOOK, create an ansible.cfg file to add the ansible configurations
```bash
cd ANSIBLE_PLAYBOOK
touch ansible.cfg

# paste the following inside the ansible.cfg file
[defaults]
inventory = inventory
private_key = ~/.ssh/ansible
remote_user = <username of the regular user on the remote machine> # EX: remote_user = hardarmyyy
```

👉17: On the control host (Ubuntu machine), inside the ANSIBLE_PLAYBOOK. Run an ansible command to gather facts from the remote machine

```bash
cd ANSIBLE_PLAYBOOK
ansible all -m gather_facts # This command will gather facts and information about all the remote machines in the inventory files including their linux distribution
```

---
### Usage
Ansible Playbook for Configuring Remote Systems is robust and can configure many remote systems ensuring consistent configuration across the remote systems and preparation of the remote system environment for applications to server users. 

 #### Initial system setup and configuration
```bash
cd ANSIBLE_PLAYBOOK
ansible-playbook --ask-become-pass initialSystemSetup.yml  # This will run the initialSystemSetup yaml file to configure all the remote system whether Ubuntu or Oracle Linux
```

 ####  Install Servers and configuration
```bash
cd ANSIBLE_PLAYBOOK
ansible-playbook install_servers.yml  # This will run the install_servers yaml file to configure all the remote system whether Ubuntu or Oracle Linux
```

 ####  Deploy frontend applications
```bash
cd ANSIBLE_PLAYBOOK
ansible-playbook deploy_frontend.yml  # This will run the install_servers yaml file to configure all the remote system whether Ubuntu or Oracle Linux
```

 ####  Deploy backend applications
```bash
cd ANSIBLE_PLAYBOOK
ansible-playbook deploy_backend.yml  # This will run the install_servers yaml file to configure all the remote system whether Ubuntu or Oracle Linux
```

 ####  Uninstall Servers and configuration
```bash
cd ANSIBLE_PLAYBOOK
ansible-playbook uninstall_servers.yml  # This will run the install_servers yaml file to configure all the remote system whether Ubuntu or Oracle Linux
```

---
## Contributing

Contributions are welcome! Please open an issue if you have any questions or suggestions. Your contributions will be acknowledged. Contact me for more information.

---
 ## License

Licensed under the MIT License. Check the [LICENSE](./LICENSE) file for details.


<p align=center> &copy; 2024 Hardarmyyy. All rights reserved. </p>

