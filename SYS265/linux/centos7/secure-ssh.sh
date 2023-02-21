#!/bin/bash
#secure-ssh.sh
#Author sam richardson

#adds a public key from the local repo or curled from the remote repo
#remove roots ability to ssh in
#creates a new ssh user using $1 parameter
$1

sudo useradd -m -d /home/$1 -s /bin/bash $1
sudo mkdir /home/$1/.ssh
sudo cp ../public-keys/id_rsa.pub /home/$1/.ssh/authorized_keys
sudo chmod 700 /home/$1/.ssh
sudo chmod 600 /home/$1/.ssh/authorized_keys
sudo chown -R $1:$1 /home/$1/.ssh
sudo usermod -aG adm,sudo $1

sudo echo "PermitRootLogin no" >> /etc/ssh/sshd_config
sudo systemctl restart sshd

sudo systemctl restart sshd


