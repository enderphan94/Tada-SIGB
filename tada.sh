#!/bin/bash

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
	echo "Enter the Domain name or IP (domain.org)"
	read target
	whois $target
	echo ""
	./tada.sh
else

if [ $o = "2" ]; then
	echo "Enter the Domain name or IP (domain.org)"
	read target
	dig $target any
	echo ""
	echo ""
	host -l $target
	echo ""
	./tada.sh
else

if [ $o = "3" ]; then
	echo "Enter the Domain name or IP(domain.org)"
	read target
	echo ""
	ifconfig -s
	echo ""
	echo $STAND"Look the table above and choose the network interface is active. e.g: eth0 "
	read IFACE;
	echo ""
	echo ""
	tcptraceroute -i $IFACE $target
	./tada.sh
else

if [ $o = "4" ]; then
	echo "Enter the Domain name or IP(domain.org)"
	read target
	echo ""
	cd tools
        if [ -d "$target" ]; then
		mkdir $target
	fi
	echo ""
	echo "Select options"
        echo "1. To print the output to screen"
        echo "2. To output to a file"
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
	echo "Enter the Domain name or IP(domain.org)"
	read target
	echo ""
	cd tools
        if [ -d $target ]; then
      		mkdir $target
        fi
	echo ""
	echo "Select options"
	echo "1. To print the output to screen"
	echo "2. To output to a file"
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
	echo "Enter the Domain name or IP (domain.com)"
	read target
	echo ""
	cd tools
	if [ ! -d $target ]; then
		mkdir $target
	fi
	echo ""
	echo "Select options:"
	echo ""
	echo "1. To print the output to screen"i
	echo "2. To output to a file"
	echo ""
	read type
        if [ $type = "1" ]; then	                  	
		nmap -PN -n -F -T4 -sV -A $target
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
	echo "Enter the Domain name or IP (domain.com)"
	read target
	echo ""
	cd tools
	if [ ! -d $target ]; then
		mkdir $target
	fi
	echo ""
        echo "1. To print the output to screen"
	echo "2. To output to a file"
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
