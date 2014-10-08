@echo off
echo Copyright (c) 2014 SBTM Lab. http://sbtm.yonsei.ac.kr/
PUSHD %~dp0
if exist *.img (

	for %%a in (*.img) do (
		set imgname=%%a
		echo %%a ������ ����մϴ�.
		goto break
	)
	:break
	cd qemu
	qemu-system-arm.exe -kernel kernel-qemu -cpu arm1176 -m 256 -M versatilepb -no-reboot -serial stdio -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" -hda ..\%imgname%
	cd ..
) 
if not exist *.img (
echo img������ �����ϴ�.
)
pause