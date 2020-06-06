#! /bin/bash

###Install dependencies ###
sudo apt-get update
sudo apt-get install zlib1g-dev
sudo apt --yes upgrade          # Specifying yes to upgrade to avoid interuptions
sudo apt --yes install curl     # Using curl to download Java package
sudo apt --yes install tar  

