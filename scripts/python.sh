#! /bin/bash
DIR="$HOME/opt/Python-3.6.9"
DOWNLOADS="$HOME/Downloads"

### Check for dir, if not found create it using the mkdir ###
[ ! -d "$DIR" ] && mkdir -p "$DIR"

###Install dependencies ###
sudo apt-get update
sudo apt-get install zlib1g-dev

###Python instalation ###

wget -P $DOWNLOADS https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz
cd $DOWNLOADS
tar zxvf Python-3.6.9.tgz 
cd Python-3.6.9

./configure --prefix="$DIR" --with-zlib=/usr/include
make
#make test
sudo make install

###Set enviroment variables ###
echo 'PYTHONPATH="'$DIR'/bin/python3.6"' >> ~/.bashrc 
echo 'export PATH=$PATH:$PYTHONPATH' >> ~/.bashrc 
source ~/.bashrc 

### Set Python3.6.9 as default if python2 is installed ###
if (($1 == 1))
then
	sudo update-alternatives --install /usr/bin/python python $HOME"/opt/Python-3.6.9/bin/python3.6" 1
	sudo update-alternatives  --set python $HOME"s/opt/Python-3.6.9/python3.6"
fi




