#!/bin/sh
sudo iptables -F


myExtIP=$(curl -s http://www.opentlc.com/getip)
myGUID=$(hostname|cut -f2 -d-|cut -f1 -d.)

echo IP: $myExtIP
echo GUID: $myGUID

