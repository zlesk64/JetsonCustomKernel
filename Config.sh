#!/bin/sh
if [ $USER != 'root' ]; then
	echo "This script must be run as root"
	exit
fi
apt install dialog
: ${DIALOG:=dialog}
case "$DIALOG" in
*dialog*)
        OPTS="$OPTS --cr-wrap"
        high=10
        ;;
*whiptail*)
        high=12
        ;;
esac
rows=$(stty size | cut -d' ' -f1)
[ -z "$rows" ] && rows=$high
[ $rows -gt $high ] && rows=$high
cols=$(stty size | cut -d' ' -f2)
$DIALOG --backtitle "Librealsense Config" \
       --title "Configuration for librealsense mod for the jetson TX2" \
       $OPTS \
       --yesno '\nIn order for librealsense to work on the NVIDIA Jetson TX2 you need to copy thes custom uvc video files to the correct directory in the kernel scource.\n\nDo you want to do this?' $rows $((cols - 5))
	response=$?
	case $response in
		0) cp uvcvideo.h /usr/src/kernel/kernel-4.4/drivers/media/usb/uvc/;
			cp uvc_driver.c /usr/src/kernel/kernel-4.4/drivers/media/usb/uvc/;
				cp videodev2.h /usr/src/kernel/kernel-4.4/include/uapi/linux/;
					echo "copyed files run ./buildTX2Kernel.sh to build kernel";;


		1) echo "nothing changed run ./buildTX2Kernel.sh to build kernel";;
	esac
