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
echo "                   *    7.  Enumerate ALL               *"; 
echo "                   *    8.  EXIT                        *";
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
        echo "1. To print the output on screen"
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
		echo "The $string is living on ${pw}"
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
	echo "1. To print the output on screen"
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
		echo "The $string is living on ${pw}"
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
	echo "1. To print the output on screen"
	echo "2. To output to a file"
	echo ""
	read type
        if [ $type = "1" ]; then	                  	
		nmap -PN -n -F -T4 -sV -A $target
	else
	if [ $type = "2" ]; then
		string="nmap"
		string="$string$target.xml"
                nmap -PN -n -F -T4 -sV -A $target >> $string 
		mv $string $target
		cd $target
		pw="$(pwd)"
                echo "The $string is living on ${pw}"
		cd ..
	fi
	fi
	cd ..
	echo ""
	./tada.sh
else

if [ $o = "8" ]; then
exit
fi
fi
fi
fi
fi
fi
fi

