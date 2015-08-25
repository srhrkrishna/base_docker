#!/bin/sh
exec sudo /etc/init.d/avi_to_mp4.sh start >> /tmp/avi_to_mp4.log 2>&1
exec sudo /etc/init.d/apache2 start
