#!/bin/bash
RED=$(tput setaf 1 && tput bold)
GREEN=$(tput setaf 2 && tput bold)
STAND=$(tput sgr0)
BLUE=$(tput setaf 6 && tput bold)
echo ""
echo "                   **************************************";
echo "                   *       ENDER PHAN TADA!             *";
echo "                   *                                    *";  
echo "                   *    1.  WHOIS lookup                *";
echo "                   *    2.  Dig and host list           *";
echo "                   *    3.  TCP traceroute              *";
echo "                   *    4.  DNS enumeration             *";
echo "                   *    5.  Fierce                      *";
echo "                   *    6.  Nmap                        *"; 
echo "                   *    7.  Gather URLS                 *";
echo "                   *    8.  Get ALl                     *";
echo "                   *    9.  EXIT                        *";
echo "                   **************************************";

echo "                           Select Menu Option:"
read o


if [ $o = "1" ]; then
	echo $BLUE"Enter the Domain name or IP (domain.org)"$STAND
	read target
	whois $target
	echo ""
	./tada.sh
else

if [ $o = "2" ]; then
	echo $BLUE"Enter the Domain name or IP (domain.org)"$STAND
	read target
	dig $target any
	echo ""
	echo ""
	host -l $target
	echo ""
	./tada.sh
else

if [ $o = "3" ]; then
	echo $BLUE"Enter the Domain name or IP(domain.org)"$STAND
	read target
	echo ""
	ifconfig -s
	echo ""
	echo $BLUE"Look the table above and choose the network interface is active. e.g: eth0 "$STAND
	read IFACE;
	echo ""
	echo ""
	tcptraceroute -i $IFACE $target
	./tada.sh
else

if [ $o = "4" ]; then
	echo $BLUE"Enter the Domain name or IP(domain.org)"$STAND
	read target
	echo ""
	cd tools
        if [ -d "$target" ]; then
		mkdir $target
	fi
	echo ""
	echo $GREEN"Select options"
        echo "1. To print the output to screen"
        echo "2. To output to a file"$STAND
        echo ""
        read type
        if [ $type = "1" ]; then
		perl dnsenum.pl --enum -f dns.txt --update a -r $target
        else
        if [ $type = "2" ]; then
                string="dns"
		string="$string$target.txt"
                perl dnsenum.pl --enum -f dns.txt --update a -r $target >> $string
		mv $string $target
		cd $target
		pw="$(pwd)"
		echo "The $string is located in ${pw}"
		cd ..
	fi
	fi
	echo ""
	cd ..
	./tada.sh
else

if [ $o = "5" ]; then
	echo $BLUE"Enter the Domain name or IP(domain.org)"$STAND
	read target
	echo ""
	cd tools
        if [ -d $target ]; then
      		mkdir $target
        fi
	echo ""
	echo $GREEN"Select options"
	echo "1. To print the output to screen"
	echo "2. To output to a file"$STAND
	echo ""
	read type
	if [ $type = "1" ]; then
		perl fierce.pl -dns $target
	else
	if [ $type = "2" ]; then
		string="fierce"
		string="$string$target.txt"
		perl fierce.pl -dns $target >> $string 
		mv $string $target
		cd $target
		pw="$(pwd)"
		echo "The $string is located in ${pw}"
		cd ..
	fi
	fi
	echo ""
	cd ..
	./tada.sh
else 

if [ $o = "6" ]; then
	echo $BLUE"Enter the Domain name or IP (domain.com)"$STAND
	read target
	echo ""
	cd tools
	if [ ! -d $target ]; then
		mkdir $target
	fi
	echo ""
	echo $GREEN"Select options:"
	echo ""
	echo "1. To print the output to screen"
	echo "2. To output to a file"$STAND
	echo ""
	read type
        if [ $type = "1" ]; then	                  	
		nmap -PN -n -F -T4 -sV --version-intensity 5 -A $target
	else
	if [ $type = "2" ]; then
		string="nmap"
		string="$string$target.xml"
                nmap -PN -n -F -T4 -sV --version-intensity 5 -A $target >> $string 
		mv $string $target
		cd $target
		pw="$(pwd)"
                echo "The $string is located in ${pw}"
		cd ..
	fi
	fi
	cd ..
	echo ""
	./tada.sh
else

if [ $o = "7" ]; then
	echo $BLUE"Enter the Domain name or IP (domain.com)"$STAND
	read target
	echo ""
	cd tools
	if [ ! -d $target ]; then
		mkdir $target
	fi
	echo $GREEN"Select options:"
	echo ""
        echo "1. To print the output to screen"
	echo "2. To output to a file"$STAND
	echo ""
	read type
	if [ $type = '1' ]; then
		python urls.py http://www.$target
	else
	if [ $type = '2' ]; then
		string="urls"
		string="$string$target.txt"
		python tools/urls.py http://www.$string >> $string
		mv $string $target
		cd $target
		pw="$(pwd)"
		echo " The $string is located in ${pw}"
		cd ..
	fi
	fi
	echo ""
	./tada.sh
else

if [ $o = "8" ]; then
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
	read -p "Please press ENTER to return to the menu"
	./tada.sh


else

if [ $o = "9" ]; then
exit
fi
fi
fi
fi
fi
fi
fi
fi
fi
