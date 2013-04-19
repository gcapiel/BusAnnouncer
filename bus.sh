#!/bin/bash

./bus.rb
espeak -f bustime.txt --stdout > myaudio && ffmpeg -i myaudio -vn -ar 44100 -ac 2 -ab 192k -f mp3 bustime.mp3

sudo mv bustime.mp3 /var/www/bustime.mp3

curl http://192.168.1.141/bus_time.php
