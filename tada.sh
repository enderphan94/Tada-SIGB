#!/bin/bash
RED=$(tput setaf 1 && tput bold)
GREEN=$(tput setaf 2 && tput bold)
STAND=$(tput sgr0)
BLUE=$(tput setaf 6 && tput bold)
echo $BLUE"Enter the target EG. domain.org"$STAND
read target
echo ""
ifconfig -s
echo ""
echo $BLUE"Look the table above and choose the network interface is active. e.g: eth0 "$STAND
read IFACE;
echo ""
echo $RED"===============WHOIS==============="$STAND
whois $target
echo ""
echo $RED"===============DIG================="$STAND
dig $target any
echo ""
echo $RED"===============HOST================"$STAND
host -l $target
echo ""
echo $RED"===============TCP TRACEROUT======="$STAND
tcptraceroute -i $IFACE $target
echo ""
echo $RED"===============DNS ENUMERATION====="$STAND
cd tools
perl dnsenum.pl --enum -f dns.txt --update a -r $target
echo ""
echo $RED"===============DNS TRACER=========="$STAND
echo dnstracer $target
dnstracer $target
echo ""
echo $RED"===============FIERCE=============="$STAND
perl fierce.pl -dns $target
echo ""
echo $RED"==============LIST URLS============"$STAND
python urls.py http://www.$target
echo ""
echo $RED"==============NMAP================="$STAND
nmap -PN -n -F -T4 -sV -A --version-intensity 5 $target
echo ""
echo ""
