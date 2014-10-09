PUSHD %~dp0
echo Copyright (c) 2014 SBTM Lab.
if exist *.img(

for %%a in (*.img) do (
	set imgname=%%a
	goto break
)
:bresk
cd qemu
qemu-system-arm.exe -kernel kernel-qemu -cpu arm1176 -m 256 -M versatilepb -no-reboot -serial stdio -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" -hda ..\%a%
)else(
echo "img 파일이 없습니다"
)
pause