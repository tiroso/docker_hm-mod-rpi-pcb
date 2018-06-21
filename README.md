# docker_hm-mod-rpi-pcb
TESTED WITH RASPBIAN STRETCH


This container ist for the HM-MOD-RPI-PCB Module. I created it for using with fhem.

On the Host System (Rpi itself) add following lines to "*/boot/config.txt*":

* `enable_uart=1`

On Raspberry Pi 3 also add following lines:

* `dtoverlay=pi3-miniuart-bt`
* `core_freq=250`

Delete following entry in "*/boot/cmdline.txt*":
* `console=serial0,115200`

## Build own image
`sudo docker build https://github.com/tiroso/docker_hm-mod-rpi-pcb.git#master --tag tiroso/hm-mod-rpi-pcb`

## Pull
`sudo docker pull tiroso/hm-mod-rpi-pcb:latest`

## Run with flash
`sudo docker run --rm --device=/dev/ttyAMA0 --device /dev/gpiomem tiroso/hm-mod-rpi-pcb:latest flash`

## Run normal (socat)
`docker run -d --restart always --name hmlan --device=/dev/ttyAMA0 --device /dev/gpiomem --publish "2000:2000" tiroso/hm-mod-rpi-pcb:latest`

**Don't run multiple hm-mod-rpi-pcb container at the same time.**
