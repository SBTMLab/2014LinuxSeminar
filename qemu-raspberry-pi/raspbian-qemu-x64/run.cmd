PUSHD %~dp0
cd qemu
qemu-system-arm.exe -kernel kernel-qemu -cpu arm1176 -m 256 -M versatilepb -no-reboot -serial stdio -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" -hda ..\2014-09-09-wheezy-raspbian-qemu.img

pause