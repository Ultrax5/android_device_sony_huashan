Sony Xperia SP
==============

![Sony Xperia SP](http://www-static.se-mc.com/blogs.dir/0/files/2014/05/Xperia-SP-so-vivid-1acd201148921bf895e22b13e5bbf931-940.jpg )

The Sony Xperia SP (codenamed _"Huashan"_) is a mid-range smartphone from Sony Mobile Communications AB.

It was announced on 18 March 2013. It is supported in CyanogenMod 10.2, CyanogenMod 11 and CyanogenMod 12

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | 1.7GHz Dual-Core MSM8960T
GPU     | Adreno 320
Memory  | 1GB RAM
Shipped Android Version | 4.1.2
Final Android Version | 4.3
Storage | 8GB
Battery | 2370 mAh
Display | 4.6" 1280 x 720 px
Camera  | 8MPx, LED Flash

This branch is for building CyanogenMod 11 (or Android KitKat 4.4 AOSP based) ROMS for locked bootloader devices.

If you want to build a LBL ROM, you can use my local_manifests git to properly sync up everything.

Then, after doing a repo sync, apply the patches from the tree (cd /home/username/android/device/sony/huashan/patches, ./apply.sh).

After that, just follow the "normal" building instructions.
