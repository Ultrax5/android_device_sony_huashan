Sony Xperia SP
==============

The Sony Xperia SP (codenamed _"HuaShan"_) is a mid-range smartphone from Sony Mobile.

It was announced on 18 March 2013. It is supported in CyanogenMod 10.2 and CyanogenMod 11.

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | 1.7GHz Dual-Core MSM8960T
GPU     | Adreno 320
Memory  | 1GB RAM
Shipped Android Version | 4.1.2
Storage | 8GB
Battery | 2370 mAh
Display | 4.6" 1280 x 720 px
Camera  | 8MPx, LED Flash

![Sony Xperia SP](http://wiki.cyanogenmod.org/images/e/e5/Huashan2.png "Sony Xperia SP in white")

This branch is for building CyanogenMod 11 (or Android KitKat 4.4 AOSP based) ROMS for locked bootloader devices.

If you want to build LBL ROM, you can use my local_manifests git to properly sync up everything.

Then, after doing a repo sync, apply the patches from the tree (cd /home/username/android/device/sony/huashan/patches, ./apply.sh).

After that, just follow "normal" building instructions.

TEMPORARY: If you are building from my cm-11.0 branch, you should chmod 755 the releasetools directory. I'll fix that later.
