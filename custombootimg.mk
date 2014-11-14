LOCAL_PATH := $(call my-dir)

uncompressed_ramdisk := $(PRODUCT_OUT)/ramdisk.cpio
$(uncompressed_ramdisk): $(INSTALLED_RAMDISK_TARGET)
	zcat $< > $@

MKELF := device/sony/huashan/tools/mkelf.py
INITSH := $(LOCAL_PATH)/combinedroot/init.sh
BOOTREC_DEVICE := $(TARGET_RECOVERY_ROOT_OUT)/etc/bootrec-device

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
$(INSTALLED_BOOTIMAGE_TARGET): $(PRODUCT_OUT)/kernel $(uncompressed_ramdisk) $(recovery_uncompressed_ramdisk) $(INSTALLED_RAMDISK_TARGET) $(INITSH) $(PRODUCT_OUT)/utilities/busybox $(PRODUCT_OUT)/utilities/extract_elf_ramdisk $(MKBOOTIMG) $(MINIGZIP) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Boot image: $@")

	$(hide) rm -fr $(PRODUCT_OUT)/combinedroot
	$(hide) mkdir -p $(PRODUCT_OUT)/combinedroot/sbin

	$(hide) mv $(PRODUCT_OUT)/root/logo.rle $(PRODUCT_OUT)/combinedroot/logo.rle
	$(hide) cp $(uncompressed_ramdisk) $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp $(recovery_uncompressed_ramdisk) $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp $(PRODUCT_OUT)/utilities/busybox $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp $(PRODUCT_OUT)/utilities/extract_elf_ramdisk $(PRODUCT_OUT)/combinedroot/sbin/

	$(hide) cp $(INITSH) $(PRODUCT_OUT)/combinedroot/sbin/init.sh
	$(hide) chmod 755 $(PRODUCT_OUT)/combinedroot/sbin/init.sh
	$(hide) ln -s sbin/init.sh $(PRODUCT_OUT)/combinedroot/init
	$(hide) cp $(BOOTREC_DEVICE) $(PRODUCT_OUT)/combinedroot/sbin/

	$(hide) $(MKBOOTFS) $(PRODUCT_OUT)/combinedroot/ > $(PRODUCT_OUT)/combinedroot.cpio
	$(hide) cat $(PRODUCT_OUT)/combinedroot.cpio | gzip > $(PRODUCT_OUT)/combinedroot.fs
	$(hide) python $(MKELF) -o $@ $(PRODUCT_OUT)/kernel@0x80208000 $(PRODUCT_OUT)/combinedroot.fs@0x81900000,ramdisk vendor/sony/huashan/proprietary/boot/RPM.bin@0x00020000,rpm device/sony/huashan/rootdir/cmdline.txt@cmdline

	$(hide) ln -f $(INSTALLED_BOOTIMAGE_TARGET) $(PRODUCT_OUT)/boot.elf

	$(hide) rm -fr $(INSTALLED_BOOTIMAGE_TARGET)
	$(hide) rm -fr $(PRODUCT_OUT)/boot.elf
	$(hide) cp -r vendor/sony/huashan/proprietary/kernel/boot.img $(PRODUCT_OUT)

	$(hide) cp -r vendor/sony/huashan/proprietary/lib/modules $(PRODUCT_OUT)/system/lib
	$(hide) cd $(PRODUCT_OUT)/root && chmod 644 `ls $(PRODUCT_OUT)/root` && chmod 755 $(PRODUCT_OUT)/root/data && chmod 755 $(PRODUCT_OUT)/root/dev && chmod 755 $(PRODUCT_OUT)/root/proc && chmod 755 $(PRODUCT_OUT)/root/sbin && chmod 755 $(PRODUCT_OUT)/root/sys && chmod 755 $(PRODUCT_OUT)/root/system && chmod 755 $(PRODUCT_OUT)/root/init && chmod 755 $(PRODUCT_OUT)/root/init.qcom.syspart_fixup.sh && tar -cvf ramdisk.tar `ls $(PRODUCT_OUT)/root`
	$(hide) mv $(PRODUCT_OUT)/root/ramdisk.tar $(PRODUCT_OUT)/system/bin/ramdisk.tar

INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
	$(recovery_ramdisk) \
	$(recovery_kernel)
	@echo ----- Making recovery image ------
	$(hide) python $(MKELF) -o $@ $(PRODUCT_OUT)/kernel@0x80208000 $(PRODUCT_OUT)/ramdisk-recovery.img@0x81900000,ramdisk vendor/sony/huashan/proprietary/boot/RPM.bin@0x00020000,rpm device/sony/huashan/rootdir/cmdline.txt@cmdline
	@echo ----- Made recovery image -------- $@
