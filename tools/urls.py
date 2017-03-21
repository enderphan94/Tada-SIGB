#!/usr/bin/python
from sgmllib import SGMLParser
import sys

if len(sys.argv) != 2:
	print "\nUsage : ./urls.py <web-page>            "
	print "Eg: ./urls.py http://www.domain.com          "
        print "\n"
	sys.exit(1)



class URLLister(SGMLParser):
	def reset(self):
		SGMLParser.reset(self)
		self.urls = []

	def start_a(self, attrs):
		href = [v for k, v in attrs if k=='href']
		if href:
			self.urls.extend(href)

if __name__ == "__main__":

	import urllib
	print "\n#####Coded by Ender Phan#####"
	print "\n"
        link = sys.argv[1]
	try:
		usock = urllib.urlopen(link)
		parser = URLLister()
		parser.feed(usock.read())
		parser.close()
		usock.close()
		for url in parser.urls: print url
	except: 
		print "Could not reach "+ sys.argv[1]+ " !"
                print "Put http:// before domain name please!!"
