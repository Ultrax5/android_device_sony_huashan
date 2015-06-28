#!/bin/bash
clear
echo Installing required dependencies...
sleep 3
sudo apt-get update && sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk2.8-dev squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-6-jre openjdk-6-jdk pngcrush schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev lib32readline-gplv2-dev gcc-multilib
cd ../../../vendor/cm
clear
echo Getting Prebuilts...
sleep 3
./get-prebuilts
cd ../../device/sony/huashan/patches
clear
echo Applying Patches to Source Code...
./apply.sh
cd ../../../../
clear
echo Setting up Build Environment...
source build/envsetup.sh
prebuilts/misc/linux-x86/ccache/ccache -M 50G
clear
echo DONE! Run " brunch huashan " to begin building!
