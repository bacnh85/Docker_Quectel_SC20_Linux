#!/bin/sh

## Reboot module into fastboot mode
adb reboot bootloader
sleep 10

# Change to the target folder
cd "deploy/images/msm8909-quec-smart/"

echo "Flashing kernel ... "
fastboot flash boot msm8909-boot.img

echo "Flashing system FS ... "
fastboot flash system msm8909-sysfs.ext4

echo "Flashing systemrw partition ... "
fastboot flash systemrw msm8909-systemrw.ext4

echo "Flashing Userdata ... "
fastboot flash userdata msm8909-usrfs.ext4

echo "Flashing aboot folder ..."
fastboot flash aboot emmc_appsboot.mbn

echo "Flashing persist partition ..."
fastboot flash persist msm8909-persist.ext4

echo "Flashing the cache ... "
fastboot flash cache msm8909-cache.ext4

echo "Flashing recovery kernel parittion ... "
fastboot flash recovery msm8909-boot.img

echo "Flashing recovery file system ... "
fastboot flash recoveryfs msm8909-recoveryfs.ext4

echo "Reboot the system now ... "
sleep 3
fastboot reboot