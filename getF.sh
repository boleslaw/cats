#!/bin/bash
#Note - need xmlstarlet, can install with (sudo) 'apt-get install xmlstarlet' for x86, arm is more tricky
#http://xmlstar.sourceforge.net/license.php
#this script written for ubuntu 14.04

dd=`date +%F-%H%M`
file=fhot.$dd.xml
outfile=flazy.$dd.html
curl -s 'http://www.reddit.com/r/funny/hot.xml?limit=100' > $file
echo "<html><head><title>lazy $dd</title></head><body>">$outfile
cat $file | /usr/bin/xmlstarlet sel -t -v '/rss/channel/item/description'|grep -v map | while read line
do
	echo "" >>$outfile
	echo $line | xmlstarlet unesc|xmlstarlet sel -t -m '/table/tr/td/a' -v '@href' -n  2>/dev/null |egrep 'jpg|JPG|png|PNG' | while read href
	do
		pc=`echo $href`
		fn=`echo $pc|awk -F'/' '{print $NF}' ` 
		echo $fn
		wget -q $pc
		#cat $fn |base64 --wrap=0 
		bs=`cat $fn | base64 --wrap=0` 
		echo "<img alt=\"$dd top 100\" width=\"600\" src=\"data:image/png;base64,$bs\"></img><br/>" >>$outfile 
		echo $bs |wc
		rm $fn
	done
done
echo '</body></html>'>>$outfile 
rm $file
firefox $outfile
