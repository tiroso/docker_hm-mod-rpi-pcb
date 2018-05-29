#!/bin/sh

set -e

if [ "$1" = "flash" ];
then 
apk add --update --no-cache libusb-dev build-base wget git ca-certificates
cd / && git clone git://git.zerfleddert.de/hmcfgusb hmcfgusb && \
cd /hmcfgusb/
make
if [ "$1" = "newest" ];
then
# Firmware runterladen
wget https://raw.githubusercontent.com/eq-3/occu/HEAD/firmware/HM-MOD-UART/coprocessor_update.eq3;
else
wget https://raw.githubusercontent.com/eq-3/occu/ee68faf77e42ed5e3641790b43a710a3301cea7e/firmware/HM-MOD-UART/coprocessor_update.eq3;
fi;
# eigentliches flashen:
./flash-hmmoduart -U /dev/ttyAMA0 coprocessor_update.eq3;
else
socat TCP4-LISTEN:2000,fork,reuseaddr /dev/ttyAMA0,raw,echo=0,b115200;
fi;
