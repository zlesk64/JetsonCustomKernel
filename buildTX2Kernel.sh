#!/bin/bash
#sudo apt-add-repository universe
#sudo apt-get update
#sudo apt-get install qt5-default pkg-config -y
#tar -xvf gcc.tar.xz
export CC=`pwd`/gcc-linaro-7.2.1-2017.11-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
${CC}gcc --version
sudo tar -xvf source_release.tbz2 sources/kernel_src-tx2.tbz2
sudo tar -xvf sources/kernel_src-tx2.tbz2
cd ./kernel/kernel-4.4
#sudo zcat /proc/config.gz > .config
sudo make menuconfig
sudo make prepare
sudo make modules_prepare
sudo make -j6 Image
sudo make modules
sudo make modules_install
echo done!!!
