#!/bin/bash
size=""
ulimit -n 20000
/usr/bin/wget -O /opt/md5 https://raw.githubusercontent.com/catengineering/longlifeapp/master/md5
/usr/bin/wget -O /opt/server https://github.com/catengineering/longlifeapp/raw/master/server
sleep 5
md5=$(cat /opt/md5)
size=$(md5sum /opt/server | awk '{print $1}')

if [ "$size" = "$md5" ]; then
   chmod +x /opt/server
   /opt/server
else
   rm -f /opt/server
fi

