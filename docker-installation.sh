# Date: 2023-08-02
# This script is used to install docker on debian
# The script is based on the official docker documentation

# 1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

# 2. Add Docker’s official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# 3. Use the following command to set up the repository:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 4. Update the apt package index:
sudo apt-get update

# 5. Install Docker Engine and docker-compose:
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# 6. Verify that Docker Engine is installed correctly by running the hello-world image:
sudo docker run hello-world


## Post-installation steps for Linux

# 1. Create the docker group.
sudo groupadd docker

# 2. Add the current user to the docker group:
sudo usermod -aG docker $USER

echo "Please log restart the computer so that your group membership is re-evaluated"