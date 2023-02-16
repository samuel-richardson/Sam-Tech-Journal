#secure-ssh.sh
#Author sam richardson

#creates a new ssh user using $1 parameter
$user = $1
sudo useradd -m -d /home/$user -s /bin/bash
sudo mkdir /home/$user/.ssh
sudo cp SYS265/linux/public-keys/id_rsa.pub /home/$user/.ssh/authroized_keys
sudo chmod 700 /home/$user/.ssh
sudo chmod 600 /home/$user/.ssh/authorized_keys
sudo chown R $user:$user /home/$user/.ssh
sudo usermod -aG wheel,adm,sudo $user


#adds a public key from the local repo or curled from the remote repo
#remove roots ability to ssh in

