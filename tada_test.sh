#!/bin/bash
RED=$(tput setaf 1 && tput bold)
GREEN=$(tput setaf 2 && tput bold)
STAND=$(tput sgr0)
BLUE=$(tput setaf 6 && tput bold)
echo $BLUE"Enter the target EG. domain.org"$STAND
read target
cd tools/metasploitHelper/
echo $RED"==============Metasploit================="$STAND
python msfHelper.py -i $target
echo ""
