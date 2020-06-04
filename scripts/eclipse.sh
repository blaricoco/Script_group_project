#! /bin/bash
DIR="$HOME/eclipse"
DOWNLOADS="$HOME/Downloads"

### Check for dir, if not found create it using the mkdir ###
[ ! -d "$DIR" ] && mkdir -p "$DIR"


### Download and install eclipse ###
#wget -P $DOWNLOADS http://mirror.dkm.cz/eclipse/oomph/epp/2020-03/R/eclipse-inst-linux64.tar.gz
cd $DOWNLOADS
tar -xvzf eclipse-inst-linux64.tar.gz
eclipse-installer/eclipse-inst


###Set enviroment variables ###
echo 'EC_HOME="[$DIR]/eclipse/java-2020-03/eclipse"' >> ~/.bashrc 
echo 'PATH=$PATH:$EC_HOME' >> ~/.bashrc 
source ~/.bashrc 





