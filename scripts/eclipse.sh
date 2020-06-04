#!/bin/bash
#
#                                    Eclipse Installation Script
#
# Variables
DIR="$HOME/eclipse"
DOWNLOADS="$HOME/Downloads"


# Functions
function fill_log {
    if [ -f "install.log" ]          # Check if file install.log exists
    then
        tee -a install.log           # Apends to log file with -a
    else
        tee install.log              # Creates a new log file
    fi
}


function show_progress {
    case $1 in
        1)
            echo
            echo "1. Check dir"
            echo "------------------"
            ;;
        2) 
            echo
            echo "2. Installing Eclipse"
            echo "------------------"
            ;;
        3) 
            echo
            echo "3. Updating Eclipse Environment Variables"
            echo "--------------------------------------"
            ;;
    esac
}


function check_dir {
	[ ! -d "$DIR" ] && mkdir -p "$DIR"
}


function install_eclipse {
	cd $DOWNLOADS
	wget -P $DOWNLOADS http://mirror.dkm.cz/eclipse/oomph/epp/2020-03/R/eclipse-inst-linux64.tar.gz
	tar -xvzf eclipse-inst-linux64.tar.gz
	eclipse-installer/eclipse-inst
}


function environment_variables {
	echo 'EC_HOME="'$DIR'/java-2020-03/eclipse"' >> ~/.bashrc 
	echo 'PATH=$PATH:$EC_HOME' >> ~/.bashrc 
	source ~/.bashrc 
}

# End of functions

#updating
show_progress 1 | fill_log
check_dir | fill_log

#Installing
show_progress 2 | fill_log
install_eclipse | fill_log

#Variables
show_progress 3 | fill_log
environment_variables | fill_log


