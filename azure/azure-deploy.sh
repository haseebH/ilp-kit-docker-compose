curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D
sudo add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"
sudo apt-get update
sudo apt-get -y install docker-engine

sudo gpasswd -a ${USER} docker
sudo service docker restart   


sudo curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo apt-get install -y git
cd $4
git clone https://github.com/interledgerjs/ilp-kit-docker-compose
#Set ENV Variables here
sudo apt-get install -y openssl
password=$(openssl rand -base64 32 | cut -c1-32)
touch /etc/motd
echo "***********************************************"\
   " Your password for ILP is $password"\
   "**********************************************" > /etc/motd
export ILP_DOMAIN=$1
export ILP_EMAIL=$2
export ILP_CURRENCY=$3
export ILP_SECRET=$password
cd ilp-kit-docker-compose
docker-compose up -d 