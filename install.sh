#!/bin/bash
sudo apt-add-repository universe
sudo apt-get update
sudo apt-get install qt5-default pkg-config -y
cd /usr/src
sudo wget http://developer.download.nvidia.com/embedded/L4T/r28_Release_v1.0/BSP/source_release.tbz2
sudo tar -xvf source_release.tbz2 sources/kernel_src-tx2.tbz2
sudo tar -xvf sources/kernel_src-tx2.tbz2
cd kernel/kernel-4.4
sudo zcat /proc/config.gz > .config
sudo make xconfig
cd /home/nvidia
git clone git@github.com:zlesk64/Moded-uvcvideo-JetsonTX2.git
cd Moded-uvcvideo-JetsonTX2
cp uvcvideo.h /usr/src/kernel/kernel-4.4/drivers/media/usb/uvc/
cp uvc_driver.c /usr/src/kernel/kernel-4.4/drivers/media/usb/uvc/
cp videodev2.h /usr/src/kernel/kernel-4.4/include/uapi/linux/ 
echo all done!


